using System;
using System.Web.UI;
using EsccWebTeam.Events.Common;

namespace Escc.Events.Website.add
{
    /// <summary>
    /// Thank you page to be shown when an event is submitted
    /// </summary>
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1709:IdentifiersShouldBeCasedCorrectly", MessageId = "thanks")]
    public partial class thanks : Page
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, System.EventArgs e)
        {
            EventItem ev = this.newLink.GetEventItem();
            if (ev != null && ev.Submitter != null && ev.Submitter.EmailAddresses.Count > 0)
            {
                this.email.Visible = true;
            }
            else
            {
                this.email.Visible = false;
            }
        }
    }
}
