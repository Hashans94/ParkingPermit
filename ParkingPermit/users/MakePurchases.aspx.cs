using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;
using Microsoft.AspNet.Identity;

namespace ParkingPermit.users
{
    public partial class MakePurchases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            submitButton.Visible = true;
            btnEditParkingDetailsCover.Visible = true;
            btnEditPaymentDetailsCover.Visible = true;
        }

        protected void permitDetailsNext_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["PermitPurchases"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            //Double permitCost;

            String sql; /*= "SELECT quarter_price FROM permits WHERE type = @type";*/
            String sql2 = "SELECT gname, sname FROM users WHERE username = @username";

            switch (permitDuration.SelectedValue)
            {
                case "3 months":
                    sql = "SELECT quarter_price FROM permits WHERE type = @type";
                    break;

                case "6 months":
                    sql = "SELECT halfyear_price FROM permits WHERE type = @type";
                    break;

                case "12 months":
                default:
                    sql = "SELECT year_price FROM permits WHERE type = @type";
                    break;
            }

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);

            cmd.Parameters.AddWithValue("@type", permitType.SelectedValue);
            cmd2.Parameters.AddWithValue("@username", Context.User.Identity.GetUserName());

            using (con)
            {
                con.Open();
                
                Object result = cmd.ExecuteScalar();
                if (result != null)
                    //permitCost = result;
                    price.Text = String.Format("{0:F2}", result);
                else
                    price.Text = "No Match";

                SqlDataReader reader = cmd2.ExecuteReader();

                if(reader.HasRows)
                {
                    while (reader.Read())
                    {
                        cardHolderName.Text = (String)reader["gname"] + " " + (String)reader["sname"];
                    }
                }

                // price.Text = (String)reader["year_price"];
            }

            if(Page.IsValid)
               purchasePermitMultiView.ActiveViewIndex = 1;
        }

        protected void cardNextButton_Click(object sender, EventArgs e)
        {
           var cardNumberFormat = cardNumber.Text;
           var firstBatch = cardNumberFormat.Substring(0, 4);
           var secondBatch = cardNumberFormat.Substring(4, 4);
           var thirdBatch = cardNumberFormat.Substring(8, 4);
           var fourthBatch = cardNumberFormat.Substring(12, 4);

            summaryPermitType.Text = permitType.SelectedValue;
            summaryPermitDuration.Text = permitDuration.SelectedValue;
            summaryPermitStartingDate.Text = permitStartingDate.Text;

            summaryPrice.Text = price.Text;
            summaryCardType.Text = cardType.SelectedValue;
            summaryNameOnCard.Text = cardHolderName.Text;
            summaryCardNumber.Text = firstBatch + " - " + secondBatch + " - " + thirdBatch + " - " + fourthBatch;
            summaryExpiryMonth.Text = cardExpiryMonth.Text;
            summaryExpiryYear.Text = expiryYear.Text;
            summarySecurityCode.Text = cardSecurityCode.Text;

            submitButton.Visible = true;
            btnEditParkingDetailsCover.Visible = true;
            btnEditPaymentDetailsCover.Visible = true;


            purchasePermitMultiView.ActiveViewIndex = 2;
        }

        protected void cardPrevButton_Click(object sender, EventArgs e)
        {
            purchasePermitMultiView.ActiveViewIndex = 0;
        }

        /*Summary Buttons*/

        protected void btnEditParkingDetails_Click(object sender, EventArgs e)
        {
            purchasePermitMultiView.ActiveViewIndex = 0;
        }

        protected void btnEditPaymentDetails_Click(object sender, EventArgs e)
        {
            purchasePermitMultiView.ActiveViewIndex = 1;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime localDate = DateTime.Now;

            DateTime purchaseDate = Convert.ToDateTime(permitStartingDate.Text);

            //CultureInfo au = new CultureInfo("en-AU");

            //Thread.CurrentThread.CurrentCulture = au;

            //String format = "hh:mm:sszzz";
            // String str = string.Format("{0:T}", now);


            //DateTime currentTime = DateTime.ParseExact(str, format, au.DateTimeFormat);



            String permit_duration;

            if (permitDuration.SelectedValue == "12 months")
            {
                permit_duration = "12";
            }
            else
            {
                permit_duration  = permitDuration.SelectedValue.Substring(0, 1);
            }

           


            string connectionString = WebConfigurationManager.ConnectionStrings["PermitPurchases"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);

            String sql = "Insert INTO purchases (type,username,startdate,duration,cost,ptime) VALUES (@type, @username,@startdate, @duration, @cost, @time)";

            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@type", permitType.SelectedValue);
            cmd.Parameters.AddWithValue("@username", Context.User.Identity.GetUserName());
            cmd.Parameters.AddWithValue("@startdate", purchaseDate);
            cmd.Parameters.AddWithValue("@duration", Convert.ToInt32(permit_duration));
            cmd.Parameters.AddWithValue("@cost", Convert.ToDouble (price.Text));
            cmd.Parameters.AddWithValue("@time", localDate);

            using (con)
            {
                con.Open();

                cmd.ExecuteNonQuery();
                success.Text = "Your Purchase Has Been Successful";
                submitButton.Visible = false;
                btnEditParkingDetailsCover.Visible = false;
                btnEditPaymentDetailsCover.Visible = false;
                
            }
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
                validatorPermitDuration.Text = "";
        }
    }
}