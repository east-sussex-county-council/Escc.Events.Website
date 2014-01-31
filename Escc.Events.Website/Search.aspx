<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Escc.Events.Website.Search" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
	    IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    Title="Search events"
	    Description="Find out what's on in your town, or about your favourite subject"
	    DateCreated="2006-08-11"
		/>
    <Egms:Css runat="server" Files="FormsSmall" />
    <EastSussexGovUK:ContextContainer runat="server" Desktop="true">
        <Egms:Css runat="server" Files="FormsMedium" MediaConfiguration="Medium" />
        <Egms:Css runat="server" Files="FormsLarge" MediaConfiguration="Large" />
    </EastSussexGovUK:ContextContainer>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
    <div class="article">
    <section>
        <h1 class="text">Search events</h1>
        
        <div class="form short-form">
            <p><a href="viewall.aspx">View all events</a></p>
            <fieldset>
                <legend class="or">or search for an event:</legend>
                <Events:SearchControl ID="searchForm" runat="server" OnInit="SearchForm_Init" />
            </fieldset>
        </div>

        <p class="text">Although every effort is taken to make sure details of events are correct, East Sussex County Council cannot be held responsible for any changes. 
        To avoid disappointment, please check with the event organisers before setting out.</p>

	    <EventTemplate:RelatedPages runat="server" />
        <EastSussexGovUK:Share runat="server" />
    </section>
    </div>
</asp:Content>
