<%@ Page Title="" Language="C#" MasterPageFile="~/HOUSEBOATMANAGEMENT/HouseBoatMasterPage.master" AutoEventWireup="true" CodeFile="Update_House_Boat_Details.aspx.cs" Inherits="HOUSEBOATMANAGEMENT_Update_House_Boat_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td colspan="2"><h2>UPDATE HOUSEBOAT</h2></td>
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
            <td colspan="2" class="auto-style2">
                <asp:DetailsView ID="dvUpdateHouseBoat" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Boat_id" ForeColor="#333333" GridLines="None" Height="50px"  Width="241px" OnItemUpdating="dvUpdateHouseBoat_ItemUpdating" OnModeChanging="dvUpdateHouseBoat_ModeChanging" >
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Boat_id" HeaderText="Boat ID" InsertVisible="False" ReadOnly="True" SortExpression="Boat_id" />
                        <asp:TemplateField HeaderText="House Boat Owner" SortExpression="Admin_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlAdmin_id" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Admin_id" SelectedValue='<%# Bind("Admin_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT [Admin_id], [Name] FROM [HB_ADMIN]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Boat Name" SortExpression="Boatname">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBoatname" runat="server" Text='<%# Bind("Boatname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Boatname") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Boatname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Boat Type" SortExpression="Btype_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlBtype_id" runat="server" DataSourceID="SqlDataSource2" DataTextField="Typename" DataValueField="Btype_id" SelectedValue='<%# Bind("Btype_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT [Btype_id], [Typename] FROM [BOAT_TYPE]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Typename") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Typename") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Rooms" SortExpression="Tot_rooms">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTot_name" runat="server" Text='<%# Bind("Tot_rooms") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Tot_rooms") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Tot_rooms") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rate Per Day" SortExpression="Rate_per_day">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRate_per_day" runat="server" Text='<%# Bind("Rate_per_day") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Rate_per_day") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Rate_per_day") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Location" SortExpression="Loc_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlLoc_id" runat="server" DataSourceID="SqlDataSource3" DataTextField="Loc_name" DataValueField="Loc_id" SelectedValue='<%# Bind("Loc_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT [Loc_id], [Loc_name] FROM [LOCATION]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Loc_name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Loc_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripction" SortExpression="Descp">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescp" runat="server" Text='<%# Bind("Descp") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Descp") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Descp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact Name" SortExpression="Cont_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCont_name" runat="server" Text='<%# Bind("Cont_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Cont_name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Cont_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address Line 1" SortExpression="Address_Line1">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress_Line1" runat="server" Text='<%# Bind("Address_Line1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Address_Line1") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Address_Line1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address Line 2" SortExpression="Address_Line2">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress_Line2" runat="server" Text='<%# Bind("Address_Line2") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Address_Line2") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Address_Line2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact Number" SortExpression="Cont_no">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCont_no" runat="server" Text='<%# Bind("Cont_no") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Cont_no") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Cont_no") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Photo">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBoat_image" runat="server" Text='<%# Eval("Boat_image") %>'></asp:TextBox>
                                <br />
                                <br />
                                <asp:FileUpload ID="fupBoat_image" runat="server" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Eval("Boat_image") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Boat_image", "~/BoatImages/{0}") %>' />
                            </ItemTemplate>
                            <ControlStyle Height="100px" Width="250px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ReadOnly="True" />
                        <asp:CommandField HeaderText="Update" ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

