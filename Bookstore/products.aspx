<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Bookstore.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" runat="server">
    <div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="products.aspx?catid={0}" DataTextField="Name" 
                HeaderText="Κατηγορίες βιβλίων:" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="Bookstore.maindataTableAdapters.categoryTableAdapter">
    </asp:ObjectDataSource>
</div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="centercontent" runat="server">
    <div class="contentcontainer" align="center">

    <div class="centermessage">
        <asp:Label ID="lmessage" runat="server" Text=""></asp:Label>
    </div>
    <br />
    
    <div style="width:80%">
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:HyperLinkField DataNavigateUrlFields="ID" 
                    DataNavigateUrlFormatString="productDetails.aspx?pid={0}" HeaderText="Details" 
                    Text="show details" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ebookstoredbConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ebookstoredbConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [Title], [Description], [Price] FROM [product] WHERE ([Category] = ?) ORDER BY [ID]">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="Category" 
                    QueryStringField="catid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
</div>
</asp:Content>
