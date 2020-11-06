<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Activate_Customer.aspx.cs" Inherits="ADMIN_Activate_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
    .auto-style4 {
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td colspan="4"><h2 class="auto-style4">ACTIVATE CUSTOMERS</h2></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <asp:GridView ID="gvCustDetails" runat="server" AutoGenerateColumns="False" OnRowCommand="gvCustDetails_RowCommand" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Width="567px" DataKeyNames="Cust_id">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="CUSTOMER NAME" SortExpression="Name" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Gender" HeaderText="GENDER" SortExpression="Gender" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="EMAIL" SortExpression="Email" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Reg_date" HeaderText="REGISTRATION DATE" SortExpression="Reg_date" DataFormatString = "{0:d}">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="STATUS" SortExpression="Status" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="View" HeaderText="VIEW" Text="VIEW">
                        <ItemStyle Font-Bold="True" Font-Italic="True" HorizontalAlign="Center" />
                        </asp:ButtonField>
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <asp:DetailsView ID="dvCustDetails" runat="server" AutoGenerateRows="False" DataKeyNames="Cust_id" Height="50px" OnItemCommand="dvCustDetails_ItemCommand" Width="274px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Cust_id" HeaderText="CUSTOMER ID" InsertVisible="False" ReadOnly="True" SortExpression="Cust_id" />
                        <asp:BoundField DataField="Name" HeaderText="CUSTOMER NAME" SortExpression="Name" />
                        <asp:BoundField DataField="Address_Line1" HeaderText="ADDRESS LINE 1" SortExpression="Address_Line1" />
                        <asp:BoundField DataField="Address_Line2" HeaderText="ADDRESS LINE 2" SortExpression="Address_Line2" />
                        <asp:BoundField DataField="Age" HeaderText="AGE" SortExpression="Age" />
                        <asp:BoundField DataField="Gender" HeaderText="GENDER" SortExpression="Gender" />
                        <asp:BoundField DataField="Dist" HeaderText="DISTRICT" SortExpression="Dist_id" />
                        <asp:BoundField DataField="Loc_name" HeaderText="LOCATION" SortExpression="Loc_id" />
                        <asp:BoundField DataField="Email" HeaderText="EMAIL" SortExpression="Email" />
                        <asp:BoundField DataField="Phone_no" HeaderText="PHONE NO:" SortExpression="Phone_no" />
                        <asp:BoundField DataField="Reg_date" HeaderText="REGISTRATION DATE" SortExpression="Reg_date" DataFormatString = "{0:d}" />
                        <asp:BoundField DataField="Status" HeaderText="STATUS" SortExpression="Status" />
                        <asp:ButtonField CommandName="Accept" HeaderText="ACTIVATE" Text="ACTIVATE">
                        <ItemStyle Font-Italic="True" Font-Bold="True" HorizontalAlign="Right" />
                        </asp:ButtonField>
                        <asp:ButtonField CommandName="Reject" HeaderText="REJECT" Text="REJECT">
                        <ItemStyle Font-Italic="True" Font-Bold="True" HorizontalAlign="Right" />
                        </asp:ButtonField>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
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
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

