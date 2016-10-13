<%@ Page Language="C#" MasterPageFile="~/Bookstore.Master" AutoEventWireup="true" CodeBehind="mydetails.aspx.cs" Inherits="Bookstore.mydetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="centercontent" runat="server">
<div style="padding:25px"><b>Στοιχεία Χρήστη</b></div><br />

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    
    <ContentTemplate>
    <div class="form">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="verror" runat="server">
                <div class="centermessage">
                    Κάντε κλικ <a href="login.aspx">εδώ</a>&nbspγια να συνδεθείτε και να δείτε τις πληροφορίες σας.
                </div>
            </asp:View>
            
            <asp:View ID="vform" runat="server">
                <div class="centermessage">
                    Τα στοιχεία μου:</div>
                <br />
                
                <!--
                <div class="centermessage">
                    <asp:Label ID="lmessage" runat="server" Text=""></asp:Label>
                </div>
                <br />
                -->
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Όνομα:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbonoma" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Επώνυμο:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbepitheto" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Email:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbemail" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Username:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbusername" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Διεύθυνση:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbaddress" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Τηλέφωνο Επικοινωνίας:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbtilefwno" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            ΤΚ:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbtk" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Πόλη:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbpoli" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Χώρα:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbxwra" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Φύλο:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:Label ID="lbfilo" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <div align="center">
                    <asp:Button ID="bedit" runat="server" Text="Επεξεργασία" OnClick="bedit_Click" />
                    <br />
                </div>
                
            </asp:View>
            
            <asp:View ID="veditform" runat="server">
                <div class="centermessage">
                    Όλα τα πεδία με * είναι υποχρεωτικά</div>
                <br />
                
                <div class="centermessage">
                    <asp:Label ID="l2message" runat="server" Text=""></asp:Label>
                </div>
                <br />
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Όνομα*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="tonoma" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="veonoma" runat="server" ErrorMessage="*" ControlToValidate="tonoma" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Επώνυμο*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="teponimo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="veusername" runat="server" ErrorMessage="*" ControlToValidate="teponimo" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Email*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="temail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="temail" ForeColor="Red" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="vfemail" runat="server" ErrorMessage="invalid email" ControlToValidate="temail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Διεύθυνση*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="tdiefthinsi" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="tdiefthinsi" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Τηλέφωνο Επικοινωνίας*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="ttilefwno" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ttilefwno" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            ΤΚ*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="ttk" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="ttk" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Πόλη*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:TextBox ID="tpoli" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="tpoli" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Χώρα*:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:DropDownList ID="listxwra" runat="server">
                            <asp:ListItem Text="Ελλάδα" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                
                <div class="formrow">
                    <div class="formlabels">
                        <div class="formlabelsin">
                            Φύλο:
                        </div>
                    </div>
                    <div class="forminputs">
                        <asp:RadioButton ID="randras" Text="Άνδρας" runat="server" GroupName="Group1" />
                        <asp:RadioButton ID="rginaika" Text="Γυναίκα" runat="server" GroupName="Group1" />
                    </div>
                </div>
                
                <div align="center">
                    <asp:Button ID="bsave" runat="server" Text="Αποθήκευση" OnClick="bsave_Click" />
                    <br />
                </div>
            </asp:View>
        </asp:MultiView>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
