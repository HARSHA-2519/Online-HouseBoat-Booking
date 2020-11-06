<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="House_Boat_Booking_Package.aspx.cs" Inherits="CUSTOMER_House_Boat_Booking_Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            height: 24px;
        }
        .auto-style4 {
            width: 99%;
            height: 106px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 28px;
        }
        .auto-style7 {
            height: 24px;
            width: 28px;
        }
        .auto-style8 {
            width: 603px;
        }
        .auto-style9 {
            width: 165px;
        }
        .auto-style10 {
            height: 24px;
            width: 165px;
        }
        .auto-style11 {
            text-align: left;
        }
        .auto-style12 {
            width: 165px;
            text-align: left;
        }
        .auto-style13 {
            width: 165px;
            text-align: left;
            height: 26px;
        }
        .auto-style14 {
            text-align: left;
            height: 26px;
        }
        .auto-style15 {
            width: 28px;
            height: 26px;
        }
    </style>
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style8" >
        <tr>
            <td colspan="4"><h2 class="auto-style2">HOUSEBOAT BOOKING</h2></td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label11" runat="server" Text="Booking ID"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtBookingId" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label1" runat="server" Text="Boat Name"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txtBoatName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:Label ID="lblBoatName" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style15"></td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label2" runat="server" Text="Package Name"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtPackaName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label3" runat="server" Text="Customer Name"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtCustomerName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label5" runat="server" Text="Total Adults"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalAdults" runat="server" placeholder="Enter Total Adults"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label6" runat="server" Text="Total Child"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalChild" runat="server" AutoPostBack="True" OnTextChanged="txtTotalChild_TextChanged" placeholder="Enter Total Child"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label4" runat="server" Text="Total Member"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalMember" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label7" runat="server" Text="From Date"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" AutoPostBack="True" OnTextChanged="txtFromDate_TextChanged"></asp:TextBox>
                <asp:Label ID="lblFr" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label8" runat="server" Text="To Date"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtToDate" runat="server" AutoPostBack="True" ></asp:TextBox>
                <asp:Label ID="lblTo" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTo" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblDays" runat="server"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label9" runat="server" Text="Advance Payment"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:RadioButtonList ID="rblAdvPayment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblAdvPayment_SelectedIndexChanged" RepeatDirection="Horizontal" Width="168px">
                    <asp:ListItem>CARD</asp:ListItem>
                    <asp:ListItem Value="CARDLESS">CARDLESS</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style11">
                <asp:TextBox ID="txtAdvPay" runat="server" OnTextChanged="txtAdvPay_TextChanged" AutoPostBack="True"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:Panel ID="CardPaymentPanel" runat="server" Height="190px" Width="278px">
                    <table class="auto-style4">
                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" Text="Bank Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBankName" runat="server" placeholder="Enter Bank Name"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text="Payment Type"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPayType" runat="server"></asp:TextBox>
                            </td>
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
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="Card Number"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCardNumber" runat="server" placeholder="Enter Card Number" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="Expire Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtExpireDate" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label18" runat="server" Text="Advance Amount"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAdvAmt" runat="server" OnTextChanged="txtAdvAmt_TextChanged" placeholder="Enter Advance Amount" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnPayNow" runat="server" OnClick="btnPayNow_Click" Text="PAY NOW" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label10" runat="server" Text="Total Amount"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtTotalAmount" runat="server" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style11">
                <asp:Button ID="btnBook" runat="server" OnClick="btnBook_Click" Text="Book Now" />
                &nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" />
            </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td>
                &nbsp;
                </td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

