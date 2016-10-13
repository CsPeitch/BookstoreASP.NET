<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="Adminproducts.aspx.cs" Inherits="Bookstore.Adminproducts" Title="Untitled Page" %>
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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Category" HeaderText="Category" 
                        SortExpression="Category" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy2" 
                TypeName="Bookstore.maindataTableAdapters.productTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="Single" />
                    <asp:Parameter Name="Category" Type="Int32" />
                    <asp:Parameter Name="Original_ID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="Single" />
                    <asp:Parameter Name="Category" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
