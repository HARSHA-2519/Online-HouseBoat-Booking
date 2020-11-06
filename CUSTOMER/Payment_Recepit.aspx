<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="Payment_Recepit.aspx.cs" Inherits="CUSTOMER_Payment_Recepit" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 279px;
            height: 56px;
        }
        .auto-style5 {
            width: 100%;
            height: 367px;
        }
        .auto-style6 {
            width: 152%;
            height: 602px;
        }
        .auto-style7 {
            text-align: center;
            height: 56px;
        }
        .auto-style8 {
            height: 54px;
        }
        .auto-style9 {
            height: 56px;
        }
        .auto-style10 {
            height: 64px;
        }
        .auto-style11 {
            height: 70px;
        }
        .auto-style12 {
            height: 190px;
        }
        .auto-style13 {
            height: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style6">
        <tr>
            <td class="auto-style8">&nbsp;<asp:Label ID="Label1" runat="server" Text="Booking ID :"></asp:Label>
&nbsp;
                <asp:Label ID="lblBookID" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;<asp:Label ID="Label2" runat="server" Text="Boat Name :"></asp:Label>
&nbsp;<asp:Label ID="lblBoatID" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Button ID="btnDownload" runat="server" Text="Download Recepit" Width="162px" OnClick="btnDownload_Click" BackColor="#A7CFE3" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Height="390px">
                    <table class="auto-style5" border="1">
                        <tr>
                            <td class="auto-style10"><asp:Label ID="Label3" runat="server" Text="Bank Name :"></asp:Label>
                                &nbsp;<asp:Label ID="lblBankName" runat="server" Font-Bold="True"></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Pay Date :"></asp:Label>
&nbsp;&nbsp;<asp:Label ID="lblPayDate" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <table border="1" class="auto-style3">
                                    <tr>
                                        <td class="auto-style4">&nbsp;<asp:Label ID="Label5" runat="server" Text="Customer Address :"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblCustAddress" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td class="auto-style9">&nbsp;<asp:Label ID="Label6" runat="server" Text="Boat Owner Address :"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblOwnerAddress" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">
                                <asp:GridView ID="gvPaymentDetails" runat="server" AutoGenerateColumns="False" Width="581px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="176px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Adv_pid" HeaderText="Reference Number">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Name" HeaderText="Customer Name">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CardType" HeaderText="Card Type">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Adv_amt" HeaderText="Advance Amount">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13">&nbsp;<asp:Label ID="Label7" runat="server" Text="Grand Total :"></asp:Label>
                                &nbsp; <asp:Label ID="lblTotal" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

