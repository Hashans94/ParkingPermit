using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace ParkingPermit.users
{
    public partial class MyPurchases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            myPurchasesDataSource.SelectParameters["username"].DefaultValue = Context.User.Identity.GetUserName();
        }

        protected void Pre_Render(object sender, EventArgs e)
        {
            if(mainGrid.SelectedRow != null)
            {
                PurchasesDetailsView.Visible = true;
            }
            else
            {
                PurchasesDetailsView.Visible = false;
            }
        }
    }
}