<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Ticaret.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" DataSourceID="ETicaret">
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

                    <div class="prod_details_tab">

                        <asp:LinkButton ID="lbtnDetay" runat="server" class="prod_details" CommandArgument='<%# Eval("ProductID")%>' CommandName="details">Detay</asp:LinkButton>

                        <asp:LinkButton ID="lbtnSepet" runat="server" class="prod_details" CommandArgument='<%# Eval("ProductID")%>' CommandName="addToCart">Sepet</asp:LinkButton>

                    </div>
                </div>

            </ItemTemplate>
        </asp:DataList>
        
        <asp:SqlDataSource ID="ETicaret" runat="server" ConnectionString="<%$ ConnectionStrings:ETicaretDBConnectionString2 %>" SelectCommand="SELECT Top 6 * FROM [Products] ORDER BY [ProductID] Desc"></asp:SqlDataSource>        
    </div>
</asp:Content>
