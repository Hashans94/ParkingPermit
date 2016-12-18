<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PermitPurchasing.aspx.cs" Inherits="ParkingPermit.PermitPurchasing" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
     $(function () {
         $("#MainContent_dateOfBirth").datepicker({
             showAnim: "slide",
             changeMonth: true,
             changeYear: true,
             yearRange: "1900:2000",
             dateFormat: "dd/mm/yy"
             //maxDate: "-1M -4D"
         });

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
    
    <asp:MultiView ID="parkingPermit" ActiveViewIndex="0" runat="server">
    <asp:View ID="userDetails" runat="server">
       <fieldset>
       <legend>User Details</legend>
        <p class="contentLabel"><asp:Label  for="title" runat="server" Text="Title:<span class='requiredField'>*</span>"></asp:Label></p> 
        <asp:DropDownList ID="title" runat="server">
            <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
            <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
            <asp:ListItem Value="Ms.">Ms.</asp:ListItem>
            <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
            <asp:ListItem Value="Prof.">Prof.</asp:ListItem>
        </asp:DropDownList>
           <asp:RequiredFieldValidator ID="titleRequired" ControlToValidate="title" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
           
           <p class="contentLabel"><asp:Label runat="server" Text="First Name:<span class='requiredField'>*</span>" for="fistName"></asp:Label></p>
          
           <asp:TextBox ID="firstName" placeholder="First Name" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="firstNameRequired" Display="Dynamic" ControlToValidate="firstName" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="firstNameValidator" Display="Dynamic" ControlToValidate="firstName" ValidationExpression="[a-zA-z\'\-]+" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>

           <p class="contentLabel"><asp:Label for="lastName" runat="server" Text="Last Name:<span class='requiredField'>*</span>"></asp:Label></p>
           <asp:TextBox ID="lastName" placeholder="Last Name" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="lastNameRequired" Display="Dynamic" ControlToValidate="lastname" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="lastNameValidator" Display="Dynamic" ControlToValidate="lastName" ValidationExpression="[a-zA-z\'\-]+" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid Name Format (allowed charcters a-z ' - ONLY)"></asp:RegularExpressionValidator>

           <p class="contentLabel"><asp:Label for="dateOfBirth" runat="server" Text="Date Of Birth:<span class='requiredField'>*</span>"></asp:Label></p>
           <asp:TextBox ID="dateOfBirth" placeholder="eg: 30/07/2016" runat="server" autocomplete="off"></asp:TextBox>
           <asp:RequiredFieldValidator ID="dobValidator" Display="Dynamic" ControlToValidate="dateOfBirth" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="datePatternValidator" ControlToValidate="dateOfBirth" ValidationExpression="[0-9]{2}\/[0-9]{2}\/[0-9]{4}" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid date format, please follow dd/mm/yyyy" Display="Dynamic"></asp:RegularExpressionValidator>
           <asp:CustomValidator ID="cvalidatorDOB" runat="server" ErrorMessage="CustomValidator" ForeColor="#cc0000" ControlToValidate="dateOfBirth" OnServerValidate="cvalidatorDOB_ServerValidate"></asp:CustomValidator>

           <p class="contentLabel"><asp:Label for="address" runat="server" Text="Address:<span class='requiredField'>*</span>"></asp:Label></p>
           <asp:TextBox ID="address" placeholder="Address" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="addressRequired" Display="Dynamic" ControlToValidate="address" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

           <p class="contentLabel"><asp:Label for="suburb" runat="server" Text="Suburb:<span class='requiredField'>*</span>"></asp:Label></p>
           <asp:TextBox ID="suburb" placeholder="Suburb" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="suburbRequired" Display="Dynamic" ControlToValidate="suburb" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

           <p class="contentLabel"><asp:Label for="state" runat="server" Text="State:<span class='requiredField'>*</span>"></asp:Label></p>
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
           <asp:RequiredFieldValidator ID="stateValidator" Display="Dynamic" ControlToValidate="state" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

           <p class="contentLabel"><asp:Label for="postcode" runat="server" Text="Postcode:<span class='requiredField'>*</span>"></asp:Label></p>
           <asp:TextBox ID="postcode" placeholder="Postcode" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="postcodeValidator" ControlToValidate="postcode" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required" Display="Dynamic"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="postcodePatternValidate" Display="Dynamic" ControlToValidate="postcode" ForeColor="#cc0000" runat="server" ValidationExpression="[0-9]{4}" ErrorMessage="Postcode can MUST contain 4 Numeric characters"></asp:RegularExpressionValidator>

           <p class="contentLabel"><asp:Label for="mobile" runat="server" Text="Mobile:<span class='requiredField'>*</span>"></asp:Label></p>
           <asp:TextBox ID="mobile" type="number" placeholder="04dddddddd" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="mobileValidator" Display="Dynamic" ControlToValidate="mobile" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="mobilePatternValidator" ForeColor="#cc0000" Display="Dynamic" ControlToValidate="mobile" ValidationExpression="04[0-9]{8}" runat="server" ErrorMessage="Invalid Mobile Number, Please follow this format 04dddddddd (where d is a digit)"></asp:RegularExpressionValidator>

           <p class="contentLabel"><asp:Label for="email" runat="server" Text="Email:<span class='requiredField'>*</span>"></asp:Label></p>
           <asp:TextBox ID="email" type="email" placeholder="email@example.com" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="emailValidator" Display="Dynamic" ControlToValidate="email" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="emailPatternvalidator" Display="Dynamic" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ForeColor="#cc0000" ErrorMessage="Email Invalid, Please enter a valid email!"></asp:RegularExpressionValidator>
        </fieldset>
        <asp:Button ID="userDetailNext" class="nextButton" runat="server" Text="Next" OnClick="userDetailNext_Click" />
    </asp:View>
        

    <asp:View ID="permitDetails" runat="server">
        <fieldset>
            <legend>Parking Permit Details</legend>
            <p class="contentLabel"><asp:Label for="permitType" runat="server" Text="Permit Type:<span class='requiredField'>*</span>"></asp:Label></p>
            <asp:DropDownList ID="permitType" runat="server">
                <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                <asp:ListItem Value="Yellow">Yellow</asp:ListItem>
                <asp:ListItem Value="Blue">Blue</asp:ListItem>
                <asp:ListItem Value="Red">Red</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="permitTypeValidator" Display="Dynamic" ControlToValidate="permitType" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

            <p class="contentLabel"><asp:Label for="permitDuration" runat="server" Text="Permit Duration:<span class='requiredField'>*</span>"></asp:Label></p>
            <asp:DropDownList ID="permitDuration" runat="server">
                <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                <asp:ListItem Value="3 months">3 Months</asp:ListItem>
                <asp:ListItem Value="6 months">6 Months</asp:ListItem>
                <asp:ListItem Value="12 months">12 Months</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="permitDurationValidator" Display="Dynamic" ControlToValidate="permitDuration" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

            <p class="contentLabel"><asp:Label for="permitStartingDate" runat="server" Text="Permit Starting Date:<span class='requiredField'>*</span>"></asp:Label></p>
            <asp:TextBox ID="permitStartingDate" placeholder="eg: 30/07/2016" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="permitDateValidator" Display="Dynamic" ControlToValidate="permitStartingDate" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="permitDurationPatternValidator" ControlToValidate="permitStartingDate" ValidationExpression="[0-9]{2}\/[0-9]{2}\/[0-9]{4}" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid date format, please follow dd/mm/yyyy" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="validatorPermitDuration" ForeColor="#cc0000" ControlToValidate="permitStartingDate" runat="server" ErrorMessage="CustomValidator" Display="Dynamic" OnServerValidate="validatorPermitDuration_ServerValidate"></asp:CustomValidator>

        </fieldset>
        <asp:Button ID="permitDetailsPrev" CausesValidation="false" class="prevButton buttonFlow" runat="server" Text="Prev" OnClick="permitDetailsPrev_Click" /> 
        <asp:Button ID="permitDetailsNext" class="nextButton buttonFlow" runat="server" Text="Next" OnClick="permitDetailsNext_Click" />
    </asp:View>

    <asp:View ID="paymentDetails" runat="server">
        <fieldset>
            <legend>Payment Details</legend>
            <p class="contentLabel"><asp:Label for="cardType" runat="server" Text="Card Type:<span class='requiredField'>*</span>"></asp:Label></p>
            <asp:DropDownList ID="cardType" runat="server">
                <asp:ListItem Value="" Selected="True">-- Please Select --</asp:ListItem>
                <asp:ListItem Value="Visa">Visa</asp:ListItem>
                <asp:ListItem Value="Master">Master</asp:ListItem>
                <asp:ListItem Value="Discover">Discover</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="cardTypeRequired" Display="Dynamic" ControlToValidate="cardType" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>


            <p class="contentLabel"><asp:Label for="cardHolderName" runat="server" Text="Card Holder Name:<span class='requiredField'>*</span>"></asp:Label></p>
            <asp:TextBox ID="cardHolderName" placeholder="Cardholder Name" runat="server" Enabled="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredValidateCardHolderName" Display="Dynamic" ControlToValidate="cardHolderName" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>

            <p class="contentLabel"><asp:Label for="cardNumber" runat="server" Text="Card Number:<span class='requiredField'>*</span>"></asp:Label></p>
            <asp:TextBox ID="cardNumber" placeholder="Card Number" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="cardNumberRequired" Display="Dynamic" ControlToValidate="cardNumber" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="patternValidatorCardNumber" Display="Dynamic" ForeColor="#cc0000" ControlToValidate="cardNumber" ValidationExpression="[0-9]{1,16}" runat="server" ErrorMessage="Card Number must be 16 digits ONLY"></asp:RegularExpressionValidator>

            <p class="contentLabel"><asp:Label for="expiryMonth" runat="server" Text="Card Expiry Month:<span class='requiredField'>*</span>"></asp:Label></p>
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


             <p class="contentLabel"><asp:Label for="expiryYear" runat="server" Text="Card Expiry Year:<span class='requiredField'>*</span>"></asp:Label></p>
             <asp:TextBox ID="expiryYear" placeholder="eg: 2016" runat="server"  type="number"></asp:TextBox>
             <asp:RequiredFieldValidator ID="expiryYearRequired" Display="Dynamic" ControlToValidate="expiryYear" ForeColor="#cc0000" runat="server" ErrorMessage="This field is Required"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="expiryYearPatternMatch" ControlToValidate="expiryYear" ValidationExpression="[0-9]{4}" runat="server" ForeColor="#cc0000" ErrorMessage="Invalid Card Expiry Year" Display="Dynamic"></asp:RegularExpressionValidator>


             <p class="contentLabel"><asp:Label for="cardSecurityCode" runat="server" Text="Card Security Code:<span class='requiredField'>*</span>"></asp:Label></p>
             <asp:TextBox ID="cardSecurityCode" placeholder="eg: 123" runat="server"  type="number"></asp:TextBox>
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
                <legend>User Details</legend>
                <span class="prevButton buttonFlow button-cover fa fa-pencil-square-o"><asp:Button ID="btnEditUserDetails" Class="edit-button" runat="server" Text="Edit Section" OnClick="btnEditUserDetails_Click" /></span>
                <p class="contentLabel">
                    Title:
                    <asp:Label ID="summaryTitle" runat="server" class="summaryContent"></asp:Label>
                </p>
        <p class="contentLabel">First Name: <asp:Label ID="summaryFirstName" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">Last Name: <asp:Label ID="summaryLastName" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">Date of Birth: <asp:Label ID="summaryDOB" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">Address: <asp:Label ID="summaryAddress" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">Suburb: <asp:Label ID="summarySuburb" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">State: <asp:Label ID="summaryState" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">Postcode: <asp:Label ID="summaryPostcode" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">Mobile: <asp:Label ID="summmaryMobile" class="summaryContent" runat="server"></asp:Label></p>
        <p class="contentLabel">Email: <asp:Label ID="summaryEmail" class="summaryContent" runat="server"></asp:Label></p>
             </fieldset>

            <fieldset>
                <legend class="lbl-summary">Parking Permit Details</legend>
                <span class="prevButton buttonFlow button-cover fa fa-pencil-square-o"><asp:Button ID="btnEditParkingDetails" Class="edit-button" runat="server" Text="Edit Section" OnClick="btnEditParkingDetails_Click" /></span>
                <p class="contentLabel">Permit Type: <asp:Label ID="summaryPermitType" class="summaryContent" runat="server"></asp:Label></p>
                <p class="contentLabel">Permit Duration: <asp:Label ID="summaryPermitDuration" class="summaryContent" runat="server"></asp:Label></p>
                <p class="contentLabel">Permit Starting Date: <asp:Label ID="summaryPermitStartingDate" class="summaryContent" runat="server"></asp:Label></p>
            </fieldset>


            <fieldset>
                <legend class="lbl-summary">Payment Details</legend>
                <span class="prevButton buttonFlow button-cover fa fa-pencil-square-o"><asp:Button id="btnEditPaymentDetails" runat="server" Text="Edit Section" Class="edit-button" OnClick="btnEditPaymentDetails_Click" /></span>
                <p class="contentLabel">Card Type: <asp:Label ID="summaryCardType" class="summaryContent" runat="server"></asp:Label></p>
                <p class="contentLabel">Name on Card: <asp:Label ID="summaryNameOnCard" class="summaryContent" runat="server"></asp:Label></p>
                <p class="contentLabel">Card Number: <asp:Label ID="summaryCardNumber" class="summaryContent" runat="server"></asp:Label></p>
                <p class="contentLabel">Card Expiry Month: <asp:Label ID="summaryExpiryMonth" class="summaryContent" runat="server"></asp:Label></p>
                <p class="contentLabel">Card Expiry Year: <asp:Label ID="summaryExpiryYear" class="summaryContent" runat="server"></asp:Label></p>
                <p class="contentLabel">Card Security Code: <asp:Label ID="summarySecurityCode" class="summaryContent" runat="server"></asp:Label></p>
            </fieldset>

        </fieldset>
       
    </asp:View>

    </asp:MultiView>   
</asp:Content>

