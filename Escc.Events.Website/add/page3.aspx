<%@ Page language="c#" Codebehind="page3.aspx.cs" AutoEventWireup="True" Inherits="Escc.Events.Website.add.page3" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="../RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
		Title="Where will the event take place?"
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
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
<div class="full-page">
<section>
	<div class="text">
    	<h1>Where will the event take place?</h1>
	    <NavigationControls:ProgressBarControl runat="server" CurrentStage="3" />
	    <p>Please specify where the event will take place. If the event location has an East Sussex postcode, 
	    type in in the text box below and use the 'Find Address' button to complete your address details. 
	    If not, you can type in the address yourself.</p>

        <div class="form service-form">	
	        <Events:VenueEditControl id="venueEdit" runat="server" SingleGroup="true" />
	        <div class="formButtons">
                <FormControls:EsccButton id="submit" runat="server" cssclass="button" text="Next" />
            </div>
	        <%-- Note: Controller must be below the VenueControl to work --%>
	        <Events:WorkflowController id="workflow" runat="server" ConnectAs="Submitter" EventControlIds="venueEdit" WorkflowStage="SubmitVenue" NextButtonId="submit" />
        </div>
    </div>
	<EventTemplate:RelatedPages runat="server" />
</section>
</div>
</asp:Content>

<asp:content runat="server" ContentPlaceHolderID="supporting" />