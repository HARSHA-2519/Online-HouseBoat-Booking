<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="PackageBookingF.aspx.cs" Inherits="CUSTOMER_PackageBookingF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 99%;
        }
        .auto-style5 {
            width: 157%;
            height: 129px;
        }
        .auto-style6 {
            text-align: center;
        }
        </style>
         <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
.button {
  border-radius: 4px;
  background-color: #49baf5;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 18px;
  padding: 10px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
        .auto-style7 {
            width: 186%;
        }
        .auto-style10 {
            width: 34%;
            text-align: left;
        }
        .auto-style15 {
            width: 515px;
        }
        .auto-style22 {
            width: 34%;
        }
        .auto-style24 {
            width: 31%;
        }
        .auto-style26 {
            width: 477px;
        }
        .auto-style27 {
            width: 27%;
        }
        .auto-style28 {
            width: 42%;
        }
        .auto-style30 {
            width: 489px;
        }
        .auto-style31 {
            width: 43%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="auto-style7">
        <tr>
            <td>
                            <asp:LinkButton ID="lbtnHouseBoat" runat="server" class="button" OnClick="lbtnHouseBoat_Click"><span>Houseboat Package </span></asp:LinkButton>
                            </td>
            <td>
                            <asp:LinkButton ID="lbtnHoneyMoon" runat="server" class="button" OnClick="lbtnHoneyMoon_Click"><span>Honey Moon Package</span> </asp:LinkButton>
                            </td>
            <td>
                            <asp:LinkButton ID="lbtnDiscover" runat="server" class="button" OnClick="lbtnDiscover_Click"><span>Discover Kerala Package</span> </asp:LinkButton>
                        </td>
        </tr>
    </table>
    
    <table class="auto-style5">
        <tr>
            <td>
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style6">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style6">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style6">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="lblHouse" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Medium" ForeColor="#000066" Text="HOUSEBOAT BOOKING"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:DataList ID="dlHouseBoatPackBook" runat="server" DataKeyField="Pack_id" OnItemCommand="dlHouseBoatPackBook_ItemCommand">
                    <ItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style6" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style22">&nbsp;</td>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td rowspan="8" class="auto-style10">
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Bind("Image","~/BoatImages/{0}") %>' Width="200px" />
                                </td>
                                <td class="auto-style24">Package Name :</td>
                                <td>
                                    &nbsp;<asp:Label ID="lblBoatid" runat="server" Font-Italic="True" ForeColor="#CC0000" Text='<%# Bind("Pack_name") %>'></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">Boat Name :</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Boatname") %>'></asp:Label>
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">Total Days :</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("tot_days") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">Duration: </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style24">Rate :</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Rate") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22">&nbsp;</td>
                                <td class="auto-style24">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style22">&nbsp;</td>
                                <td class="auto-style24">&nbsp;</td>
                                <td>
                                    <asp:LinkButton ID="lbtnPackBooking" runat="server" CommandName="More" Font-Italic="True">Package Details</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="lblHoney" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#000066" Text="HONEY MOON PACKAGE"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:DataList ID="dlHoneyMoonPackBook" runat="server" OnItemCommand="dlHoneyMoonPackBook_ItemCommand" DataKeyField="Pack_id">
                    <ItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style6" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td rowspan="8" class="auto-style28">
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Bind("Image","~/BoatImages/{0}") %>' Width="200px" />
                                </td>
                                <td class="auto-style27">
                                    Package Name :</td>
                                <td>
                                    <asp:Label ID="lblBoatid" runat="server" Font-Italic="True" ForeColor="#CC0000" Text='<%# Bind("Pack_name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style27">
                                    Boat Name :</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Boatname") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style27">
                                    Total Days :</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("tot_days") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style27">
                                    Duration:</td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28"></td>
                                <td class="auto-style27">
                                    Rate :</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Rate") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>
                                    <asp:LinkButton ID="lbtnPackBooking" runat="server" Font-Italic="True"   CommandName="More" >Package Details</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="lblDiscover" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#000066" Text="DISCOVER KERALA PACKAGE"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:DataList ID="dlDiscoverPackBook" runat="server" DataKeyField="Pack_id" OnItemCommand="dlDiscoverPackBook_ItemCommand" >
                    <ItemTemplate>
                        <table class="auto-style30">
                            <tr>
                                <td class="auto-style6" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style31">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td rowspan="8" class="auto-style31">
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Bind("Image","~/BoatImages/{0}") %>' Width="200px" />
                                </td>
                                <td class="auto-style27">Package Name :</td>
                                <td>
                                    <asp:Label ID="lblBoatid" runat="server" Font-Italic="True" ForeColor="#CC0000" Text='<%# Bind("Pack_name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style27">Boat Name :</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Boatname") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style27">Total Days :</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("tot_days") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style27">Duration:</td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style31"></td>
                                <td class="auto-style27">Rate :</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Rate") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style31">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style31">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>
                                    <asp:LinkButton ID="lbtnPackBooking" runat="server" CommandName="More" Font-Italic="True">Package Details</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

