<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ParkingPermit._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LoginView runat="server" ViewStateMode="Disabled">
        <AnonymousTemplate>
            <div class="jumbotron">
                <%-- <h1>Welcome!</h1>--%>
                <h1>Western Sydney University</h1>
                <h3>Parking Permit Purchasing System</h3>
                <p class="lead">Our University has three types of parking permits available: Yellow, Blue and Red. Each type of Parking Permit can be purchased for 3 months, 6 months and 12 months only. </p>
                <h4>Each parking permit are in detail below:</h4>
                <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <h2>Yellow Parking Permit</h2>
                    <p>
                        Buying and displaying a valid General Yellow permit (annual or half year) lets you park in a yellow parking bay on any campus. General Yellow permits are offered at a reduced rate to students of the University.
                    </p>
                    <p>
                        <strong>Note:</strong> There are no yellow bays on Parramatta South campus.
                    </p>
                    <%--<p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>--%>
                </div>
                <div class="col-md-4">
                    <h2>Blue Parking Permit</h2>
                    <p>
                        Buying and displaying a valid Communal Blue parking permit lets you park in a blue or yellow parking bay on any campus. Blue parking bays are usually closer to buildings than yellow bays.
                    </p>
                    <p>
                        <strong>Note:</strong> Only a limited number of Communal Blue parking permits are offered. The University Parking team monitor the number of Communal Blue permits issued and will stop issuing them once we are at capacity.
                    </p>
                    <%-- <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>--%>
                </div>
                <div class="col-md-4">
                    <h2>Red Parking Permit</h2>
                    <p>
                        Buying and displaying a valid Dedicated Red parking permit lets you park in the numbered red bay assigned to you on your nominated campus as well as any blue or yellow parking bay on any campus. You cannot park in red bays that have not been assigned to you.
                    </p>
                    <p>
                        <strong>Note:</strong> The purchase of a Dedicated Red parking permit only guarantees you a parking bay during peak hours (5:30am – 5:30pm). Outside of peak hours (5:30pm - 5:30am) red parking bays are available to Communal Blue and Restricted Orange permit holders.
                    </p>
                    <%--<p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>--%>
                </div>
            </div>
        </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="user">
                <ContentTemplate>
                    <div class="jumbotron">

                        <h1>Welcome! <%: Context.User.Identity.GetUserName()  %></h1>
                        <p class="lead">Introduction</p>

                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <h2>Personal Details</h2>
                            <p>
                                This page enable a logged-in user to update his/her details in the database. 
                            </p>


                        </div>
                        <div class="col-md-4">
                            <h2>Make Purchases</h2>
                            <p>
                                This page should allow a logged-in user to display details of all his/her permit purchases to date. 
                            </p>


                        </div>
                        <div class="col-md-4">
                            <h2>My Purchases</h2>
                            <p>
                                This page enables a logged-in user to make a new purchase
                            </p>

                        </div>
                    </div>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="staff">
                <ContentTemplate>
                    <div class="jumbotron">

                        <h1>Welcome! <%: Context.User.Identity.GetUserName()  %></h1>
                        <p class="lead">Introduction</p>

                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <h2>Manage Permits</h2>
                            <p>
                                This page enable a logged-in staf to manage parking permits in the database. 
                            </p>


                        </div>
                        <div class="col-md-4">
                            <h2>Plot Charts</h2>
                            <p>
                                This page should allow a logged-in staff to view purchases against different types of permits. 
                            </p>


                        </div>
                    </div>
                    </ContentTemplate>
                    </asp:RoleGroup>
        
        </RoleGroups>

        <LoggedInTemplate>

            <div class="jumbotron">

                <h1>Welcome! <%: Context.User.Identity.GetUserName()  %></h1>
                <p class="lead">Introduction</p>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <h2>Personal Details</h2>
                    <p>
                        This page enable a logged-in user to update his/her details in the database. 
                    </p>


                </div>
                <div class="col-md-4">
                    <h2>Make Purchases</h2>
                    <p>
                        This page should allow a logged-in user to display details of all his/her permit purchases to date. 
                    </p>


                </div>
                <div class="col-md-4">
                    <h2>My Purchases</h2>
                    <p>
                        This page enables a logged-in user to make a new purchase
                    </p>

                </div>
            </div>

        </LoggedInTemplate>

    </asp:LoginView>

</asp:Content>
