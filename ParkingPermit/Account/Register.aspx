<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ParkingPermit.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <%--<div class="form-group">
            <p class="contentLabel"><asp:Label runat="server" AssociatedControlID="userName" Text="Username:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="username" CssClass="form-control"/>
                <asp:RequiredFieldValidator ID="usernameValidator" Display="Dynamic" ControlToValidate="userName" CssClass="text-danger" runat="server" ErrorMessage="The username field is required"></asp:RequiredFieldValidator>
            </div>
        </div>--%>

        <div class="form-group">
            <p class="contentLabel"><asp:Label runat="server" AssociatedControlID="Email" Text="Email:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        
        <div class="form-group">
            <p class="contentLabel"><asp:Label runat="server" AssociatedControlID="Password" Text="Password:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <p class="contentLabel"><asp:Label runat="server" AssociatedControlID="ConfirmPassword" Text="Confirm password:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
         <div class="form-group">
             <p class="contentLabel"><asp:Label runat="server" AssociatedControlID="givenName" Text="Given name:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
                <div class="col-md-10">
                  <asp:TextBox runat="server" ID="givenName" CssClass="form-control"/>
                  <asp:RequiredFieldValidator ID="givenNameValidator" Display="Dynamic" ControlToValidate="givenName" CssClass="text-danger" runat="server" ErrorMessage="The given field is required"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="givenNamePatternValidator" Display="Dynamic" ControlToValidate="givenName" ValidationExpression="[a-zA-z\'\-]+" runat="server" CssClass="text-danger" ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>
                </div>
        </div>

        <div class="form-group">
             <p class="contentLabel"><asp:Label runat="server" AssociatedControlID="lastName" Text="Surname:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
                <div class="col-md-10">
                  <asp:TextBox runat="server" ID="lastName" CssClass="form-control"/>
                  <asp:RequiredFieldValidator ID="lastNameValidator" Display="Dynamic" ControlToValidate="lastName" CssClass="text-danger" runat="server" ErrorMessage="The lastname field is required"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="lastNamePatternValidator" Display="Dynamic" ControlToValidate="lastName" ValidationExpression="[a-zA-z\'\-]+" runat="server" CssClass="text-danger" ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>
                </div>
        </div> 

        <div class="form-group">
            <p class="contentLabel"><asp:Label runat="server" AssociatedControlID="address" Text="Address:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
            <div class="col-md-10">
                <asp:TextBox ID="address" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="addressRequired" Display="Dynamic" ControlToValidate="address" CssClass="text-danger" runat="server" ErrorMessage="The address field is Required"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
           <p class="contentLabel"><asp:Label AssociatedControlID="state" runat="server" Text="State:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
           <div class="col-md-10">
            <asp:DropDownList ID="state" runat="server">
               <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                <asp:ListItem Value="NSW">NSW</asp:ListItem>
                <asp:ListItem Value="ACT">ACT</asp:ListItem>
                <asp:ListItem Value="VIC">VIC</asp:ListItem>
                <asp:ListItem Value="WA">WA</asp:ListItem>
                <asp:ListItem Value="QLD">QLD</asp:ListItem>
                <asp:ListItem Value="SA">SA</asp:ListItem>
                <asp:ListItem Value="NT">NT</asp:ListItem>
                <asp:ListItem Value="TAS">TAS</asp:ListItem>
            </asp:DropDownList>
            <br /><asp:RequiredFieldValidator ID="stateValidator" Display="Dynamic" ControlToValidate="state" CssClass="text-danger" runat="server" ErrorMessage="The state field is Required"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <p class="contentLabel">
                <asp:Label AssociatedControlID="postcode" runat="server" Text="Postcode:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
            <div class="col-md-10">
                <asp:TextBox ID="postcode" placeholder="Postcode" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="postcodeValidator" ControlToValidate="postcode" CssClass="text-danger" runat="server" ErrorMessage="The postcode field is Required" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="postcodePatternValidate" Display="Dynamic" ControlToValidate="postcode" CssClass="text-danger" runat="server" ValidationExpression="[0-9]{4}" ErrorMessage="Postcode can MUST contain 4 Numeric characters"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <p class="contentLabel">
                <asp:Label AssociatedControlID="mobile" runat="server" Text="Mobile:<span class='requiredField'>*</span>" CssClass="col-md-2 control-label"></asp:Label></p>
            <div class="col-md-10">
                <asp:TextBox ID="mobile" type="text" placeholder="04dddddddd" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="mobileValidator" Display="Dynamic" ControlToValidate="mobile" CssClass="text-danger" runat="server" ErrorMessage="The mobile field is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="mobilePatternValidator" CssClass="text-danger" Display="Dynamic" ControlToValidate="mobile" ValidationExpression="04[0-9]{8}" runat="server" ErrorMessage="Invalid Mobile Number, Please follow this format 04dddddddd (where d is a digit)"></asp:RegularExpressionValidator>
            </div>
        </div>


        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>

    </div>
</asp:Content>
