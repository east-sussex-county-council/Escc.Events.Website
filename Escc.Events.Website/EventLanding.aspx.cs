using System;
using System.Collections.Specialized;
using System.Configuration;
using EsccWebTeam.Cms;
using EsccWebTeam.Egms;


namespace Escc.Events.Website
{
    /// <summary>
    /// Microsoft Content Management Server 2002 template for the events landing page
    /// </summary>
    public partial class EventLanding : CmsTemplate
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CmsUtilities.IsEditing) this.image.Visible = true;
            this.imageBox.Visible = (CmsUtilities.IsEditing || this.image.HasContent);
            CmsUtilities.DisplayImageTextAsCaption("phDefImage", this.imageCaption);

            NameValueCollection urlConfig = ConfigurationManager.GetSection("EsccWebTeam.Events/UrlSettings") as NameValueCollection;
            if (urlConfig != null && !String.IsNullOrEmpty(urlConfig["ViewAllRssUrl"]))
            {
                Uri rssUrl = new Uri(Request.Url.Scheme + "://" + Request.Url.Host + urlConfig["ViewAllRssUrl"]);
                this.headContent.RssFeeds.Add(new FeedUrl(rssUrl, "alternate", Properties.Resources.RssViewAllTitle));
                this.dataLinks.RssFeedUrl = rssUrl;
                this.dataLinks.RssFeedTitle = Properties.Resources.RssViewAllTitle;
            }

            this.featured1.Visible = (CmsUtilities.IsEditing || this.phEventTitle1.HasContent);
            this.featured2.Visible = (CmsUtilities.IsEditing || this.phEventTitle2.HasContent);
            this.featured3.Visible = (CmsUtilities.IsEditing || this.phEventTitle3.HasContent);
            this.featured4.Visible = (CmsUtilities.IsEditing || this.phEventTitle4.HasContent);
            this.featured5.Visible = (CmsUtilities.IsEditing || this.phEventTitle5.HasContent);
            this.featured.Visible = (CmsUtilities.IsEditing || (this.eventHeading.HasContent && (this.featured1.Visible || this.featured2.Visible || this.featured3.Visible || this.featured4.Visible || this.featured5.Visible)));
        }
    }
}
