<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Bookstore.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="centercontent" runat="server">
    <div class="contentcontainer" align="center">
        <asp:MultiView ID="MultiView1" runat="server">
        
            <asp:View ID="verror" runat="server">
                <div class="centermessage">
                    Κάντε κλικ <a href="login.aspx">εδώ</a>&nbspγια να συνδεθείτε και να δείτε το καλάθι
                    αγορών σας.
                </div>
            </asp:View>
            
            <asp:View ID="orderplaced" runat="server">
                <div class="centermessage">
                    Η παραγγελία ολοκληρώθηκε. Πατήστε <a href="myorders.aspx">εδώ</a>&nbspγια να δείτε
                    τις παραγγελίες σας.
                </div>
            </asp:View>
            
            <asp:View ID="vcart" runat="server">
                <table id="carttable" class="btable" align="center" runat="server">
                    <tr>
                        <td class="btd2">
                            <b>Title</b>
                        </td>
                        <td class="btd3">
                            <b>Quantity</b>
                        </td>
                        <td class="btd3">
                            <b>Price</b>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <b>Total price:
                                <asp:Label ID="ltotalprice" runat="server" Text="0"></asp:Label></b>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Button ID="bbuy" runat="server" Text="Buy" Width="300px" OnClick="bbuy_Click" />
                        </td>
                        <td colspan="2" align="right">
                            <asp:Button ID="bempty" runat="server" Text="Empty the cart" Width="300px" OnClick="bempty_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
