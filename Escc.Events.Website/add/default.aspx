<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="True" Inherits="Escc.Events.Website.add.Default" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="../RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
		Title="Add an event"
		IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    LgilType="Applications for service"
        DateCreated="2006-06-06"
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
        <h1>Add an event</h1>
	    <NavigationControls:ProgressBarControl runat="server" CurrentStage="1" />
	    <p>Add an event to our website. We will review the details you submit, and put them online within three working days.</p>

        <div class="form service-form">
	        <Events:WorkflowController id="workflow" runat="server" ConnectAs="Submitter" EventControlIds="eventEdit" RequireEvent="false" NextButtonId="submit" WorkflowStage="SubmitOverview" />
	        <Events:OverviewEditControl id="eventEdit" runat="server" EnableViewState="false" BreakLegends="false" />
	        <div class="formButtons">
                <FormControls:EsccButton id="submit" runat="server" cssclass="button" text="Next" />
            </div>
        </div>
    </div>
	<EventTemplate:RelatedPages runat="server" />
</section>
</div>
</asp:Content>

<asp:content runat="server" ContentPlaceHolderID="supporting" />