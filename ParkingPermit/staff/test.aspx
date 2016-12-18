<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="ParkingPermit.staff.test" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PermitPurchases %>" DeleteCommand="DELETE FROM [permits] WHERE [type] = @type" InsertCommand="INSERT INTO [permits] ([type], [description], [quarter_price], [halfyear_price], [year_price]) VALUES (@type, @description, @quarter_price, @halfyear_price, @year_price)" SelectCommand="SELECT * FROM [permits]" UpdateCommand="UPDATE [permits] SET [description] = @description, [quarter_price] = @quarter_price, [halfyear_price] = @halfyear_price, [year_price] = @year_price WHERE [type] = @type">
    <DeleteParameters>
        <asp:Parameter Name="type" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="type" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="quarter_price" Type="Double" />
        <asp:Parameter Name="halfyear_price" Type="Double" />
        <asp:Parameter Name="year_price" Type="Double" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="quarter_price" Type="Double" />
        <asp:Parameter Name="halfyear_price" Type="Double" />
        <asp:Parameter Name="year_price" Type="Double" />
        <asp:Parameter Name="type" Type="String" />
    </UpdateParameters>
    </asp:SqlDataSource>

    <asp:ListView ID="permitListView" runat="server" DataKeyNames="type" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="quarter_priceLabel" runat="server" Text='<%# Eval("quarter_price") %>' />
                </td>
                <td>
                    <asp:Label ID="halfyear_priceLabel" runat="server" Text='<%# Eval("halfyear_price") %>' />
                </td>
                <td>
                    <asp:Label ID="year_priceLabel" runat="server" Text='<%# Eval("year_price") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="typeLabel1" runat="server" Text='<%# Eval("type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="quarter_priceTextBox" runat="server" Text='<%# Bind("quarter_price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="halfyear_priceTextBox" runat="server" Text='<%# Bind("halfyear_price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="year_priceTextBox" runat="server" Text='<%# Bind("year_price") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="quarter_priceTextBox" runat="server" Text='<%# Bind("quarter_price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="halfyear_priceTextBox" runat="server" Text='<%# Bind("halfyear_price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="year_priceTextBox" runat="server" Text='<%# Bind("year_price") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="quarter_priceLabel" runat="server" Text='<%# Eval("quarter_price") %>' />
                </td>
                <td>
                    <asp:Label ID="halfyear_priceLabel" runat="server" Text='<%# Eval("halfyear_price") %>' />
                </td>
                <td>
                    <asp:Label ID="year_priceLabel" runat="server" Text='<%# Eval("year_price") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">type</th>
                                <th runat="server">description</th>
                                <th runat="server">quarter_price</th>
                                <th runat="server">halfyear_price</th>
                                <th runat="server">year_price</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="quarter_priceLabel" runat="server" Text='<%# Eval("quarter_price") %>' />
                </td>
                <td>
                    <asp:Label ID="halfyear_priceLabel" runat="server" Text='<%# Eval("halfyear_price") %>' />
                </td>
                <td>
                    <asp:Label ID="year_priceLabel" runat="server" Text='<%# Eval("year_price") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
