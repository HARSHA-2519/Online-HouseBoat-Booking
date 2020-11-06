using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_View_Tariff : System.Web.UI.Page
{
    BoatBookingClass VTariff = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            VTariff.BoatConnection();
            if (!IsPostBack)
            {
                BindTariff();
            }
        }
    }
    //Bind the tables for view the rate of Boat
    public void BindTariff()
    {
        VTariff.BoatQuery = @"SELECT HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, BOAT_TYPE.Typename, HOUSE_BOAT_REG.Tot_rooms, HOUSE_BOAT_REG.Boat_image, HOUSE_BOAT_REG.Rate_per_day
FROM HOUSE_BOAT_REG INNER JOIN
                         BOAT_TYPE ON HOUSE_BOAT_REG.Btype_id = BOAT_TYPE.Btype_id";
        VTariff.BoatGetDataset(VTariff.BoatQuery);
        gvViewTariff.DataSource = VTariff.BoatDs;
        gvViewTariff.DataBind();
        
    }
}