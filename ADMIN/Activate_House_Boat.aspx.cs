using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_Activate_House_Boat : System.Web.UI.Page
{
    public int id;
    BoatBookingClass HouseB = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            HouseB.BoatConnection();
            if (!IsPostBack)
            {
                BindHouseBoat(id);
            }
        }
    }
    public void BindHouseBoat(int id)
    {
        //Bind some details of HouseBoat Registration into GridView
        HouseB.BoatQuery = @"SELECT        HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, HOUSE_BOAT_REG.Status, HB_ADMIN.Admin_id, HB_ADMIN.Name
FROM            HOUSE_BOAT_REG INNER JOIN
                         HB_ADMIN ON HOUSE_BOAT_REG.Admin_id = HB_ADMIN.Admin_id where HOUSE_BOAT_REG.Status='New'";
        HouseB.BoatGetDataset(HouseB.BoatQuery);
        gvHouseBoat.DataSource = HouseB.BoatDs;
        gvHouseBoat.DataBind();
    }
    public void BindHouseBoatDetails(int id)
    {
        //Bind full details of HouseBoat Registration into DetailsView
        HouseB.BoatQuery = @" SELECT        HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, LOCATION.Loc_id, LOCATION.Loc_name, BOAT_TYPE.Btype_id, BOAT_TYPE.Typename, HOUSE_BOAT_REG.Tot_rooms, HOUSE_BOAT_REG.Descp, 
                         HOUSE_BOAT_REG.Cont_name, HOUSE_BOAT_REG.Address_Line1, HOUSE_BOAT_REG.Address_Line2, HOUSE_BOAT_REG.Cont_no, HOUSE_BOAT_REG.Boat_image, HOUSE_BOAT_REG.Rate_per_day, 
                         HOUSE_BOAT_REG.Status, HB_ADMIN.Admin_id, HB_ADMIN.Name
FROM            HOUSE_BOAT_REG INNER JOIN
                         BOAT_TYPE ON HOUSE_BOAT_REG.Btype_id = BOAT_TYPE.Btype_id INNER JOIN
                         LOCATION ON HOUSE_BOAT_REG.Loc_id = LOCATION.Loc_id INNER JOIN
                         HB_ADMIN ON HOUSE_BOAT_REG.Admin_id = HB_ADMIN.Admin_id where HOUSE_BOAT_REG.Boat_id=" + id + "";
        HouseB.BoatGetDataset(HouseB.BoatQuery);
        dvHouseBoat.DataSource = HouseB.BoatDs;
        dvHouseBoat.DataBind();
    }
    protected void gvHouseBoat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            int id = Convert.ToInt32(gvHouseBoat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value);
            BindHouseBoatDetails(id);
        }
    }
    protected void dvHouseBoat_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Active")
        {
            int id = Convert.ToInt32(dvHouseBoat.DataKey.Value.ToString());
            //for updating the HOUSE_BOAT_REG details
            HouseB.BoatQuery = "update HOUSE_BOAT_REG set Status='Active' where HOUSE_BOAT_REG.Boat_id=" + id.ToString() + "";
            HouseB.BoatWriteData(HouseB.BoatQuery);
            Response.Write("<script>alert('Activated')</script>");
            BindHouseBoatDetails(id);
        }
    }
}