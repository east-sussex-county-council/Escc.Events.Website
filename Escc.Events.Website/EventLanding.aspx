<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventLanding.aspx.cs" Inherits="Escc.Events.Website.EventLanding" %>
<%@ Register TagPrefix="template" TagName="authornotes" Src="template/authornotesplaceholder.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="metadata">
	<Egms:MetadataControl id="headContent" runat="server" />
    <Egms:Css runat="server" Files="WhatsOn" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
	<CmsWebAuthor:Console id="CMSConsole" runat="server" />
	<template:authornotes id="authorNotes" runat="server" />

    <div class="article">
    <article>
	    <div class="introSection">
            <div class="text">
	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add the <strong>page title</strong> (required).</p></Cms:AuthoringModeContainer>
	            <h1><CmsPlaceholders:TextPlaceholderControl id="pageTitle" runat="server" placeholdertobind="phDefTitle"></CmsPlaceholders:TextPlaceholderControl></h1>
	
	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add <strong>a list of links</strong> (required).</p></Cms:AuthoringModeContainer>
	        <div id="imageBox" runat="server" class="captionedImage imageOdd"><div class="imageBorder"><div><div><div><CmsPlaceholders:XhtmlImagePlaceholderControl id="image" runat="server" placeholdertobind="phDefImage"></CmsPlaceholders:xhtmlimageplaceholdercontrol></div></div></div></div><p id="imageCaption" runat="server"></p></div>

	            <CmsPlaceholders:RichHtmlPlaceholderControl id="phIntro" runat="server" placeholdertobind="phDefIntro" EditControlWidth="450"></CmsPlaceholders:RichHtmlPlaceholderControl>
            </div>
	    </div>
        <div class="text">
	        <asp:PlaceHolder ID="featured" runat="server">
	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add a heading for <strong>featured events</strong> (optional).</p></Cms:AuthoringModeContainer>
	            <h2><CmsPlaceholders:TextPlaceholderControl id="eventHeading" runat="server" placeholdertobind="phDefSubtitle"></CmsPlaceholders:TextPlaceholderControl></h2>

	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add a <strong>featured event</strong> (optional).</p></Cms:AuthoringModeContainer>
	            <div id="featured1" class="featuredEvent" runat="server">
	            <h3><CmsPlaceholders:RichHtmlPlaceholderControl id="phEventTitle1" runat="server" placeholdertobind="phDefEventTitle1" CssClass="eventTitle" EditControlHeight="50" EditControlWidth="450"></CmsPlaceholders:RichHtmlPlaceholderControl></h3>
                <CmsPlaceholders:XhtmlImagePlaceholderControl ID="eventImage1" runat="server" PlaceholderToBind="phDefEventImage1" CssClass="eventImage" />
                <CmsPlaceholders:RichHtmlPlaceholderControl ID="phEventDescription1" runat="server" PlaceholderToBind="phDefEventDesc1" Paragraphs="true" EditControlHeight="200" EditControlWidth="450" />
                </div>

	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add a second <strong>featured event</strong> (optional).</p></Cms:AuthoringModeContainer>
	            <div id="featured2" class="featuredEvent" runat="server">
	            <h3><CmsPlaceholders:RichHtmlPlaceholderControl ID="phEventTitle2" runat="server" PlaceholderToBind="phDefEventTitle2" CssClass="eventTitle" EditControlHeight="50" EditControlWidth="450" /></h3>
                <CmsPlaceholders:XhtmlImagePlaceholderControl ID="eventImage2" runat="server" PlaceholderToBind="phDefEventImage2" CssClass="eventImage" />
                <CmsPlaceholders:RichHtmlPlaceholderControl ID="phEventDescription2" runat="server" Paragraphs="true" PlaceholderToBind="phDefEventDesc2" EditControlHeight="200" EditControlWidth="450" />
                </div>

	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add a third <strong>featured event</strong> (optional).</p></Cms:AuthoringModeContainer>
	            <div id="featured3" class="featuredEvent" runat="server">
	            <h3><CmsPlaceholders:RichHtmlPlaceholderControl id="phEventTitle3" runat="server" placeholdertobind="phDefEventTitle3" CssClass="eventTitle" EditControlHeight="50" EditControlWidth="450"></CmsPlaceholders:RichHtmlPlaceholderControl></h3>
                <CmsPlaceholders:XhtmlImagePlaceholderControl ID="eventImage3" runat="server" PlaceholderToBind="phDefEventImage3" CssClass="eventImage"  />
                <CmsPlaceholders:RichHtmlPlaceholderControl ID="phEventDescription3" runat="server" Paragraphs="true" PlaceholderToBind="phDefEventDesc3" EditControlHeight="200" EditControlWidth="450" />
                </div>

	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add a fourth <strong>featured event</strong> (optional).</p></Cms:AuthoringModeContainer>
	            <div id="featured4" class="featuredEvent" runat="server">
	            <h3><CmsPlaceholders:RichHtmlPlaceholderControl id="phEventTitle4" runat="server" placeholdertobind="phDefEventTitle4" CssClass="eventTitle" EditControlHeight="50" EditControlWidth="450"></CmsPlaceholders:RichHtmlPlaceholderControl></h3>
                <CmsPlaceholders:XhtmlImagePlaceholderControl ID="eventImage4" runat="server" PlaceholderToBind="phDefEventImage4" CssClass="eventImage"  />
                <CmsPlaceholders:RichHtmlPlaceholderControl ID="phEventDescription4" runat="server" Paragraphs="true" PlaceholderToBind="phDefEventDesc4" EditControlHeight="200" EditControlWidth="450" />
                </div>

	            <Cms:AuthoringModeContainer runat="server" mode="Both"><p class="editHelp">Add a fifth <strong>featured event</strong> (optional).</p></Cms:AuthoringModeContainer>
	            <div id="featured5" class="featuredEvent" runat="server">
	            <h3><CmsPlaceholders:RichHtmlPlaceholderControl id="phEventTitle5" runat="server" placeholdertobind="phDefEventTitle5" CssClass="eventTitle" EditControlHeight="50" EditControlWidth="450"></CmsPlaceholders:RichHtmlPlaceholderControl></h3>
                <CmsPlaceholders:XhtmlImagePlaceholderControl ID="eventImage5" runat="server" PlaceholderToBind="phDefEventImage5" CssClass="eventImage" />
                <CmsPlaceholders:RichHtmlPlaceholderControl ID="phEventDescription5" runat="server" Paragraphs="true" PlaceholderToBind="phDefEventDesc5" EditControlHeight="200" EditControlWidth="450" />
                </div>

            </asp:PlaceHolder>
    
            <Events:DataLinksControl ID="dataLinks" runat="server" ShowHCalendarLink="false" />
        </div>
        
        <CmsTemplates:Related runat="server" />

        <EastSussexGovUK:SocialMediaMobile runat="server" EnableViewState="false" />
        <EastSussexGovUK:Share runat="server" />
    </article>
    </div>

    <EastSussexGovUK:SocialMediaDesktop runat="server" EnableViewState="false" />
</asp:Content>