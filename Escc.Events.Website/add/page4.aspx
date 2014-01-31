<%@ Page language="c#" Codebehind="page4.aspx.cs" AutoEventWireup="True" Inherits="Escc.Events.Website.add.page4" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="../RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
		Title="Contact details"
		IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    LgilType="Applications for service"
        IsInSearch="false"
        DateCreated="2006-06-06"
		/>
    <Egms:Css runat="server" Files="FormsSmall" />
    <EastSussexGovUK:ContextContainer runat="server" Desktop="true">
        <Egms:Css runat="server" Files="FormsMedium" MediaConfiguration="Medium" />
        <Egms:Css runat="server" Files="FormsLarge" MediaConfiguration="Large" />
    </EastSussexGovUK:ContextContainer>
    <Egms:Script Files="EventContacts" runat="server" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
<div class="full-page">
<section>
	<div class="text">
    	<h1>Contact details</h1>
	    <NavigationControls:ProgressBarControl runat="server" CurrentStage="4" />
    	<p>Please add details for people to get more information or tickets.</p>

        <div class="form service-form">	
	        <Events:ContactEditControl id="publicEdit" runat="server" QuestionID="1" />
	
	        <h2>Enter your contact details, just for us</h2>
	        <p>Please enter your own contact details. Before we publish this event, we may need to get in touch with you to clarify any questions 
	        we have about the details you enter. These details will not display on the website.</p>
	        <Events:ContactEditControl ID="submitterEdit" runat="server"  QuestionID="2" UsePublicContact="false" CopyOption="true" CopyContactId="publicEdit"  />
	        <div class="formButtons">
                <FormControls:EsccButton id="submit" runat="server" cssclass="button" text="Next" />
            </div>
	        <%-- Note: Controller must be below ContactEditControl to work correctly --%>
	        <Events:WorkflowController id="workflow" runat="server" ConnectAs="Submitter" EventControlIds="publicEdit;submitterEdit" WorkflowStage="SubmitContact" NextButtonId="submit" />
        </div>
    </div>
	<EventTemplate:RelatedPages runat="server" />
</section>
</div>
</asp:Content>

<asp:content runat="server" ContentPlaceHolderID="supporting" />