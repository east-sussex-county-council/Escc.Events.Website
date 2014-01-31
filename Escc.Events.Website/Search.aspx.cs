using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Globalization;
using eastsussexgovuk.webservices.TextXhtml.HouseStyle;
using EsccWebTeam.Egms;
using EsccWebTeam.Events.Common;

namespace Escc.Events.Website
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.headContent.RssFeeds.Add(new FeedUrl(new Uri(Request.Url.Scheme + "://" + Request.Url.Host + "/rss/whatson.xml"), "alternate", "What's on - East Sussex County Council"));
        }

        protected void SearchForm_Init(object sender, EventArgs e)
        {
            EventCategoryCollection categories = EventManager.ReadCategories(ConnectionContext.Reader);
            if (categories != null)
            {
                foreach (EventCategory category in categories)
                {
                    this.searchForm.Categories.Add(category);
                }
            }
            this.searchForm.Search += new EventHandler<SearchEventArgs>(SearchForm_Search);
        }

        void SearchForm_Search(object sender, SearchEventArgs e)
        {
            NameValueCollection fileConfig = ConfigurationManager.GetSection("EsccWebTeam.Events/UrlSettings") as NameValueCollection;
            if (fileConfig != null && fileConfig["ViewResultUrl"] != null)
            {
                string startDate = (e.StartDate > DateTime.MinValue) ? DateTimeFormatter.ISODate(e.StartDate) : String.Empty;
                string endDate = (e.EndDate < DateTime.MaxValue) ? DateTimeFormatter.ISODate(e.EndDate) : String.Empty;
                Response.Redirect(String.Format(CultureInfo.InvariantCulture, fileConfig["ViewResultUrl"], e.CategorySelections, e.AudienceSelections, Server.UrlEncode(e.Location), startDate, endDate));
            }
        }
    }
}
