<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="recpass.aspx.cs" Inherits="Bookstore.recpass" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="centercontent" runat="server">
    <div style="padding:25px"><b>Υπενθύμηση κωδικού χρήστη</b></div><br />

    <div class="form">
        <!--
        <div class="formmessage">Όλα τα πεδία με * είναι υποχρεωτικά</div>
        <br />
        -->
        
        <div class="centermessage">
            <asp:Label ID="lmessage" runat="server" Text=""></asp:Label>
        </div>
        <br />
        
        <div class="formrow">
            <div class="formlabels">
                <div class="formlabelsin">
                    <asp:Label ID="lemail" runat="server" Text="Email:"></asp:Label>
                </div>
            </div>
            <div class="forminputs">
                <asp:TextBox ID="temail" runat="server"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:Button ID="bsend" runat="server" Text="Αποστολή" onclick="bsend_Click" />
            </div>
        </div>
    </div>
</asp:Content>
