<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Escc.Events.Website.Category" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
	    IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
	    DateCreated="2006-08-10"
		/>
    <Egms:Css runat="server" Files="WhatsOn" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
    <div class="article">
    <section>
        <h1 class="text"><asp:Literal ID="categoryName" runat="server" /></h1>

   	    <Events:ViewController ID="viewController" runat="server" PagingControllerId="pagingController" EventListControlId="eventList" MetadataControlId="metadata/headcontent" PageTitleControlId="categoryName" CategoryListControlId="subCategories" />
   	    <NavigationControls:PagingController id="pagingController" runat="server" ResultsTextSingular="event" ResultsTextPlural="events" />
   	    <div class="text"><Events:CategoryListControl ID="subcategories" runat="server" /></div>
        <NavigationControls:PagingBarControl id="pagingTop" runat="server" PagingControllerId="pagingController" />
        <Events:EventListControl id="eventList" runat="server" NoEventsCssClass="text" />
        <NavigationControls:PagingBarControl ID="pagingBottom" runat="server" PagingControllerId="pagingController" />
        <div class="text"><Events:DataLinksControl id="dataLinks" runat="server" /></div>
	    <EventTemplate:RelatedPages runat="server" />
        <EastSussexGovUK:Share runat="server" />
    </section>
    </div>
</asp:Content>