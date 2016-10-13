<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="Admincustomers.aspx.cs" Inherits="Bookstore.Admincustomers" Title="Untitled Page" %>
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
                    <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                    <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname" />
                    <asp:BoundField DataField="Address" HeaderText="Address" 
                        SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="access" HeaderText="access" 
                        SortExpression="access" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="poli" HeaderText="poli" SortExpression="poli" />
                    <asp:BoundField DataField="xwra" HeaderText="xwra" SortExpression="xwra" />
                    <asp:BoundField DataField="filo" HeaderText="filo" SortExpression="filo" />
                    <asp:BoundField DataField="tk" HeaderText="tk" SortExpression="tk" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DeleteMethod="DeleteQuery" InsertMethod="InsertQuery" 
                 SelectMethod="GetDataBy4" 
                TypeName="Bookstore.maindataTableAdapters.custDetailsTableAdapter" 
                UpdateMethod="UpdateQuery">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Fname" Type="String" />
                    <asp:Parameter Name="Lname" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="access" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="poli" Type="String" />
                    <asp:Parameter Name="xwra" Type="Int32" />
                    <asp:Parameter Name="filo" Type="Int32" />
                    <asp:Parameter Name="tk" Type="String" />
                    <asp:Parameter Name="Original_ID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Fname" Type="String" />
                    <asp:Parameter Name="Lname" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="uname" Type="String" />
                    <asp:Parameter Name="passwd" Type="String" />
                    <asp:Parameter Name="access" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="poli" Type="String" />
                    <asp:Parameter Name="xwra" Type="Int32" />
                    <asp:Parameter Name="filo" Type="Int32" />
                    <asp:Parameter Name="tk" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
    </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>
