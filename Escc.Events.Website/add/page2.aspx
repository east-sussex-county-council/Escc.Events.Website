<%@ Page language="c#" Codebehind="page2.aspx.cs" AutoEventWireup="True" Inherits="Escc.Events.Website.add.page2" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="../RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
		Title="When will the event take place?"
		IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    LgilType="Applications for service"
        IsInSearch="false"
        DateCreated="2006-06-06"
		/>
    <Egms:Css runat="server" Files="FormsSmall;WhatsOn" />
    <EastSussexGovUK:ContextContainer runat="server" Desktop="true">
        <Egms:Css runat="server" Files="FormsMedium" MediaConfiguration="Medium" />
        <Egms:Css runat="server" Files="FormsLarge" MediaConfiguration="Large" />
    </EastSussexGovUK:ContextContainer>
	<Egms:Script Files="EventRecurrence" runat="server" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
<div class="full-page">
<section>
	<div class="text">
    	<h1>When will the event take place?</h1>
	    <NavigationControls:ProgressBarControl runat="server" CurrentStage="2" />

        <div class="form service-form">
	        <Events:WorkflowController id="workflow" runat="server" ConnectAs="Submitter" EventControlIds="dateEdit" WorkflowStage="SubmitDate" NextButtonId="submit" />
	        <Events:DateEditControl id="dateEdit" runat="server" BreakLegends="false" />
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