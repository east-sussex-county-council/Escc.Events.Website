<%@ Page language="c#" Codebehind="confirm.aspx.cs" AutoEventWireup="True" Inherits="Escc.Events.Website.add.confirm" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="../RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
		Title="Submit your event"
		IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    LgilType="Applications for service"
        IsInSearch="false"
        DateCreated="2006-07-17"
		/>
    <Egms:Css runat="server" Files="FormsSmall;WhatsOn" />
    <EastSussexGovUK:ContextContainer runat="server" Desktop="true">
        <Egms:Css runat="server" Files="FormsMedium" MediaConfiguration="Medium" />
        <Egms:Css runat="server" Files="FormsLarge" MediaConfiguration="Large" />
    </EastSussexGovUK:ContextContainer>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
<div class="full-page">
<section>
    <div class="text">
	    <h1>Check and submit your event</h1>
	    <NavigationControls:ProgressBarControl runat="server" CurrentStage="5" />
	
	    <p>Thank you. You've nearly finished. You can see below how your event will appear in full on our site. 
	    Please check that you're happy with the details, then click Submit. 
	    If you want to make changes before you submit, use the links at the bottom of this page.</p>
	
	    <div class="roundedBox"><div><div><div>
	    <Events:EventControl id="eventDetail" runat="server" TitleHeadingLevel="2" />
	    </div></div></div></div>
	
	    <h2>Your details, just for us (will not display on the website)</h2>
	    <Events:ContactControl ID="submitter" runat="server" UsePublicContact="false" />
	
	    <h2>Need to edit your event?</h2>
	    <Events:ConfirmEventLink id="confirmLink" runat="server" />
	
	    <div class="formButtons">
	    <FormControls:EsccButton id="submit" runat="server" text="Submit" CssClass="button" />
	    </div>

	    <%-- Note: Controller should stay at the bottom to work correctly --%>
	    <Events:WorkflowController id="workflow" runat="server" ConnectAs="Submitter" EventControlIds="eventDetail;submitter;pattern;confirmLink" WorkflowStage="SubmitConfirm" NextButtonId="submit" />
    </div>

	<EventTemplate:RelatedPages runat="server" />
</section>
</div>	
</asp:Content>

<asp:content runat="server" ContentPlaceHolderID="supporting" />