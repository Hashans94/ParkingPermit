<%@ Page Title="Manage Permits" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePermits.aspx.cs" Inherits="ParkingPermit.staff.ManagePermits" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="managePermitsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PermitPurchases %>"
        SelectCommand="SELECT * FROM [permits]"
        UpdateCommand="UPDATE [permits] SET [description] = @description, [quarter_price] = @quarter_price, [halfyear_price] = @halfyear_price, [year_price] = @year_price WHERE [type] = @type"
        DeleteCommand="DELETE FROM [permits] WHERE [type] = @type"
        InsertCommand="INSERT INTO [permits] ([type], [description], [quarter_price], [halfyear_price], [year_price]) VALUES (@type, @description, @quarter_price, @halfyear_price, @year_price)">
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

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:ListView ID="ListPermits" runat="server" DataKeyNames="type" DataSourceID="managePermitsDataSource" InsertItemPosition="LastItem">
                <LayoutTemplate>
                    <table class="table" runat="server" id="table1">
                        <thead>
                            <tr runat="server">
                                <th>Action</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Quarter Price</th>
                                <th>Halfyear Price</th>
                                <th>Year Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>

                <EmptyDataTemplate>
                    <table runat="server" class="table">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr runat="server">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-sm btn-default" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-sm btn-default" />
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

                <EditItemTemplate>
                    <tr runat="server">
                        <td>
                            <asp:Button CssClass="btn-sm btn-success" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn-sm btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="typeLabel1" runat="server" Text='<%# Eval("type") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="permitDescriptionFilteredText" runat="server" TargetControlID="descriptionTextBox" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars="-,. " />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" ID="quarter_priceTextBox" runat="server" Text='<%# Bind("quarter_price") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="quarterPriceFilteredText" runat="server" TargetControlID="quarter_priceTextBox" FilterType="Numbers, Custom" ValidChars="." />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" ID="halfyear_priceTextBox" runat="server" Text='<%# Bind("halfyear_price") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="halfYearFileteredText" runat="server" TargetControlID="halfyear_priceTextBox" FilterType="Numbers, Custom" ValidChars="." />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" ID="year_priceTextBox" runat="server" Text='<%# Bind("year_price") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="yearPriceFilteredText" runat="server" TargetControlID="year_priceTextBox" FilterType="Numbers, Custom" ValidChars="." /> 
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn-sm btn-primary" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn-sm btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" Placeholder="Permit Type" ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="permitTypeFilterdText" runat="server" TargetControlID="typeTextBox" FilterType="LowercaseLetters, UppercaseLetters" />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" Placeholder="Permit Description" ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="permitDescriptionFilteredText" runat="server" TargetControlID="descriptionTextBox" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars="-,. " />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" Placeholder="90.00" ID="quarter_priceTextBox" runat="server" Text='<%# Bind("quarter_price") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="quarterPriceFilteredText" runat="server" TargetControlID="quarter_priceTextBox" FilterType="Numbers, Custom" ValidChars="." />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" Placeholder="100.78" ID="halfyear_priceTextBox" runat="server" Text='<%# Bind("halfyear_price") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="halfYearFileteredText" runat="server" TargetControlID="halfyear_priceTextBox" FilterType="Numbers, Custom" ValidChars="." />
                        </td>
                        <td>
                            <asp:TextBox CssClass="newTextBox" Placeholder="900.00" ID="year_priceTextBox" runat="server" Text='<%# Bind("year_price") %>' />
                            <ajaxToolkit:FilteredTextBoxExtender ID="yearPriceFilteredText" runat="server" TargetControlID="year_priceTextBox" FilterType="Numbers, Custom" ValidChars="." />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
