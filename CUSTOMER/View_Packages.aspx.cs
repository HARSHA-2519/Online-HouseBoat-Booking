using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_View_Packages : System.Web.UI.Page
{
    BoatBookingClass ViewCust = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            ViewCust.BoatConnection();
            if (!IsPostBack)
            {
                BindCustDetails();
            }
        }
    }
   //Bind the Table Package For Package Details in DetailsView
    public void BindCustDetails()
    {
        ViewCust.BoatQuery = @"SELECT        PACKAGES.Pack_name, PACKAGES.Tot_days, PACKAGES.Valid_from, PACKAGES.Valid_to_dt, PACKAGES.Food_avail, PACKAGES.Pack_id, PACKAGES.Extra_facility, PACKAGES.Image, PACKAGES.Duration, 
                         PACKAGES.Rate, PACKAGES.Active, LOCATION.Loc_name AS FromLoc, LOCATION.Loc_id AS FromLocID, LOCATION_1.Loc_id AS ToLocID, LOCATION_1.Loc_name AS ToLoc, HOUSE_BOAT_REG.Boat_id, 
                         HOUSE_BOAT_REG.Boatname
FROM            PACKAGES INNER JOIN
                         LOCATION ON PACKAGES.From_loc_id = LOCATION.Loc_id INNER JOIN
                         LOCATION AS LOCATION_1 ON PACKAGES.To_loc_id = LOCATION_1.Loc_id INNER JOIN
                         HOUSE_BOAT_REG ON PACKAGES.Boat_id = HOUSE_BOAT_REG.Boat_id";
        ViewCust.BoatGetDataset(ViewCust.BoatQuery);
        dvPackage.DataSource = ViewCust.BoatDs;
        dvPackage.DataBind();
    }
    protected void dvPackage_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        dvPackage.PageIndex = e.NewPageIndex;
        BindCustDetails();
    }
}