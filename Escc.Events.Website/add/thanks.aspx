<%@ Page language="c#" Codebehind="thanks.aspx.cs" AutoEventWireup="True" Inherits="Escc.Events.Website.add.thanks" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="../RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
		Title="Thank you"
	    IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    LgilType="Applications for service"
	    IsInSearch="false"
	    DateCreated="2006-07-17"
		/>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
<div class="article">
<section>
    <div class="text">
	    <h1>Thank you</h1>
	
	    <p>Your event has been submitted to our editors for review, and should be published within 2&#8211;3 working days.
	    <asp:literal ID="email" runat="server" Text="You will get an email to let you know when this has been done." />
	    </p>
	
	    <p>If there is a problem we will contact you within four working days.</p>
	    <p>If you need to make changes to events that you have submitted, please <a href="http://<%= Request.Url.Host %>/contactus/default.htm">contact the web team</a>.</p>
	
	    <Events:WorkflowController ID="workflow" runat="server" ConnectAs="submitter" EventControlIds="newLink" WorkflowStage="SubmitThanks" />
	    <Events:NewEventLink id="newLink" runat="server" />
    </div>
	<EventTemplate:RelatedPages runat="server" />
</section>
</div>
</asp:Content>
