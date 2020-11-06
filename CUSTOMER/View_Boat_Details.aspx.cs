using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CUSTOMER_View_Boat_Details : System.Web.UI.Page
{
    BoatBookingClass ViewBoatDetails = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            ViewBoatDetails.BoatConnection();
            if (!IsPostBack)
            {
                BindBoatDetails();
            }
        }
    }
    //Bind Boat details into DetailsView
    public void BindBoatDetails()
    {
        ViewBoatDetails.BoatQuery = @"SELECT        HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, LOCATION.Loc_id, LOCATION.Loc_name, BOAT_TYPE.Btype_id, BOAT_TYPE.Typename, 
                         HOUSE_BOAT_REG.Tot_rooms, HOUSE_BOAT_REG.Descp, HOUSE_BOAT_REG.Cont_name, HOUSE_BOAT_REG.Address_Line1, 
                         HOUSE_BOAT_REG.Address_Line2, HOUSE_BOAT_REG.Cont_no, HOUSE_BOAT_REG.Boat_image, HOUSE_BOAT_REG.Rate_per_day
FROM            HOUSE_BOAT_REG INNER JOIN
                         BOAT_TYPE ON HOUSE_BOAT_REG.Btype_id = BOAT_TYPE.Btype_id INNER JOIN
                         LOCATION ON HOUSE_BOAT_REG.Loc_id = LOCATION.Loc_id";
        ViewBoatDetails.BoatGetDataset(ViewBoatDetails.BoatQuery);
        dvBoatDeatils.DataSource = ViewBoatDetails.BoatDs;
        dvBoatDeatils.DataBind();
    }
    protected void dvBoatDeatils_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        dvBoatDeatils.PageIndex = e.NewPageIndex;
        BindBoatDetails();
    }
}