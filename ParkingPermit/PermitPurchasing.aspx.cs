using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParkingPermit
{
    public partial class PermitPurchasing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void userDetailNext_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) {
                parkingPermit.ActiveViewIndex = 1;
            }
        }

        protected void permitDetailsPrev_Click(object sender, EventArgs e)
        {
            parkingPermit.ActiveViewIndex = 0;
        }

        protected void permitDetailsNext_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                parkingPermit.ActiveViewIndex = 2;
                cardHolderName.Text = firstName.Text + " " + lastName.Text;
            }
        }


        protected void cardPrevButton_Click(object sender, EventArgs e)
        {
            parkingPermit.ActiveViewIndex = 1;
        }

        protected void cardNextButton_Click(object sender, EventArgs e)
        {
            /*Formatting the card Number*/
            var cardNumberFormat = cardNumber.Text;
            var firstBatch = cardNumberFormat.Substring(0, 4);
            var secondBatch = cardNumberFormat.Substring(4, 4);
            var thirdBatch = cardNumberFormat.Substring(8, 4);
            var fourthBatch = cardNumberFormat.Substring(12, 4);

            parkingPermit.ActiveViewIndex = 3;
            summaryTitle.Text = title.SelectedValue;
            summaryFirstName.Text = firstName.Text;
            summaryLastName.Text = lastName.Text;
            summaryDOB.Text = dateOfBirth.Text;
            summaryAddress.Text = address.Text;
            summarySuburb.Text = suburb.Text;
            summaryState.Text = state.SelectedValue;
            summaryPostcode.Text = postcode.Text;
            summmaryMobile.Text = mobile.Text;
            summaryEmail.Text = email.Text;

            summaryPermitType.Text = permitType.SelectedValue;
            summaryPermitDuration.Text = permitDuration.SelectedValue;
            summaryPermitStartingDate.Text = permitStartingDate.Text;

            summaryCardType.Text = cardType.SelectedValue;
            summaryNameOnCard.Text = firstName.Text + " " + lastName.Text;
            summaryCardNumber.Text = firstBatch + " - " + secondBatch + " - " + thirdBatch + " - " + fourthBatch;
            summaryExpiryMonth.Text = cardExpiryMonth.Text;
            summaryExpiryYear.Text = expiryYear.Text;
            summarySecurityCode.Text = cardSecurityCode.Text;
        }


        protected void cvalidatorDOB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt = new DateTime();

            if (DateTime.TryParse(dateOfBirth.Text, out dt))
                {
                if (dt > new DateTime(2000, 7, 1))
                {
                    cvalidatorDOB.Text = "Invalid Date, Please Enter a Date Before 01/07/2000";
                    args.IsValid = false;
                }
                else
                {
                    //valid
                    args.IsValid = true;
                }
                    //

            }
            else
                cvalidatorDOB.Text = "";
        }

        protected void btnEditUserDetails_Click(object sender, EventArgs e)
        {
            parkingPermit.ActiveViewIndex = 0;
        }


        protected void btnEditParkingDetails_Click(object sender, EventArgs e)
        {
            parkingPermit.ActiveViewIndex = 1;
        }

        protected void btnEditPaymentDetails_Click(object sender, EventArgs e)
        {
            parkingPermit.ActiveViewIndex = 2;
        }

        protected void validatorPermitDuration_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt = new DateTime();

            if (DateTime.TryParse(permitStartingDate.Text, out dt))
            {
                
                if (dt < DateTime.Now)
                {
                    validatorPermitDuration.Text = "Permit starting date must be after todays date";
                    args.IsValid = false;
                }
                else
                {
                    //valid
                    args.IsValid = true;
                }
                //

            }
            else
                cvalidatorDOB.Text = "";
        }
    }
}