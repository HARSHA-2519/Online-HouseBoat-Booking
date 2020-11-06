<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="Send_Feedback.aspx.cs" Inherits="CUSTOMER_Send_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 124%;
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
            <td colspan="2"><h2 class="auto-style4">SEND FEEDBACK</h2></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Feedback"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" placeholder="Enter Feedback"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFeedback" ErrorMessage="!" Font-Bold="True" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <div class="auto-style5">
                <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="False" DataKeyNames="Feedb_id" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowCancelingEdit="gvFeedback_RowCancelingEdit" OnRowDeleting="gvFeedback_RowDeleting" OnRowEditing="gvFeedback_RowEditing" OnRowUpdating="gvFeedback_RowUpdating" Width="273px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Cust_id" HeaderText="CUSTOMER NAME" ReadOnly="True" SortExpression="Name" />
                        <asp:TemplateField HeaderText="FEEDBACK" SortExpression="Feedback">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFeedback" runat="server" Text='<%# Bind("Feedback") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Feedback") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" HeaderText="SEND DATE" DataFormatString = "{0:d}" ReadOnly="True"/>
                        <asp:CommandField HeaderText="EDIT" ShowEditButton="True" />
                        <asp:CommandField HeaderText="DELETE" ShowDeleteButton="True" />
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
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

