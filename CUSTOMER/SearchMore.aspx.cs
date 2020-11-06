using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CUSTOMER_SearchMore : System.Web.UI.Page
{
    int BoatID = 0;
    BoatBookingClass SearchMore = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            SearchMore.BoatConnection();
            if (!IsPostBack)
            {
                BindBoatDeatils();
            }
        }
    }
    //Bind tabl values for more details
    public void BindBoatDeatils()
    {
        SearchMore.BoatQuery = @"SELECT HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, HOUSE_BOAT_REG.Tot_rooms, HOUSE_BOAT_REG.Descp, HOUSE_BOAT_REG.Cont_name, HOUSE_BOAT_REG.Address_Line1, 
                         HOUSE_BOAT_REG.Address_Line2, HOUSE_BOAT_REG.Cont_no, HOUSE_BOAT_REG.Boat_image, HOUSE_BOAT_REG.Rate_per_day, BOAT_TYPE.Btype_id, BOAT_TYPE.Typename, LOCATION.Loc_id, 
                         LOCATION.Loc_name
FROM            HOUSE_BOAT_REG INNER JOIN
                         BOAT_TYPE ON HOUSE_BOAT_REG.Btype_id = BOAT_TYPE.Btype_id INNER JOIN
                         LOCATION ON HOUSE_BOAT_REG.Loc_id = LOCATION.Loc_id where HOUSE_BOAT_REG.Boat_id="+ Session["boatid"] + "";
        SearchMore.BoatGetDataset(SearchMore.BoatQuery);
        dvBoatName.DataSource = SearchMore.BoatDs;
        dvBoatName.DataBind(); 
    }
    protected void dvBoatName_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Back")
        {
            Session["boatid"] = dvBoatName.DataKey[Convert.ToInt32(e.CommandArgument.ToString())].ToString();
            Response.Redirect("~/CUSTOMER/Search_Boat_Details.aspx");
        }
    }
}