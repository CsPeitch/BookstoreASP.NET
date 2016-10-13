<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="Admincategories.aspx.cs" Inherits="Bookstore.Admincategories" Title="Untitled Page" %>
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
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
                DataSourceID="ObjectDataSource1" InsertItemPosition="LastItem">
                <ItemTemplate>
                    <li style="background-color: #DCDCDC;color: #000000;">ID:
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        <br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                    </li>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <li style="background-color: #FFF8DC;">ID:
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        <br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                    </li>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </li>
                </InsertItemTemplate>
                <LayoutTemplate>
                    <ul ID="itemPlaceholderContainer" runat="server" 
                        style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <li ID="itemPlaceholder" runat="server" />
                        </ul>
                        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <EditItemTemplate>
                        <li style="background-color: #008A8C;color: #FFFFFF;">ID:
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </li>
                    </EditItemTemplate>
                    <ItemSeparatorTemplate>
                        <br />
                    </ItemSeparatorTemplate>
                    <SelectedItemTemplate>
                        <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">ID:
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                        </li>
                    </SelectedItemTemplate>
            </asp:ListView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="Bookstore.maindataTableAdapters.categoryTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Original_ID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
    </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>
