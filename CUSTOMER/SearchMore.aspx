<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="SearchMore.aspx.cs" Inherits="CUSTOMER_SearchMore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:DetailsView ID="dvBoatName" runat="server" AutoGenerateRows="False" DataKeyNames="Boat_id" Height="50px" Width="276px" OnItemCommand="dvBoatName_ItemCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Boatname" HeaderText="Boat Name" SortExpression="Boatname" />
                        <asp:BoundField DataField="Loc_name" HeaderText="Location" SortExpression="Loc_id" />
                        <asp:BoundField DataField="Typename" HeaderText="Boat Type" SortExpression="Btype_id" />
                        <asp:BoundField DataField="Tot_rooms" HeaderText="Total Room" SortExpression="Tot_rooms" />
                        <asp:BoundField DataField="Descp" HeaderText="Descripation" SortExpression="Descp" />
                        <asp:BoundField DataField="Cont_name" HeaderText="Contact Name" SortExpression="Cont_name" />
                        <asp:BoundField DataField="Address_Line1" HeaderText="Address Line 1" SortExpression="Address_Line1" />
                        <asp:BoundField DataField="Address_Line2" HeaderText="Address Line 2" SortExpression="Address_Line2" />
                        <asp:BoundField DataField="Cont_no" HeaderText="Contact Number" SortExpression="Cont_no" />
                        <asp:BoundField DataField="Rate_per_day" HeaderText="Rate Per Day" SortExpression="Rate_per_day" />
                        <asp:ImageField DataImageUrlField="Boat_image" DataImageUrlFormatString="~/BoatImages/{0}" HeaderText="Photos">
                            <ControlStyle Height="200px" Width="350px" />
                        </asp:ImageField>
                        <asp:ButtonField CommandName="Back" Text="BACK">
                        <ControlStyle Font-Italic="True" Font-Size="Medium" Font-Underline="True" />
                        </asp:ButtonField>
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
    </table>
</asp:Content>

