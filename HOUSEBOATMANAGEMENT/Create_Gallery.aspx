<%@ Page Title="" Language="C#" MasterPageFile="~/HOUSEBOATMANAGEMENT/HouseBoatMasterPage.master" AutoEventWireup="true" CodeFile="Create_Gallery.aspx.cs" Inherits="HOUSEBOATMANAGEMENT_Create_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            height: 24px;
        }
        .auto-style6 {
            text-align: center;
            height: 24px;
        }
        .auto-style7 {
            width: 16px;
            height: 342px;
        }
        .auto-style8 {
            width: 633px;
            height: 716px;
        }
        .auto-style9 {
            margin-left: 0px;
        }
        .auto-style11 {
            height: 12px;
        }
        .auto-style12 {
            text-align: center;
            height: 23px;
            margin-bottom: 1px;
        }
        
     
        .auto-style14 {
            height: 5px;
        }
       
       
        .auto-style17 {
            height: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style8">
        <tr>
            <td colspan="4" class="auto-style11"><h2 class="auto-style12">GALLERY</h2></td>
        </tr>
        <tr>
            <td class="auto-style14" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="Boat Name"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:DropDownList ID="ddlBoatName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBoatName_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style14">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlBoatName" ErrorMessage="!" Font-Bold="True" ForeColor="#CC0000" Operator="NotEqual" ValueToCompare="---Select Boat---"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style17" colspan="2">
                <asp:Label ID="Label2" runat="server" Text="Gallery"></asp:Label>
            </td>
            <td class="auto-style17" colspan="2">
                <asp:FileUpload ID="fupGallery" runat="server" AllowMultiple="True" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lbtnUpload" runat="server" OnClick="lbtnUpload_Click" BackColor="#00CCFF" BorderColor="#CC0000" BorderStyle="Double" Font-Bold="True" Font-Overline="False" ForeColor="#000066">UPLOAD</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td></td>
            <td colspan="2" >
                <asp:DataList ID="dlGallery" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" RepeatDirection="Horizontal" RepeatColumns="2" CssClass="auto-style9" Width="531px" Height="473px">
                    <AlternatingItemStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <ItemTemplate>
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style5"></td>
                                <td class="auto-style6" colspan="2">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ImageName") %>'></asp:Label>
                                </td>
                                <td class="auto-style5"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style3" colspan="2" rowspan="2">
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Bind("ImagePath","~/BoatImages/{0}") %>' Width="250px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:DataList>
            </td>
        </tr>
    </table>
 
</asp:Content>

