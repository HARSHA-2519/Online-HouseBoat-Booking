<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="View_Packages.aspx.cs" Inherits="CUSTOMER_View_Packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td>&nbsp;</td>
            <td colspan="3"><h2>VIEW PACKAGES</h2></td>
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
            <td class="auto-style4" colspan="3" rowspan="2">
                <div class="auto-style5">
                    <asp:DetailsView ID="dvPackage" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Pack_id" ForeColor="#333333" GridLines="None" Height="50px" OnPageIndexChanging="dvPackage_PageIndexChanging" Width="302px">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="Pack_id" HeaderText="PACKAGE ID" InsertVisible="False" ReadOnly="True" SortExpression="Pack_id" />
                            <asp:BoundField DataField="Pack_name" HeaderText="PACKAGE NAME" SortExpression="Pack_name" />
                            <asp:BoundField DataField="Boatname" HeaderText="BOAT NAME" SortExpression="Boat_id" />
                            <asp:BoundField DataField="Tot_days" HeaderText="TOTAL DAYS" SortExpression="Tot_days" />
                            <asp:BoundField DataField="FromLoc" HeaderText="LOCATION FROM" SortExpression="From_loc_id" />
                            <asp:BoundField DataField="ToLoc" HeaderText="LOCATION TO" SortExpression="To_loc_id" />
                            <asp:BoundField DataField="Valid_from" HeaderText="VALIDATE FROM" SortExpression="Valid_from" DataFormatString = "{0:d}"/>
                            <asp:BoundField DataField="Valid_to_dt" HeaderText="VALIDATE TO" SortExpression="Valid_to_dt" DataFormatString = "{0:d}"/>
                            <asp:BoundField DataField="Food_avail" HeaderText="FOOD AVAILABLE" SortExpression="Food_avail" />
                            <asp:BoundField DataField="Extra_facility" HeaderText="EXTRA FACILITY" SortExpression="Extra_facility" />
                            <asp:BoundField DataField="Duration" HeaderText="DURATION" SortExpression="Duration" />
                            <asp:BoundField DataField="Rate" HeaderText="RATE" SortExpression="Rate" />
                            <asp:ImageField DataImageUrlField="Image" DataImageUrlFormatString="~/BoatImages/{0}" HeaderText="PHOTO">
                                <ControlStyle Height="100px" Width="100px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="Active" HeaderText="ACTIVE" SortExpression="Active" />
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                </div>
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

