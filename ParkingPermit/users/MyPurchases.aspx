<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPurchases.aspx.cs" Inherits="ParkingPermit.users.MyPurchases" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <asp:SqlDataSource ID="myPurchasesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PermitPurchases %>" SelectCommand="SELECT * FROM [purchases] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:Parameter Name="username" Type="String" />
        </SelectParameters>
       </asp:SqlDataSource>
    <asp:GridView ID="mainGrid" CssClass="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="myPurchasesDataSource">
        <Columns>
            <asp:CommandField ControlStyle-CssClass="btn btn-primary btn-sm" ShowSelectButton="True" />
            <asp:BoundField DataField="pid" HeaderText="Purchase ID" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
            <asp:BoundField DataField="type" HeaderText="Permit Type" SortExpression="type" />
            <asp:BoundField DataField="ptime" HeaderText="Permit Purchase Time" SortExpression="ptime" />
        </Columns>
        <EmptyDataTemplate><h2>You Havent Purchased Any Parking Permits</h2></EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="detailsviewDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:PermitPurchases %>" SelectCommand="SELECT * FROM [purchases] WHERE ([pid] = @pid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="mainGrid" Name="pid" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="PurchasesDetailsView" CssClass="table" runat="server" Height="50px" Width="60%" style="margin-top:35px;" DataSourceID="detailsviewDatasource" AutoGenerateRows="False" DataKeyNames="pid">
        <Fields>
            <asp:BoundField DataField="pid" HeaderText="Purchase ID" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
            <asp:BoundField DataField="type" HeaderText="Permit Type" SortExpression="type" />
            <asp:BoundField DataField="startdate" HeaderText="Permit Startdate" SortExpression="startdate" />
            <asp:BoundField DataField="duration" HeaderText="Permit Duration (months)" SortExpression="duration" />
            <asp:BoundField DataField="cost" HeaderText="Permit Cost" SortExpression="cost" />
            <asp:BoundField DataField="ptime" HeaderText="Permit Purchase Time" SortExpression="ptime" />
        </Fields>
    </asp:DetailsView>


</asp:Content>