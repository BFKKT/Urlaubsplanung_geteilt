<%-- Die folgenden vier Zeilen sind ASP.NET-Direktiven, die bei der Verwendung von SharePoint-Komponenten erforderlich sind. --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- Markup und Skript im folgenden Inhaltselement werden im <head> der Seite platziert. --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <%--<script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>--%>
    <script type="text/javascript" src="../Scripts/gantt/jquery.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Fügen Sie Ihre CSS-Stile der folgenden Datei hinzu. -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/gantt/style.css" />

    <!-- Fügen Sie Ihr JavaScript der folgenden Datei hinzu. -->
    <script type="text/javascript" src="../Scripts/gantt/jquery.fn.gantt.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>

</asp:Content>

<%-- Das Markup im folgenden Inhaltselement wird im TitleArea der Seite platziert. --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Urlaubsplanung
</asp:Content>

<%-- Markup und Skript im folgenden Inhaltselement werden im <body> der Seite platziert. --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div>
        <p id="message">
           Urlaubsplanung
        </p>
        <input id="btnNewItem" type="button" value="Neues Element" onclick="window.location='NewItem.aspx';"/>

        <div class="gantt"></div>

    </div>

</asp:Content>
