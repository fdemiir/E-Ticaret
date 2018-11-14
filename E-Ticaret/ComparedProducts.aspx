<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="ComparedProducts.aspx.cs" Inherits="E_Ticaret.ComparedProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%">

        <%--GridView kolonlarinin kaymamasi icin -> AutoGenerateColumns="False" olmasina dikkat edin !!!--%>
        <asp:GridView ID="gwUrunKarsilastirma" runat="server" AutoGenerateColumns="False">

            <HeaderStyle BackColor="#1CA8B2" Font-Bold="True" ForeColor="White" Font-Size="Medium" Height="30px" />

            <RowStyle BackColor="Aquamarine" Font-Size="Small" Width="190px" />

            <AlternatingRowStyle BackColor="Wheat" Font-Size="Small" />
            <%-----------------------------------------------------------------------------------------------%>

            <Columns>

                <%--1.kolon--%>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">

                    <ItemTemplate>
                        <asp:CheckBox ID="chkCheck" runat="server" Text="Remove" AutoPostBack="True" />
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

                </asp:TemplateField>

                <%--2.kolon--%>
                <asp:TemplateField HeaderText="ProductName" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">

                    <ItemTemplate>
                        <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />

                        <div style="padding: 20px">
                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

                </asp:TemplateField>

                <%--3.kolon--%>
                <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">

                    <ItemTemplate>
                        <div style="padding: 20px">
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

                </asp:TemplateField>

                <%--4.kolon--%>
                <asp:TemplateField HeaderText="Photos" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">

                    <ItemTemplate>
                        <div style="padding: 20px">
                            <asp:Image ID="imgPhotos" runat="server" Width="75px" Height="75px" ImageUrl='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString()) %>' />
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <div>
        <asp:LinkButton CssClass="compare" ID="lbtnSecilenleriKaldir" runat="server" Width="200px" OnClick="lbtnSecilenleriKaldir_Click" Font-Bold="False" Font-Size="Medium">Secilenleri Kaldir</asp:LinkButton>
    </div>

</asp:Content>
