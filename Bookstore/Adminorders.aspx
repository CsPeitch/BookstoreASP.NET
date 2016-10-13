<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="Adminorders.aspx.cs" Inherits="Bookstore.Adminorders" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="centercontent" runat="server">
<div align="center" style="width:100%; padding-top:45px; padding-bottom:45px">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
			
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="verror" runat="server">
            <div class="centermessage" >
                Πατήστε <a href="login.aspx">εδώ</a>&nbspγια να συνδεθείτε.
            </div>
        </asp:View>
        
        <asp:View ID="verror2" runat="server">
            <div class="centermessage" style="color:Red">
                Η σελίδα απαιτεί δικαιώματα διαχειριστή.
            </div>
        </asp:View>
    
        <asp:View ID="vtable" runat="server">
        
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" DataKeyNames="ID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="AdminShowOrderDetails.aspx?oid={0}" 
                DataTextField="ID" DataTextFormatString="{0}" HeaderText="ID" />
            <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
            <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname" />
            <asp:BoundField DataField="oDate" HeaderText="oDate" SortExpression="oDate" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="DeleteQuery"  
        SelectMethod="GetData" 
        TypeName="Bookstore.maindataTableAdapters.customerordersTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    </asp:View>
    </asp:MultiView>
    </ContentTemplate>

    </asp:UpdatePanel>
</div>
</asp:Content>
