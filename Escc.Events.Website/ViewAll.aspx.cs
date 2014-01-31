using System;
using System.Collections.Specialized;
using System.Configuration;
using EsccWebTeam.Data.Web;
using EsccWebTeam.Egms;

namespace Escc.Events.Website
{
    public partial class ViewAll : System.Web.UI.Page
    {
        protected EsccWebTeam.NavigationControls.PagingController pagingController;

        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection urlConfig = ConfigurationManager.GetSection("EsccWebTeam.Events/UrlSettings") as NameValueCollection;
            if (urlConfig != null && !String.IsNullOrEmpty(urlConfig["ViewAllRssUrl"]))
            {
                Uri rssUrl = new Uri(Request.Url.Scheme + "://" + Request.Url.Host + urlConfig["ViewAllRssUrl"]);
                this.headContent.RssFeeds.Add(new FeedUrl(rssUrl, "alternate", Properties.Resources.RssViewAllTitle));
                this.dataLinks.RssFeedUrl = rssUrl;
                this.dataLinks.RssFeedTitle = Properties.Resources.RssViewAllTitle;
            }

            // Cache to reduce load because this application can have timeouts, 
            // but not for too long because the data is reasonbably time-sensitive.
            Http.CacheFor(1, 0);
        }
    }
}
