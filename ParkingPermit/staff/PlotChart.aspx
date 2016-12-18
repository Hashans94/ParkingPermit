<%@ Page Title="Plot Charts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlotChart.aspx.cs" Inherits="ParkingPermit.staff.PlotChart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:SqlDataSource ID="plotChartsDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:PermitPurchases %>" 
        SelectCommand="SELECT [purchases].[type] AS Type, COUNT(*) FROM [purchases] INNER JOIN [permits] ON [purchases].[type]=[permits].[type] GROUP BY [purchases].[type] "></asp:SqlDataSource>
    
    <section class="row">
        <fieldset>
            <legend>Chart Options</legend>
            <p class="contentLabel"><asp:Label ID="LableTest" AssociatedControlID="ChartType" runat="server" Text="Chart Type:"></asp:Label></p>
            <asp:DropDownList CssClass="staffSelectBox" ID="ChartType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChartType_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="Column">Column</asp:ListItem>
                <asp:ListItem Value="Pie">Pie</asp:ListItem>
                <asp:ListItem Value="Line">Line</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="test" runat="server"></asp:Label>

            <p class="contentLabel"><asp:Label AssociatedControlID="ChartDimension" runat="server" Text="Chart Dimension:"></asp:Label></p>
            <asp:DropDownList CssClass="staffSelectBox" ID="ChartDimension" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ChartDimension_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="2D">2D</asp:ListItem>
                <asp:ListItem Value="3D">3D</asp:ListItem>
            </asp:DropDownList>
        </fieldset>
    </section>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="plotChartsDatasource">
        <Titles>
            <asp:Title Text="Purchased Permits on Catagory"></asp:Title>
        </Titles>
        <Series>
            <asp:Series Name="Series1" XValueMember="Type" YValueMembers="Column1"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="PermitType"></AxisX>
                <AxisY Title="PurchasedAmount"></AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>