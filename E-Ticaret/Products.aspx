<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="E_Ticaret.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--ekledik !!!--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1000"></asp:ScriptManager>

    <div style="width: 100%">

        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnItemCreated="DataList1_ItemCreated">
            <ItemTemplate>

                <div class="prod_box">
                    <div class="top_prod_box">
                    </div>
                    <div class="center_prod_box">
                        <div class="product_title">

                            <a href="Products.aspx">
                                <%# Eval("ProductName") %>
                            </a>
                        </div>

                        <div class="product_img">
                            <a href="ProductDetail.aspx">
                                <%--<img src="images/laptop.gif" alt="" title="" border="0" />--%>

                                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString()) %>' />
                            </a>
                        </div>

                        <div class="prod_price">
                            <span class="reduce">
                                <%# string.Format("{0:C}", Convert.ToDouble(Eval("UnitPrice")) * 1.18) %>
                            </span>

                            <span class="price">
                                <%# string.Format("{0:C}", Eval("UnitPrice")) %>
                            </span>
                        </div>

                    </div>
                    <div class="bottom_prod_box">
                    </div>

                    <div class="prod_details_tab" style="text-align: center">

                        <asp:Label ID="lblAdet" runat="server" Text="Adet   :    "></asp:Label>

                        <asp:DropDownList ID="drpQuantity" runat="server" Width="100px"></asp:DropDownList>

                    </div>

                    <div class="prod_details_tab">
                        <asp:LinkButton ID="lbtnDetay" runat="server" class="prod_details" CommandArgument='<%# Eval("ProductID")%>' CommandName="details">Detay</asp:LinkButton>

                        <asp:LinkButton ID="lbtnSepet" runat="server" class="prod_details" CommandArgument='<%# Eval("ProductID")%>' CommandName="addToCart">Sepet</asp:LinkButton>
                    </div>
                </div>

            </ItemTemplate>
        </asp:DataList>

    </div>
</asp:Content>
