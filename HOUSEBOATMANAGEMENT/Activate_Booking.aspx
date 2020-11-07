<%@ Page Title="" Language="C#" MasterPageFile="~/HOUSEBOATMANAGEMENT/HouseBoatMasterPage.master" AutoEventWireup="true" CodeFile="Activate_Booking.aspx.cs" Inherits="HOUSEBOATMANAGEMENT_Activate_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .auto-style3 {
            width: 104%;
            height: 729px;
        }
    .auto-style4 {
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="auto-style3">
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <h2 class="auto-style4">ACTIVATE BOOKING</h2>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2" rowspan="2" class="auto-style4">
                <asp:GridView ID="gvActivateBook" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Book_id" GridLines="Horizontal" OnRowCommand="gvCancelBook_RowCommand" Width="596px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Book_id" HeaderText="BOOKING ID" ReadOnly="True" SortExpression="Book_id" />
                        <asp:BoundField DataField="Name" HeaderText="CUSTOMER" />
                        <asp:BoundField DataField="Boatname" HeaderText="BOAT NAME" SortExpression="Boat_id" />
                        <asp:BoundField DataField="Book_date" HeaderText="BOOKING DATE" SortExpression="Book_date" />
                        <asp:BoundField DataField="Total_amt" HeaderText="TOTAL AMOUNT" SortExpression="Total_amt" />
                        <asp:BoundField DataField="Status" HeaderText="STATUS" SortExpression="Status" />
                        <asp:ButtonField CommandName="View" HeaderText="CLICK HERE" Text="VIEW" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <asp:DetailsView ID="dvActivateBook" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Book_id" ForeColor="#333333" GridLines="None" Height="50px" OnItemCommand="dvCancelBook_ItemCommand" Width="274px" OnModeChanging="dvCancelBook_ModeChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Book_id" HeaderText="BOOKIING ID" SortExpression="Book_id" />
                        <asp:BoundField DataField="Boatname" HeaderText="BOAT NAME" SortExpression="Boat_id" />
                        <asp:BoundField DataField="Pack_or_Not" HeaderText="PACKAGE OR NOT" SortExpression="Pack_or_Not" />
                        <asp:BoundField DataField="Name" HeaderText="CUSTOMER NAME" SortExpression="Cust_id" />
                        <asp:BoundField DataField="Tot_adults" HeaderText="TOTAL ADULTS" SortExpression="Tot_adults" />
                        <asp:BoundField DataField="Tot_child" HeaderText="TOTAL CHILDRENS" SortExpression="Tot_child" />
                        <asp:BoundField DataField="Tot_memb" HeaderText="TOTAL MEMBER" SortExpression="Tot_memb" />
                        <asp:BoundField DataField="Adv_amt" HeaderText="ADVANCE AMOUNT" SortExpression="Adv_amt" />
                        <asp:BoundField DataField="Book_date" HeaderText="BOOKING DATE" SortExpression="Book_date" />
                        <asp:BoundField DataField="Total_amt" HeaderText="TOTAL AMOUNT" SortExpression="Total_amt" />
                        <asp:BoundField DataField="Status" HeaderText="STATUS" SortExpression="Status" />
                        <asp:ButtonField CommandName="Activate" Text="ACTIVATE" />
                        <asp:ButtonField CommandName="Reject" Text="REJECT" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>

