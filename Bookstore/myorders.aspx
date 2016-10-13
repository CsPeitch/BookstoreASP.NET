<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="myorders.aspx.cs" Inherits="Bookstore.myorders" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="centercontent" runat="server">
    <div id="maindiv" class="contentcontainer" align="center">
        <asp:MultiView ID="multiview" runat="server">
            <asp:View ID="verror" runat="server">
                <div class="centermessage">
                    Πατήστε <a href="login.aspx">εδώ</a>&nbspγια να συνδεθείτε.
                </div>
            </asp:View>
            <asp:View ID="vorders" runat="server">
                <div class="centermessage">
                    <b>Οι παραγγελίες μου:</b>
                </div>
                <br />
                <!-- code generated content here -->
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
