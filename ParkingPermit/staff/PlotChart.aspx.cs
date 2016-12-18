using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace ParkingPermit.staff
{
    public partial class PlotChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChartType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string chtype = ChartType.SelectedValue;
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chtype);
            ChartDimension.SelectedValue = "2D";
        }

        protected void ChartDimension_SelectedIndexChanged(object sender, EventArgs e)
        {
            string dimtype = ChartDimension.SelectedValue;
            string chtype = ChartType.SelectedValue;

            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chtype);

            if (dimtype == "3D")
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            }
            else
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            }
        }
    }
}