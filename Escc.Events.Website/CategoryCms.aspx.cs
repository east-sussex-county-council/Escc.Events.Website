using System;
using System.Collections.Specialized;
using System.Configuration;
using EsccWebTeam.Cms;
using EsccWebTeam.Data.Web;
using EsccWebTeam.EastSussexGovUK;
using EsccWebTeam.Egms;
using EsccWebTeam.Events.Common;
using Microsoft.ContentManagement.Publishing;

namespace Escc.Events.Website
{
    /// <summary>
    /// Microsoft Content Management Server 2002 template to display all events in a category
    /// </summary>
    public partial class CategoryCms : System.Web.UI.Page
    {
        protected EsccWebTeam.NavigationControls.PagingController pagingController;
        protected System.Web.UI.WebControls.PlaceHolder controllerHere;

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1806:DoNotIgnoreMethodResults", MessageId = "System.Int32.TryParse(System.String,System.Int32@)")]
        protected void Page_Load(object sender, EventArgs e)
        {
            // Paging links should use CMS published URL
            var siteContext = new EastSussexGovUKContext();
            this.pagingController.PageName = siteContext.RequestUrl.ToString();
            this.pagingController.QueryString = String.Empty;

            // Add controller here rather than on page, because it's the only way to get in and set CategoryId before
            // the controller's OnInit method runs and checks for it.
            using (var controller = new ViewController())
            {
                controller.PagingControllerId = this.pagingController.ID;
                controller.EventListControlId = this.eventList.ID;
                controller.MetadataControlId = "metadata/headContent";
                controller.PageTitleControlId = this.categoryName.ID;
                controller.CategoryListControlId = this.subcategories.ID;

                var prop = CmsUtilities.GetCustomProperty(CmsUtilities.Posting.CustomProperties, "Event category id");
                if (prop != null && prop.Value.Length > 0)
                {
                    int categoryId;
                    Int32.TryParse(prop.Value, out categoryId);
                    controller.CategoryId = categoryId;
                }

                // OnInit runs when we do this...
                this.controllerHere.Controls.Add(controller);
            }

            // Set events RSS and iCalendar links
            NameValueCollection urlConfig = ConfigurationManager.GetSection("EsccWebTeam.Events/UrlSettings") as NameValueCollection;
            if (urlConfig != null && !String.IsNullOrEmpty(urlConfig["ViewAllRssUrl"]))
            {
                Uri rssUrl = new Uri(Request.Url.Scheme + "://" + Request.Url.Host + urlConfig["ViewAllRssUrl"]);
                this.headContent.RssFeeds.Add(new FeedUrl(rssUrl, "alternate", Properties.Resources.RssViewAllTitle));
                this.dataLinks.RssFeedUrl = rssUrl;
                this.dataLinks.RssFeedTitle = Properties.Resources.RssViewAllTitle;
            }

            // Cache to reduce load but not for too long because the data is reasonably time-sensitive.
            if (CmsHttpContext.Current.Mode == PublishingMode.Published) Http.CacheFor(1, 0);
        }
    }
}
