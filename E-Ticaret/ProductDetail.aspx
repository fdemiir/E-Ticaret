<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="E_Ticaret.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%">
        <div class="center_content">

            <%--ust baslik kismi ...--%>
            <div class="center_title_bar">
                <%= SelectedProduct.ProductName %>
            </div>

            <div class="prod_box_big">
                <div class="top_prod_box_big"></div>

                <%--resim kismi ...--%>
                <div class="center_prod_box_big">
                    <div class="product_img_big">
                        <img src='<%= ResolveClientUrl(SelectedProduct.LargePhotoPath) %>' alt="" title="" border="0" width="150" />
                    </div>

                    <%--description kismi ...--%>
                    <div class="details_big_box">
                        <div class="product_title_big">
                            <%= SelectedProduct.Description %>
                        </div>

                        <%--ozellikler kismi ...--%>
                        <div class="specifications">
                            Kategorisi : <span class="blue">
                                <%= SelectedProduct.Category.CategoryName %>
                            </span>
                            <br />

                            Stok Miktari : <span class="blue">
                                <%= SelectedProduct.UnitsInStock.ToString() %>
                            </span>
                            <br />

                            Stok Durumu : <span class="blue">
                                <%= stokDurumu %>
                            </span>
                            <br />

                            Garanti : <span class="blue">24 Ay</span><br />

                            Kargo : <span class="blue">
                                <%--Ucretsiz ...--%>

                                <%= kargoFiyati %>
                            </span>
                            <br />

                            Montaj :<span class="blue">Eve Teslim, Bedava Kurulum Hizmeti ...</span><br />
                        </div>

                        <div class="prod_price_big">
                            <span class="reduce">
                                <%= string.Format("{0:C}", (Convert.ToDouble(SelectedProduct.UnitPrice) + (Convert.ToDouble(SelectedProduct.UnitPrice) * 0.18))) %>
                            </span>

                            <span class="price">
                                <%= string.Format("{0:C}", (Convert.ToDouble(SelectedProduct.UnitPrice))) %>
                            </span>
                        </div>

                        <asp:LinkButton ID="lbtnSepeteEkle" runat="server" class="addtocart" OnClick="lbtnSepeteEkle_Click">Sepete Ekle</asp:LinkButton>

                        <asp:LinkButton ID="lbtnUrunKarsilastir" runat="server" class="compare" OnClick="lbtnUrunKarsilastir_Click">Urun Karsilastir</asp:LinkButton>
                    </div>
                </div>

                <div class="bottom_prod_box_big"></div>
            </div>

            <div class="center_title_bar">Benzer Urunler</div>

            <div style="width: auto; float: left;">

                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">

                    <ItemTemplate>

                        <div class="prod_box">
                            <div class="top_prod_box">
                            </div>
                            <div class="center_prod_box">
                                <div class="product_title">

                                    <a href="ProductDetail.aspx">
                                        <%# Eval("ProductName") %>
                                    </a>
                                </div>

                                <div class="product_img">
                                    <a href="ProductDetail.aspx">          

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
            </div>
        </div>

        <asp:HiddenField ID="hfProductID" runat="server" />
    </div>

</asp:Content>
