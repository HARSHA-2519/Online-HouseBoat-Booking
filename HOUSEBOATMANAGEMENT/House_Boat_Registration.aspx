<%@ Page Title="" Language="C#" MasterPageFile="~/HOUSEBOATMANAGEMENT/HouseBoatMasterPage.master" AutoEventWireup="true" CodeFile="House_Boat_Registration.aspx.cs" Inherits="HOUSEBOATMANAGEMENT_House_Boat_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            height: 24px;
        }
        .auto-style6 {
            width: 53px;
        }
        .auto-style7 {
            height: 24px;
            width: 53px;
        }
        .auto-style8 {
            height: 23px;
            width: 53px;
        }
        .auto-style9 {
            width: 626px;
        }
        .auto-style13 {
            text-align: center;
            width: 76px;
        }
        .auto-style14 {
            width: 76px;
        }
        .auto-style15 {
            height: 24px;
            width: 76px;
        }
        .auto-style16 {
            height: 23px;
            width: 76px;
        }
        .auto-style17 {
            width: 62px;
        }
        .auto-style18 {
            height: 24px;
            width: 62px;
        }
        .auto-style19 {
            height: 23px;
            width: 62px;
        }
        .auto-style20 {
            text-align: left;
            width: 62px;
        }
        .auto-style21 {
            width: 10px;
        }
        .auto-style22 {
            height: 24px;
            width: 10px;
        }
        .auto-style23 {
            height: 23px;
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table class="auto-style9">
        <tr>
            <td colspan="6"><h2 class="auto-style3">HOUSE BOAT REGISTRATION</h2></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAdminId" runat="server"></asp:Label>
            </td>
            <td class="auto-style21">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style17">
                &nbsp;</td>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="auto-style21">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style17">
                &nbsp;</td>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Boat Name"></asp:Label>
            </td>
            <td class="auto-style21">
                <asp:TextBox ID="txtBoatname" runat="server" placeholder="Enter Boat Name"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBoatname" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style17">
                <asp:Label ID="Label7" runat="server" Text="Boat Type"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:DropDownList ID="ddlBoatType" runat="server" >
                </asp:DropDownList>
            </td>
            <td class="auto-style6">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlBoatType" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Boat Type---"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="Description"></asp:Label>
            </td>
            <td class="auto-style21">
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" placeholder="Enter Description" ></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style17">
                <asp:Label ID="Label11" runat="server" Text="Rate Per Day"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txtRatePerDate" runat="server" placeholder="Enter Rate Per Day"></asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRatePerDate" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Boat Image"></asp:Label>
            </td>
            <td class="auto-style21">
                <asp:FileUpload ID="fupBoatImage" runat="server" />
            </td>
            <td>&nbsp;</td>
            <td class="auto-style17">
                <asp:Label runat="server" Text="Total Rooms"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txtTotalRoom" runat="server" placeholder="Enter Total Rooms"></asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTotalRoom" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                </td>
            <td class="auto-style22">
                <asp:LinkButton ID="lbtn_Upload" runat="server" OnClick="lbtn_Upload_Click" BackColor="Aqua" BorderColor="#CC0000" BorderStyle="Double" Font-Bold="True" ForeColor="#000066" CausesValidation="False">UPLOAD</asp:LinkButton>
            </td>
            <td class="auto-style5"></td>
            <td class="auto-style18">
                </td>
            <td class="auto-style15">
                </td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="State"></asp:Label>
            </td>
            <td class="auto-style21">
                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlState" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Select State---"></asp:CompareValidator>
            </td>
            <td class="auto-style17">
                <asp:Label ID="Label8" runat="server" Text="District"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style6">
                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlDistrict" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Select District---"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Location"></asp:Label>
            </td>
            <td class="auto-style21">
                <asp:DropDownList ID="ddlLocation" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlLocation" ErrorMessage="!" Font-Bold="True" ForeColor="Blue" Operator="NotEqual" ValueToCompare="---Select Location---"></asp:CompareValidator>
            </td>
            <td class="auto-style17">
                <asp:Label ID="Label3" runat="server" Text="Contact Name"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txtContName" runat="server" placeholder="Enter Contact Name"></asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtContName" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style23"></td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style19"></td>
            <td class="auto-style16"></td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Address Line 1"></asp:Label>
            </td>
            <td class="auto-style21">
                <asp:TextBox ID="txtAddress1" runat="server" TextMode="MultiLine" placeholder="Enter Address Line 1"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress1" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style20">
                <asp:Label ID="Label4" runat="server" Text="Address Line 2"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td class="auto-style13">
                <asp:TextBox ID="txtAddress2" runat="server" TextMode="MultiLine" placeholder="Enter Address Line 2"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress2" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style23"></td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Contact Number"></asp:Label>
            </td>
            <td class="auto-style21">
                <asp:TextBox ID="txtContNumber" runat="server" placeholder="Enter Contact Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtContNumber" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style17">
                &nbsp;</td>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="Facility"></asp:Label>
            </td>
            <td colspan="4">
                <asp:CheckBoxList ID="cblFacility" runat="server" BorderColor="#0099FF" BorderStyle="Solid" BorderWidth="3px" ForeColor="#FF66FF" CellPadding="3" CellSpacing="3" RepeatColumns="3" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" rowspan="3">
                <asp:Image ID="imgBoat" runat="server" Height="168px" Width="300px" />
            </td>
            <td>&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style14">
                <asp:TextBox ID="txtBoatImage" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style17">
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
            </td>
            <td class="auto-style14">
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
    </table>

</asp:Content>

