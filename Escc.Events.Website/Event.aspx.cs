using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Text;
using eastsussexgovuk.webservices.TextXhtml.HouseStyle;
using EsccWebTeam.Data.Web;
using EsccWebTeam.EastSussexGovUK;
using EsccWebTeam.Egms;
using EsccWebTeam.Events.Common;

namespace Escc.Events.Website
{
    /// <summary>
    /// Summary description for Event.
    /// </summary>
    public partial class Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            EventItem ev = this.eventDetail.GetEventItem();
            if (ev != null)
            {
                this.headContent.Title = Server.HtmlEncode(ev.Title);
                this.headContent.DateCreated = DateTimeFormatter.ISODate(ev.DateCreated);
                this.headContent.DateIssued = DateTimeFormatter.ISODate(ev.DateApproved);
                this.headContent.DateModified = DateTimeFormatter.ISODate(ev.DateModified);
                this.headContent.DateAutoRemove = DateTimeFormatter.ISODate(ev.DateEnd);
                this.dataLinks.Visible = !ev.HasFinished;

                StringBuilder ipsvPreferred = new StringBuilder(this.headContent.IpsvPreferredTerms);
                StringBuilder ipsvNonPreferred = new StringBuilder(this.headContent.IpsvNonPreferredTerms);

                foreach (EventCategory cat in ev.Categories)
                {
                    cat.IpsvPreferredTerms.AppendText(ipsvPreferred);
                    cat.IpsvNonPreferredTerms.AppendText(ipsvNonPreferred);
                }
                this.headContent.IpsvPreferredTerms = ipsvPreferred.ToString();
                this.headContent.IpsvNonPreferredTerms = ipsvNonPreferred.ToString();

                if (ev.DateEnd.AddDays(Convert.ToDouble(30)) < DateTime.Now)
                {
                    EastSussexGovUKContext.HttpStatus310Gone(this.content);
                }

            }
            else
            {
                EastSussexGovUKContext.HttpStatus404NotFound(this.content);
            }

            NameValueCollection urlConfig = ConfigurationManager.GetSection("EsccWebTeam.Events/UrlSettings") as NameValueCollection;
            if (urlConfig != null && !String.IsNullOrEmpty(urlConfig["ViewAllRssUrl"]))
            {
                Uri rssUrl = new Uri(Request.Url.Scheme + "://" + Request.Url.Host + urlConfig["ViewAllRssUrl"]);
                this.headContent.RssFeeds.Add(new FeedUrl(rssUrl, "alternate", Escc.Events.Website.Properties.Resources.RssViewAllTitle));
                this.dataLinks.RssFeedUrl = rssUrl;
                this.dataLinks.RssFeedTitle = Escc.Events.Website.Properties.Resources.RssViewAllTitle;
                this.dataLinks.HCalendarText = Escc.Events.Website.Properties.Resources.hCalendarLinkTextSingular;
            }

            // Cache to reduce load because this application can have timeouts, 
            // but not for too long because the data is reasonbably time-sensitive.
            Http.CacheFor(1, 0);
        }
    }
}
