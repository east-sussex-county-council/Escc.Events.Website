<%@ Page language="c#" Codebehind="Event.aspx.cs" AutoEventWireup="True" Inherits="Escc.Events.Website.Event" EnableViewState="false" %>
<%@ Register TagPrefix="EventTemplate" TagName="RelatedPages" Src="RelatedPages.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" 
	    Title="Event not found"
        DateCreated="2008-04-11"
        IpsvPreferredTerms="What's on"
	    IpsvNonPreferredTerms="Diary of events; Events diary"
	    LgtlType="Diary or calendar"
		/>
    <Egms:Css runat="server" Files="WhatsOn" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
	<div class="article">
    <article>
	    <Events:ViewController ID="viewController" runat="server" EventControlIds="eventDetail" RequireEvent="true" />
	    
        <asp:placeholder runat="server" id="content">
        <div class="text">
            <Events:EventControl id="eventDetail" runat="server" />
            <Events:DataLinksControl ID="dataLinks" runat="server" />
        </div>
        </asp:placeholder>

   	    <EventTemplate:RelatedPages runat="server" />

        <EastSussexGovUK:Share runat="server" />
    </article>
    </div>
</asp:Content>