<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="PackageDetails.aspx.cs" Inherits="CUSTOMER_PackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style2 {
        width: 121%;
    }
    .auto-style4 {
        font-size: medium;
    }
        .auto-style5 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
    <tr>
        <td>&nbsp;</td>
        <td colspan="3"><h2 class="auto-style5">PACKAGE DETAILS</h2></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>
            <asp:DetailsView ID="dvPackageDetails" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style4" DataKeyNames="Pack_id" GridLines="Horizontal" Height="50px" Width="307px" CellSpacing="3" OnItemCommand="dvPackageDetails_ItemCommand">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <Fields>
                    <asp:BoundField DataField="Pack_id" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Pack_id" />
                    <asp:BoundField DataField="Pack_name" HeaderText="Package Name" SortExpression="Pack_name" />
                    <asp:BoundField DataField="Boatname" HeaderText="Boat Name" SortExpression="Boat_id" />
                    <asp:BoundField DataField="Tot_days" HeaderText="Total Days" SortExpression="Tot_days" />
                    <asp:BoundField DataField="Loc_name" HeaderText="Location From" SortExpression="From_loc_id" />
                    <asp:BoundField DataField="Loc_name" HeaderText="Location To" SortExpression="To_loc_id" />
                    <asp:BoundField DataField="Valid_from" HeaderText="Package Starting" SortExpression="Valid_from" DataFormatString = "{0:d}"  />
                    <asp:BoundField DataField="Valid_to_dt" HeaderText="Package Ending " SortExpression="Valid_to_dt"  DataFormatString = "{0:d}" />
                    <asp:BoundField DataField="Food_avail" HeaderText="Food Avaliable" SortExpression="Food_avail" />
                    <asp:BoundField DataField="Extra_facility" HeaderText="Extra Facility" SortExpression="Extra_facility" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                    <asp:ImageField DataImageUrlField="Image" DataImageUrlFormatString="~/BoatImages/{0}" HeaderText="Boat Images">
                        <ControlStyle Height="100px" Width="250px" />
                    </asp:ImageField>
                    <asp:ButtonField CommandName="BookNow" HeaderText="Click Here To--&gt;&gt;" Text="Book Now" >
                    <ControlStyle Font-Bold="True" Font-Italic="True" Font-Names="Juice ITC" Font-Size="Large" Font-Underline="True" />
                    </asp:ButtonField>
                </Fields>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
        </td>
        <td>&nbsp;</td>
        <td>
            <asp:Label ID="lblBoatName" runat="server" Visible="False"></asp:Label>
        </td>
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

