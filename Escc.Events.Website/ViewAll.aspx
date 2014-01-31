<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAll.aspx.cs" Inherits="Escc.Events.Website.ViewAll" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
	    IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    DateCreated="2006-08-09"
		/>
    <Egms:Css runat="server" Files="WhatsOn" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
    <div class="article">
    <section>
        <h1 class="text"><asp:Literal ID="pageTitle" runat="server" /></h1>

	    <Events:ViewController ID="viewController" runat="server" PageTitleControlId="pageTitle" MetadataControlId="metadata/headcontent" PagingControllerId="pagingController" EventListControlId="eventList" />
   	    <NavigationControls:PagingController id="pagingController" runat="server" ResultsTextSingular="event" ResultsTextPlural="events" />
        <NavigationControls:PagingBarControl id="pagingTop" runat="server" PagingControllerId="pagingController" />
        <Events:EventListControl id="eventList" runat="server" NoEventsCssClass="text" />
        <NavigationControls:PagingBarControl ID="pagingBottom" runat="server" PagingControllerId="pagingController" />
        <div class="text"><Events:DataLinksControl id="dataLinks" runat="server" /></div>
	    <EventTemplate:RelatedPages runat="server" />
        <EastSussexGovUK:Share runat="server" />
    </section>
    </div>
</asp:Content>
