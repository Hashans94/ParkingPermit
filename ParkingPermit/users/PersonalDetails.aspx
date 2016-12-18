<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PersonalDetails.aspx.cs" Inherits="ParkingPermit.users.PersonalDetails" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PermitPurchases %>" SelectCommand="SELECT * FROM [users] WHERE ([username] = @username)" DeleteCommand="DELETE FROM [users] WHERE [username] = @username" InsertCommand="INSERT INTO [users] ([username], [gname], [sname], [address], [state], [postcode], [mobile]) VALUES (@username, @gname, @sname, @address, @state, @postcode, @mobile)" UpdateCommand="UPDATE [users] SET [gname] = @gname, [sname] = @sname, [address] = @address, [state] = @state, [postcode] = @postcode, [mobile] = @mobile WHERE [username] = @username">
        <SelectParameters>
            <asp:Parameter Name="username" Type="String" DefaultValue="" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="gname" Type="String" />
            <asp:Parameter Name="sname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="postcode" Type="String" />
            <asp:Parameter Name="mobile" Type="String" />
            <asp:Parameter Name="username" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" Width="800px" DataSourceID="SqlDataSource1" DataKeyNames="username">
        <EditItemTemplate>
            <div class="form-group">
                <p>
                    <asp:Label runat="server" Text="Username:" CssClass="col-md-2 control-label"></asp:Label>
                </p>
                <div class="col-md-10">
                    <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
                </div>
            </div>
            <br />
            <div class="form-group">
                <p>
                    <asp:Label runat="server" AssociatedControlID="gnameTextBox" Text="Given Name:" CssClass="col-md-2 control-label"></asp:Label>
                </p>
                <div class="col-md-10">
                    <asp:TextBox ID="gnameTextBox" runat="server" Text='<%# Bind("gname") %>' />
                    <asp:RequiredFieldValidator ID="firstNameRequired" Display="Dynamic" ControlToValidate="gnameTextBox" CssClass="text-danger" runat="server" ErrorMessage="The Given Name field is Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="firstNameValidator" Display="Dynamic" ControlToValidate="gnameTextBox" ValidationExpression="[a-zA-z\'\-]+" runat="server" CssClass="text-danger" ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />

            <div class="form-group">
                <p>
                    <asp:Label runat="server" AssociatedControlID="snameTextBox" Text="Surname:" CssClass="col-md-2 control-label"></asp:Label>
                </p>
                <div class="col-md-10">
                    <asp:TextBox ID="snameTextBox" runat="server" Text='<%# Bind("sname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="snameTextBox" CssClass="text-danger" runat="server" ErrorMessage="The Surname Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ControlToValidate="snameTextBox" ValidationExpression="[a-zA-z\'\-]+" runat="server" CssClass="text-danger" ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>

                </div>
            </div>
            <br />


            <div class="form-group">
                <p>
                    <asp:Label runat="server" AssociatedControlID="addressTextBox" Text="Address:" CssClass="col-md-2 control-label"></asp:Label>
                </p>
                <div class="col-md-10">
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                    <asp:RequiredFieldValidator ID="addressRequired" Display="Dynamic" ControlToValidate="addressTextBox" CssClass="text-danger" runat="server" ErrorMessage="The address field is Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            
            <div class="form-group">
                <p>
                    <asp:Label runat="server" AssociatedControlID="stateTextBox" Text="State:" CssClass="col-md-2 control-label"></asp:Label>
                </p>
                <div class="col-md-10">
                   

                    <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                    <asp:RequiredFieldValidator ID="stateValidator" Display="Dynamic" ControlToValidate="stateTextBox" CssClass="text-danger" runat="server" ErrorMessage="The state field is Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div class="form-group">
                <p>
                    <asp:Label runat="server" AssociatedControlID="TextBox1" Text="Postcode:" CssClass="col-md-2 control-label"></asp:Label>
                </p>
                <div class="col-md-10">
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("postcode") %>' />
                    <asp:RequiredFieldValidator ID="postcodeValidator" ControlToValidate="TextBox1" CssClass="text-danger" runat="server" ErrorMessage="The postcode field is Required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="postcodePatternValidate" Display="Dynamic" ControlToValidate="TextBox1" CssClass="text-danger" runat="server" ValidationExpression="[0-9]{4}" ErrorMessage="Postcode can MUST contain 4 Numeric characters"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />


            <div class="form-group">
                <p>
                    <asp:Label runat="server" AssociatedControlID="TextBox2" Text="Mobile:" CssClass="col-md-2 control-label"></asp:Label>
                </p>
                <div class="col-md-10">
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mobile") %>' />
                    <asp:RequiredFieldValidator ID="mobileValidator" Display="Dynamic" ControlToValidate="TextBox2" CssClass="text-danger" runat="server" ErrorMessage="The mobile field is Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="mobilePatternValidator" CssClass="text-danger" Display="Dynamic" ControlToValidate="TextBox2" ValidationExpression="04[0-9]{8}" runat="server" ErrorMessage="Invalid Mobile Number, Please follow this format 04dddddddd (where d is a digit)"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />


            <asp:LinkButton ID="UpdateButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Update" Text="Update" OnClick="showSuccess" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>

        <ItemTemplate>
            <asp:LinkButton CssClass="btn btn-primary" style="float:right;" ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /><br />

            
                <p class="contentLabel">Username:</p>
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
           
            <br />
            <p class="contentLabel">Given Name:</p>
            <asp:Label ID="gnameLabel" runat="server" Text='<%# Bind("gname") %>' />
            <br />
            <p class="contentLabel">Surname:</p>
            <asp:Label ID="snameLabel" runat="server" Text='<%# Bind("sname") %>' />
            <br />
            <p class="contentLabel">Address:</p>
            <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
            <br />
            <p class="contentLabel">State:</p>
            <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("state") %>' />
            <br />
            <p class="contentLabel">Postcode:</p>
            <asp:Label ID="postcodeLabel" runat="server" Text='<%# Bind("postcode") %>' />
            <br />
           <p class="contentLabel"> Mobile:</p>
            <asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("mobile") %>' />
            <br />
        </ItemTemplate>
        
    </asp:FormView>
   <h3> <asp:label ID="successLabel" ForeColor="#009900" runat="server" Text=""></asp:label></h3>


</asp:Content>
