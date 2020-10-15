<%@ Page language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <%--<script type="text/javascript" src="../Scripts/NewItem.js"></script>--%>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Urlaubsplanung - Neues Element erstellen
</asp:Content>

<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
   
     <WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="WebPartZone">
        <WebPartPages:XsltListViewWebPart ID="XsltListViewWebPart_AppWeb_New" 
            runat="server" ListUrl="Lists/Urlaubsliste"> 
        </WebPartPages:XsltListViewWebPart>  
    </WebPartPages:WebPartZone>
   <%-- <table>
        <tr>
            <td>Titel*: </td>
            <td><input id="inTitle" type="text" /></td>
        </tr>
        <tr>
            <td>Name*: </td>
            <td><input id="inName" type="text" /></td>
        </tr>
        <tr>
            <td>Vorname*: </td>
            <td><input id="inVorname" type="text" /></td>
        </tr>
        <tr>
            <td>Von*: </td>
            <td><input id="inVon" type="text" /></td>
        </tr>
        <tr>
            <td>Bis*: </td>
            <td><input id="inBis" type="text" /></td>
        </tr>
        <tr>
            <td>Bemerkung: </td>
            <td><input id="inBemerkung" type="text" /></td>
        </tr>
    </table>
    <hr />
    <input id="btnSaveItem" type="button" value="Element speichern" onclick="saveItem()"/>--%>

</asp:Content>
