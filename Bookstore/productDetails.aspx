<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="Bookstore.WebForm1" Title="Untitled Page" %>
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
    
    <div style="width:80%">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="productsById">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="productsById" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
            TypeName="Bookstore.maindataTableAdapters.productTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="pid" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <br />
    
    
    <div class="centermessage">
        Quantity: 
        <asp:TextBox ID="tquantity" runat="server" Text="1" Width="40px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tquantity"></asp:RequiredFieldValidator>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="baddtocart" runat="server" Text="Add to cart" 
            onclick="baddtocart_Click" />
    </div>
    
    <div class="centermessage">
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="allowed values 1-100" MinimumValue="1" MaximumValue="100" Type="Integer" ForeColor="Red" ControlToValidate="tquantity"></asp:RangeValidator>     
    </div>
    
</div>
</asp:Content>
