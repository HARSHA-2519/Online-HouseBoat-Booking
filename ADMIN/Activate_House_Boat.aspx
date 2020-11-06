<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Activate_House_Boat.aspx.cs" Inherits="ADMIN_Activate_House_Boat" %>

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
            <td>&nbsp;</td>
            <td colspan="3"><h2 class="auto-style4">ACTIVATE HOUSEBOAT</h2></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4" colspan="3">
                <asp:GridView ID="gvHouseBoat" runat="server" AutoGenerateColumns="False" DataKeyNames="Boat_id" CellPadding="3" GridLines="Horizontal" OnRowCommand="gvHouseBoat_RowCommand" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Boat_id" HeaderText="Boat ID" InsertVisible="False" ReadOnly="True" SortExpression="Boat_id" />
                        <asp:BoundField DataField="Boatname" HeaderText="Boat Name" SortExpression="Boatname" />
                        <asp:BoundField DataField="Name" HeaderText="HouseBoat Admin" SortExpression="Admin_id" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:ButtonField CommandName="View" Text="View" />
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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td rowspan="3">
                <asp:DetailsView ID="dvHouseBoat" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Boat_id" ForeColor="#333333" GridLines="None" Height="50px" OnItemCommand="dvHouseBoat_ItemCommand" Width="241px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Boat_id" HeaderText="Boat ID" InsertVisible="False" ReadOnly="True" SortExpression="Boat_id" />
                        <asp:BoundField DataField="Name" HeaderText="House Boat Owner" SortExpression="Admin_id" />
                        <asp:BoundField DataField="Boatname" HeaderText="Boat Name" SortExpression="Boatname" />
                        <asp:BoundField DataField="Typename" HeaderText="Boat Type" SortExpression="Btype_id" />
                        <asp:BoundField DataField="Tot_rooms" HeaderText="Total Rooms" SortExpression="Tot_rooms" />
                        <asp:BoundField DataField="Rate_per_day" HeaderText="Rate Per Day" SortExpression="Rate_per_day" />
                        <asp:BoundField DataField="Loc_name" HeaderText="Location" SortExpression="Loc_id" />
                        <asp:BoundField DataField="Descp" HeaderText="Descripction" SortExpression="Descp" />
                        <asp:BoundField DataField="Cont_name" HeaderText="Contact Name" SortExpression="Cont_name" />
                        <asp:BoundField DataField="Address_Line1" HeaderText="Address Line 1" SortExpression="Address_Line1" />
                        <asp:BoundField DataField="Address_Line2" HeaderText="Address Line 2" SortExpression="Address_Line2" />
                        <asp:BoundField DataField="Cont_no" HeaderText="Contact Number" SortExpression="Cont_no" />
                        <asp:ImageField DataImageUrlField="Boat_image" DataImageUrlFormatString="~/BoatImages/{0}" HeaderText="Photo">
                            <ControlStyle Height="100px" Width="100px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:ButtonField CommandName="Active" Text="Active" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
            </td>
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

