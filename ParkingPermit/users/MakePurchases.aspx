<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakePurchases.aspx.cs" Inherits="ParkingPermit.users.MakePurchases" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>
        $(function () {
            $("#MainContent_permitStartingDate").datepicker({
                showAnim: "slide",
                changeMonth: true,
                changeYear: true,
                //yearRange: "1900:2016",
                dateFormat: "dd/mm/yy",
                minDate: "+1D"
            });
            console.log("function ready");
        });
    </script>

    <asp:SqlDataSource ID="permitTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:PermitPurchases %>" SelectCommand="SELECT * FROM [permits]"></asp:SqlDataSource>

    <asp:MultiView ID="purchasePermitMultiView" ActiveViewIndex="0" runat="server">

        <asp:View ID="permitDetails" runat="server">
            <fieldset>
                <legend>Parking Permit Details</legend>
                <p class="contentLabel">
                    <asp:Label ID="lbltype" for="permitType" runat="server" Text="Permit Type:<span class='requiredField'>*</span>"></asp:Label>
                </p>
                <asp:DropDownList ID="permitType" runat="server"  DataSourceID="permitTypeSource" DataTextField="type" DataValueField="type">
                    <%--<asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                    <asp:ListItem Value="Yellow">Yellow</asp:ListItem>
                    <asp:ListItem Value="Blue">Blue</asp:ListItem>
                    <asp:ListItem Value="Red">Red</asp:ListItem>
                    <asp:ListItem Value="Green">Green</asp:ListItem>--%>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="permitTypeValidator" Display="Dynamic" ControlToValidate="permitType" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

                <p class="contentLabel">
                    <asp:Label for="permitDuration" runat="server" Text="Permit Duration:<span class='requiredField'>*</span>"></asp:Label>
                </p>
                <asp:DropDownList ID="permitDuration" runat="server">
                    <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                    <asp:ListItem Value="3 months">3 Months</asp:ListItem>
                    <asp:ListItem Value="6 months">6 Months</asp:ListItem>
                    <asp:ListItem Value="12 months">12 Months</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="permitDurationValidator" Display="Dynamic" ControlToValidate="permitDuration" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

                <p class="contentLabel">
                    <asp:Label for="permitStartingDate" runat="server" Text="Permit Starting Date:<span class='requiredField'>*</span>"></asp:Label>
                </p>
                <asp:TextBox ID="permitStartingDate" placeholder="eg: 30/07/2016" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="permitDateValidator" Display="Dynamic" ControlToValidate="permitStartingDate" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="permitDurationPatternValidator" ControlToValidate="permitStartingDate" ValidationExpression="[0-9]{2}\/[0-9]{2}\/[0-9]{4}" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid date format, please follow dd/mm/yyyy" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="validatorPermitDuration" CssClass="text-danger" ControlToValidate="permitStartingDate" runat="server" ErrorMessage="CustomValidator" Display="Dynamic" OnServerValidate="validatorPermitDuration_ServerValidate"></asp:CustomValidator>

            </fieldset>
            <asp:Button ID="permitDetailsNext" class="nextButton buttonFlow" runat="server" Text="Next" OnClick="permitDetailsNext_Click" />
        </asp:View>

        <asp:View ID="paymentDetails" runat="server">
            <fieldset>
                <legend>Payment Details</legend>
                <p class="contentLabel">
                    <asp:Label AssociatedControlID="price" runat="server" Text="Price:<span class='requiredField'>*</span>"></asp:Label></p>
                <asp:TextBox ID="price" placeholder="$100.00" Enabled="false" runat="server"></asp:TextBox>

                <p class="contentLabel">
                    <asp:Label for="cardType" runat="server" Text="Card Type:<span class='requiredField'>*</span>"></asp:Label></p>
                <asp:DropDownList ID="cardType" runat="server">
                    <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                    <asp:ListItem Value="Visa">Visa</asp:ListItem>
                    <asp:ListItem Value="Master">Master</asp:ListItem>
                    <asp:ListItem Value="Discover">Discover</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="cardTypeRequired" Display="Dynamic" ControlToValidate="cardType" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>


                <p class="contentLabel">
                    <asp:Label for="cardHolderName" runat="server" Text="Card Holder Name:<span class='requiredField'>*</span>"></asp:Label></p>
                <asp:TextBox ID="cardHolderName" placeholder="Cardholder Name" runat="server" Enabled="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="requiredValidateCardHolderName" Display="Dynamic" ControlToValidate="cardHolderName" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

                <p class="contentLabel">
                    <asp:Label for="cardNumber" runat="server" Text="Card Number:<span class='requiredField'>*</span>"></asp:Label></p>
                <asp:TextBox ID="cardNumber" placeholder="Card Number" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="cardNumberRequired" Display="Dynamic" ControlToValidate="cardNumber" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="patternValidatorCardNumber" Display="Dynamic" ForeColor="#cc0000" ControlToValidate="cardNumber" ValidationExpression="[0-9]{16}" runat="server" ErrorMessage="Card Number must be 16 digits ONLY"></asp:RegularExpressionValidator>

                <p class="contentLabel">
                    <asp:Label for="expiryMonth" runat="server" Text="Card Expiry Month:<span class='requiredField'>*</span>"></asp:Label></p>
                <asp:DropDownList ID="cardExpiryMonth" runat="server">
                    <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                    <asp:ListItem Value="January">January</asp:ListItem>
                    <asp:ListItem Value="February">February</asp:ListItem>
                    <asp:ListItem Value="March">March</asp:ListItem>
                    <asp:ListItem Value="April">April</asp:ListItem>
                    <asp:ListItem Value="May">May</asp:ListItem>
                    <asp:ListItem Value="June">June</asp:ListItem>
                    <asp:ListItem Value="July">July</asp:ListItem>
                    <asp:ListItem Value="August">August</asp:ListItem>
                    <asp:ListItem Value="September">September</asp:ListItem>
                    <asp:ListItem Value="October">October</asp:ListItem>
                    <asp:ListItem Value="November">November</asp:ListItem>
                    <asp:ListItem Value="December">December</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="expiryMonthRequired" Display="Dynamic" ControlToValidate="cardExpiryMonth" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>


                <p class="contentLabel">
                    <asp:Label for="expiryYear" runat="server" Text="Card Expiry Year:<span class='requiredField'>*</span>"></asp:Label></p>
                <asp:TextBox ID="expiryYear" placeholder="eg: 2016" runat="server" type="number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="expiryYearRequired" Display="Dynamic" ControlToValidate="expiryYear" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="expiryYearPatternMatch" ControlToValidate="expiryYear" ValidationExpression="[0-9]{4}" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid Card Expiry Year" Display="Dynamic"></asp:RegularExpressionValidator>


                <p class="contentLabel">
                    <asp:Label for="cardSecurityCode" runat="server" Text="Card Security Code:<span class='requiredField'>*</span>"></asp:Label></p>
                <asp:TextBox ID="cardSecurityCode" placeholder="eg: 123" runat="server" type="number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="securityCodeRequired" Display="Dynamic" ControlToValidate="cardSecurityCode" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="securityCodePatternMatch" ControlToValidate="cardSecurityCode" ValidationExpression="[0-9]{3}" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid Security Number Format" Display="Dynamic"></asp:RegularExpressionValidator>

            </fieldset>
            <asp:Button ID="cardPrevButton" CausesValidation="false" class="prevButton buttonFlow" runat="server" Text="Prev" OnClick="cardPrevButton_Click" />
            <asp:Button ID="cardNextButton" class="prevButton buttonFlow" runat="server" Text="Next" OnClick="cardNextButton_Click" />
        </asp:View>

        <asp:View ID="Summary" runat="server">
            <fieldset>
                <legend>Summary</legend>

                <fieldset>
                    <legend class="lbl-summary">Parking Permit Details</legend>
                    <asp:Label runat="server" ID="btnEditParkingDetailsCover" class="prevButton buttonFlow button-cover fa fa-pencil-square-o">
                        <asp:Button ID="btnEditParkingDetails" Class="edit-button" runat="server" Text="Edit Section" OnClick="btnEditParkingDetails_Click" /></asp:Label>
                    <p class="contentLabel">Permit Type:
                        <asp:Label ID="summaryPermitType" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Permit Duration:
                        <asp:Label ID="summaryPermitDuration" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Permit Starting Date:
                        <asp:Label ID="summaryPermitStartingDate" class="summaryContent" runat="server"></asp:Label></p>
                </fieldset>


                <fieldset>
                    <legend class="lbl-summary">Payment Details</legend>
                    <asp:Label runat="server" ID="btnEditPaymentDetailsCover" class="prevButton buttonFlow button-cover fa fa-pencil-square-o">
                        <asp:Button ID="btnEditPaymentDetails" runat="server" Text="Edit Section" Class="edit-button" OnClick="btnEditPaymentDetails_Click" /></asp:Label>
                    <p class="contentLabel">Price:
                        <asp:Label ID="summaryPrice" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Card Type:
                        <asp:Label ID="summaryCardType" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Name on Card:
                        <asp:Label ID="summaryNameOnCard" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Card Number:
                        <asp:Label ID="summaryCardNumber" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Card Expiry Month:
                        <asp:Label ID="summaryExpiryMonth" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Card Expiry Year:
                        <asp:Label ID="summaryExpiryYear" class="summaryContent" runat="server"></asp:Label></p>
                    <p class="contentLabel">Card Security Code:
                        <asp:Label ID="summarySecurityCode" class="summaryContent" runat="server"></asp:Label></p>
                </fieldset>
                <asp:Button ID="submitButton" class="nextButton buttonFlow" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </fieldset>
            <h3>
                <asp:Label ID="success" runat="server" ForeColor="#009900"></asp:Label></h3>
           </asp:View>


    </asp:MultiView>
</asp:Content>
