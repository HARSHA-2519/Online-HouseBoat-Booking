<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="View_Boat_Details.aspx.cs" Inherits="CUSTOMER_View_Boat_Details" %>

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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="3" rowspan="2">
                <asp:DetailsView ID="dvBoatDeatils" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Boat_id" Height="50px" OnPageIndexChanging="dvBoatDeatils_PageIndexChanging" Width="251px" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Boatname" HeaderText="BOAT NAME" SortExpression="Boatname" />
                        <asp:BoundField DataField="Loc_name" HeaderText="LOCATION" SortExpression="Loc_id" />
                        <asp:BoundField DataField="Typename" HeaderText="BOAT TYPE" SortExpression="Btype_id" />
                        <asp:BoundField DataField="Tot_rooms" HeaderText="TOTAL ROOMS" SortExpression="Tot_rooms" />
                        <asp:BoundField DataField="Rate_per_day" HeaderText="RATE PER DAY" SortExpression="Rate_per_day" />
                        <asp:BoundField DataField="Descp" HeaderText="DESCRIPTION" SortExpression="Descp" />
                        <asp:BoundField DataField="Cont_name" HeaderText="CONTACT NAME" SortExpression="Cont_name" />
                        <asp:BoundField DataField="Address_Line1" HeaderText="ADDRESS LINE 1" SortExpression="Address_Line1" />
                        <asp:BoundField DataField="Address_Line2" HeaderText="ADDRESS LINE 2" SortExpression="Address_Line2" />
                        <asp:BoundField DataField="Cont_no" HeaderText="CONTACT NUMBER" SortExpression="Cont_no" />
                        <asp:ImageField DataImageUrlField="Boat_image" DataImageUrlFormatString="~/BoatImages/{0}" HeaderText="BOAT IMAGE">
                            <ControlStyle Height="100px" Width="200px" />
                        </asp:ImageField>
                    </Fields>
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
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

