<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="House_Boat_Booking.aspx.cs" Inherits="CUSTOMER_House_Boat_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        text-align: center;
    }
        .auto-style4 {
            width: 99%;
            height: 106px;
        }
        .auto-style5 {
            height: 26px;
            text-align: left;
        }
    .auto-style7 {
        width: 2px;
    }
    .auto-style8 {
        width: 158%;
            height: 651px;
        }
        .auto-style9 {
            width: 27px;
            text-align: left;
        }
        .auto-style10 {
            text-align: left;
        }
        .auto-style11 {
            width: 542px;
            text-align: left;
        }
       
        .auto-style13 {
            text-align: left;
            width: 473px;
        }
        .auto-style14 {
            width: 473px;
        }
        .auto-style15 {
            margin-right: 14px;
        }
       
        .auto-style16 {
            text-align: left;
            width: 473px;
            height: 26px;
        }
        .auto-style17 {
            width: 542px;
            text-align: left;
            height: 26px;
        }
        .auto-style18 {
            width: 27px;
            text-align: left;
            height: 26px;
        }
        .auto-style19 {
            text-align: left;
            width: 5px;
        }
        .auto-style20 {
            height: 26px;
            text-align: left;
            width: 5px;
        }
        .auto-style21 {
            width: 5px;
        }
       
        .auto-style22 {
            width: 27px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style8">
        <tr>
            <td colspan="4"><h2>HOUSEBOAT BOOKING</h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label11" runat="server" Text="Booking ID"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtBookingId" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label1" runat="server" Text="Boat Name"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:DropDownList ID="ddlBoatname" runat="server" OnSelectedIndexChanged="ddlBoatname_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style19">
                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlBoatname" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Select Boat---"></asp:CompareValidator>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label3" runat="server" Text="Customer Name"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtCustomerName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label5" runat="server" Text="Total Adults"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalAdults" runat="server" placeholder="Enter Total Adults"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTotalAdults" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style9">&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label6" runat="server" Text="Total Child"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalChild" runat="server" AutoPostBack="True" OnTextChanged="txtTotalChild_TextChanged" placeholder="Enter Total Child"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTotalChild" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label4" runat="server" Text="Total Member"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalMember" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label22" runat="server" Text="No. of Days"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtNoOfDays" runat="server" placeholder="Enter No of Days"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNoOfDays" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label7" runat="server" Text="From Location"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:DropDownList ID="ddlDepLoc" runat="server" CssClass="auto-style15" Width="85px">
                </asp:DropDownList>
            </td>
            <td class="auto-style19">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlDepLoc" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Location From---"></asp:CompareValidator>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Label ID="Label8" runat="server" Text="To Location"></asp:Label>
            </td>
            <td class="auto-style17">
                <asp:DropDownList ID="ddlArrLoc" runat="server" Width="85px">
                </asp:DropDownList>
            </td>
            <td class="auto-style20">
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlArrLoc" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Location To---"></asp:CompareValidator>
            </td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label19" runat="server" Text="Extra Requeriments"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtExtReq" runat="server" placeholder="Enter Extra Requeriments"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtExtReq" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label20" runat="server" Text="Food Requeriments"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:RadioButtonList ID="rblFoodReq" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label21" runat="server" Text="Expected Budget"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtExpBudget" runat="server" placeholder="Enter Expected Budget"></asp:TextBox>
            </td>
            <td class="auto-style19">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtExpBudget" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label9" runat="server" Text="Advance Payment"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:RadioButtonList ID="rblAdvPayment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblAdvPayment_SelectedIndexChanged" RepeatDirection="Horizontal" Width="168px">
                    <asp:ListItem>CARD</asp:ListItem>
                    <asp:ListItem Value="CARDLESS">CARDLESS</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">
                <asp:TextBox ID="txtRate" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtAdvPay" runat="server" OnTextChanged="txtAdvPay_TextChanged" AutoPostBack="True"></asp:TextBox>
            </td>
            <td class="auto-style21">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAdvPay" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style22">
                <asp:Panel ID="CardPaymentPanel" runat="server" Height="186px" Width="262px">
                    <table class="auto-style4">
                        <tr>
                            <td class="auto-style10">
                                <asp:Label ID="Label23" runat="server" Text="Bank Name"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtBankName" runat="server" placeholder="Enter Bank Name"></asp:TextBox>
                            </td>
                            <td class="auto-style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBankName" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                <asp:Label ID="Label14" runat="server" Text="Payment Type"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtPayType" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label15" runat="server" Text="Card Type"></asp:Label>
                            </td>
                            <td class="auto-style5">
                                <asp:DropDownList ID="ddlCardType" runat="server">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>Debit Card</asp:ListItem>
                                    <asp:ListItem>Credit Card</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style5">
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlCardType" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="--Select--"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                <asp:Label ID="Label16" runat="server" Text="Card Number"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtCardNumber" runat="server" placeholder="Enter Card Number"></asp:TextBox>
                            </td>
                            <td class="auto-style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                <asp:Label ID="Label17" runat="server" Text="Expire Date"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtExpireDate" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                            <td class="auto-style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtExpireDate" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                <asp:Label ID="Label18" runat="server" Text="Advance Amount"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtAdvAmt" runat="server" OnTextChanged="txtAdvAmt_TextChanged" placeholder="Enter Advance Amount"></asp:TextBox>
                            </td>
                            <td class="auto-style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAdvAmt" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style10">
                                <asp:Button ID="btnPayNow" runat="server" OnClick="btnPayNow_Click" Text="PAY NOW" />
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label10" runat="server" Text="Total Amount"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalAmount" runat="server" ReadOnly="True" ></asp:TextBox>
            </td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style11">
                <asp:Button ID="btnBook" runat="server" OnClick="btnBook_Click" Text="Book Now" />
                &nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" />
            </td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

