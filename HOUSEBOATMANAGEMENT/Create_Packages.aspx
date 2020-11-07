<%@ Page Title="" Language="C#" MasterPageFile="~/HOUSEBOATMANAGEMENT/HouseBoatMasterPage.master" AutoEventWireup="true" CodeFile="Create_Packages.aspx.cs" Inherits="HOUSEBOATMANAGEMENT_Create_Packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 6px;
        }
        .auto-style6 {
            height: 23px;
            width: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="5"><h2 class="auto-style3">MANAGE PACKAGES</h2></td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Package Name"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtPackname" runat="server" placeholder="Enter Package Name"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPackname" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Boat Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlBoatname" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style5">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlBoatname" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Select Boat---"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Total Days"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtTotalDays" runat="server" placeholder="Enter Total Days"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTotalDays" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Rate"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRate" runat="server" placeholder="Enter Total Rate"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRate" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Location From"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddlLocationfrom" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlLocationfrom" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Location From---"></asp:CompareValidator>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Location To"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlLocationTo" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style5">
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlLocationTo" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Location To---"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Food Available"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:RadioButtonList ID="rblFoodMenu" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>YES</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
                </asp:RadioButtonList>
                
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Extra Facility"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtExtra" runat="server" TextMode="MultiLine" placeholder="Enter Extra Facility"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtExtra" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Package Starting Date"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtPackStart" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPackStart" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Package Ending Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPackEnd" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPackEnd" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Duration"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtDuration" runat="server" placeholder="Enter Duration"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDuration" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Images"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fupImage" runat="server" />
            </td>
            <td class="auto-style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style6"></td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="btnAddPackage" runat="server" OnClick="btnAddPackage_Click" Text="Add Package" />
            </td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnResetPackage" runat="server" Text="Reset Package" OnClick="btnResetPackage_Click" />
            </td>
            <td class="auto-style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

