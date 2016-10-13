<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Bookstore.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="centercontent" runat="server">

<div style="padding:25px"><b>Είσοδος Χρήστη</b></div><br />

    <div class="form">
        
        <asp:MultiView ID="multiview" runat="server">
            <asp:View ID="View1" runat="server">
            </asp:View>
        
            <asp:View ID="error" runat="server">
                <div class="centermessage" style="color:Red">
                    Είστε είδη συνδεδεμένος/η
                </div>
                <br />
            </asp:View>
        
            <asp:View ID="form" runat="server">
                <div class="centermessage">
                    <asp:Label ID="lmessage" runat="server" Text=""></asp:Label>
                </div>
                <br />
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="tusername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="veusername" runat="server" ErrorMessage="*" ControlToValidate="tusername" ForeColor="Red" ></asp:RequiredFieldValidator> 
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="tpassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vepassword" runat="server" ErrorMessage="*" ControlToValidate="tpassword" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div align="center">
                    <asp:Button ID="blogin" runat="server" Text="Είσοδος" OnClick="blogin_Click" />
                    <br />
                </div>
                <br />
                <br />
                
                <div class="centermessage">
                    Ξεχάσατε τον Κωδικό σας; Πατήστε
                    <asp:LinkButton ID="lbrecpass" runat="server" OnClick="lbrecpass_Click" CausesValidation="false">Εδώ</asp:LinkButton>
                    &nbspγια να το στείλουμε στο e-mail σας.
                </div>
                <br />
                <br />
                
                <div class="centermessage">
                    Δεν έχετε λογαριασμό; Πατήστε
                    <asp:LinkButton ID="lbregister" runat="server" OnClick="lbregister_Click" CausesValidation="false">Εδώ</asp:LinkButton>
                    &nbspγια εγγραφή.
                </div>
            </asp:View>
        </asp:MultiView>
        
    </div>
</asp:Content>
