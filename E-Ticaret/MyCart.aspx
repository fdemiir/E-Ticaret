<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="E_Ticaret.MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 580px;
            float: left;
            text-align: center;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%">

        <div style="border-bottom: 3px solid Orange; font-family: Consolas; font-size: large; font-weight: bold; width: 580px; background-color: lightgreen">
            <table class="auto-style1">
                <tr>
                    <td style="text-align: center; vertical-align: middle; width: 20px;">Seciniz</td>

                    <td style="text-align: center; vertical-align: middle; width: 80px;">Urun Adi </td>

                    <td style="text-align: center; vertical-align: middle; width: 80px;">Adet </td>

                    <td style="text-align: center; vertical-align: middle; width: 50px;">Toplam</td>

                    <td style="text-align: center; vertical-align: middle; width: 60px;"></td>
                </tr>
            </table>
        </div>

        <asp:Repeater ID="rptMyCart" runat="server" OnItemCommand="rptMyCart_ItemCommand">
            <ItemTemplate>

                <div style="border-bottom: 3px solid Orange; font-family: Consolas; font-size: small; width: 580px; background-color: lightgreen">
                    <table class="auto-style1">
                        <tr>
                            <td style="text-align: center; vertical-align: middle; width: 75px;">
                                <asp:CheckBox ID="chkCheck" runat="server" />

                                <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                            </td>

                            <td style="text-align: center; vertical-align: middle; width: 150px;">
                                <%# Eval("ProductName") %>
                            </td>

                            <td style="text-align: center; vertical-align: middle; width: 140px;">
                                <%# Eval("Quantity") %>
                            </td>

                            <td style="text-align: center; vertical-align: middle; width: 140px;">
                                <%# string.Format("{0:C}", (Convert.ToInt32(Eval("Quantity")) * Convert.ToDecimal(Eval("UnitPrice")))) %>
                            </td>

                            <td style="text-align: center; vertical-align: middle; width: 75px;">
                                <asp:ImageButton ID="imgProduct" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="sepet" Width="30" Height="30" ImageUrl="~/images/icons/sepet.png" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>

            <FooterTemplate>
                <div style="background-color: #CCC; color: orange; text-align: center; font-size: x-large;">
                    <%= TotalPrice.ToString() %>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <br />
        <br />

       <div style="text-align:center; background-color:orange;">
            <asp:Button ID="btnSecilenleriKaldir" runat="server" Text="Secilenleri Kaldir" OnClick="btnSecilenleriKaldir_Click" Width="300px" Height="35px" Font-Bold="True" Font-Italic="False" Font-Size="Large" ForeColor="#FF6600" />
       </div>
    </div>
</asp:Content>
