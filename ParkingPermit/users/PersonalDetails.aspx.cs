using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace ParkingPermit.users
{
    public partial class PersonalDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["username"].DefaultValue = Context.User.Identity.GetUserName();
            
        }

        protected void showSuccess(object sender, EventArgs e)
        {
            successLabel.Text = "User Details Has Been Successfully Updated";
        }


    }
}