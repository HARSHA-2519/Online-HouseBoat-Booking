using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_Search_Boat_Details : System.Web.UI.Page
{
    BoatBookingClass SearchBoat = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            SearchBoat.BoatConnection();
            if (!IsPostBack)
            {
                BindLocation();
            }
        }
    }
    //Search Boat Deatils
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SearchBoat.BoatQuery = @"SELECT        HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, LOCATION.Loc_id, LOCATION.Loc_name, HOUSE_BOAT_REG.Boat_image
FROM            HOUSE_BOAT_REG INNER JOIN
                         LOCATION ON HOUSE_BOAT_REG.Loc_id = LOCATION.Loc_id where LOCATION.Loc_id="+ddlLocation.SelectedValue+"";
        SearchBoat.BoatGetDataset(SearchBoat.BoatQuery);
        gvBoatName.DataSource = SearchBoat.BoatDs;
        gvBoatName.DataBind();
    }
    //Binf Location Details
    public void BindLocation()
    {
        SearchBoat.BoatQuery = "Select * from Location";
        SearchBoat.BoatReadData(SearchBoat.BoatQuery);
        ddlLocation.DataSource = SearchBoat.BoatDr;
        ddlLocation.DataTextField = "Loc_name";
        ddlLocation.DataValueField = "Dist_id";
        ddlLocation.DataBind();
        ddlLocation.Items.Insert(0, "---Location---");
        SearchBoat.BoatDr.Close();
    }
    protected void gvBoatName_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "More")
        {
            Session["boatid"] = gvBoatName.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            Response.Redirect("~/CUSTOMER/SearchMore.aspx");
        }
    }
}