<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="PaymentRecepit_Without_Package.aspx.cs" Inherits="CUSTOMER_PaymentRecepit_Without_Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            width: 166px;
            height: 346px;
        }
        .auto-style6 {
            width: 170px;
            height: 546px;
        }
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            height: 24px;
        }
        .auto-style10 {
            height: 42px;
        }
        .auto-style11 {
            height: 46px;
            text-align: center;
        }
        .auto-style12 {
            height: 62px;
        }
        .auto-style13 {
            height: 52px;
        }
        .auto-style14 {
            height: 368px;
        }
        .auto-style15 {
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style6">
        <tr>
            <td class="auto-style10">
                <asp:Label ID="Label1" runat="server" Text="Booking ID :"></asp:Label>
&nbsp;&nbsp;
                <asp:Label ID="lblBookID" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="Label2" runat="server" Text="Boat Name :"></asp:Label>
&nbsp;
                <asp:Label ID="lblBoatID" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Button ID="btnDownload" runat="server" BackColor="#99CAE2" ForeColor="Black" OnClick="btnDownload_Click" Text="Download Recepit" Width="162px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                <asp:Panel ID="Panel1" runat="server" Height="352px">
                    <table border="1" class="auto-style5">
                        <tr>
                            <td class="auto-style12">
                                <asp:Label ID="Label3" runat="server" Text="Customer Name :"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblCustName" runat="server" Font-Bold="True"></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Booking Date :"></asp:Label>
                                &nbsp;<asp:Label ID="lblBookDate" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13">
                                <table border="1" class="auto-style8">
                                    <tr>
                                        <td class="auto-style9">
                                            <asp:Label ID="Label5" runat="server" Text="Customer Address :"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblCustAddress" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td class="auto-style9">
                                            <asp:Label ID="Label6" runat="server" Text="Boat Owner Address :"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblOwnerAddress" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvPaymentDetails" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#ABD0E2" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="557px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Book_id" HeaderText="Booking ID">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BoatName" HeaderText="HoustBoat Name">
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
                            <td class="auto-style15">
                                <asp:Label ID="Label7" runat="server" Text="Grand Total :"></asp:Label>
                                <asp:Label ID="lblTotal" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

