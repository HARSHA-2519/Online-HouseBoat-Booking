using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CUSTOMER_PackageDetails : System.Web.UI.Page
{
    BoatBookingClass PackDet = new BoatBookingClass();
    public string Boat;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            PackDet.BoatConnection();
            if (!IsPostBack)
            {

                BindPackage();
            }
        }
        if (Application["PackID"] != null)
        {
            lblBoatName.Text = Application["PackID"].ToString();
        }
    }
    //Bind tables into DetailsView
    public void BindPackage()
    {

        PackDet.BoatQuery = @"SELECT        LOCATION.Loc_id, LOCATION.Loc_name,LOCATION_1.Loc_name, PACKAGES.Pack_name, HOUSE_BOAT_REG.Boatname, HOUSE_BOAT_REG.Boat_id, PACKAGES.Pack_id, 
                         PACKAGES.Tot_days, PACKAGES.Valid_from, PACKAGES.Valid_to_dt, PACKAGES.Food_avail, PACKAGES.Extra_facility, PACKAGES.Image, PACKAGES.Duration, 
                         PACKAGES.Rate
FROM            PACKAGES INNER JOIN
                         HOUSE_BOAT_REG ON PACKAGES.Boat_id = HOUSE_BOAT_REG.Boat_id INNER JOIN
                         LOCATION ON HOUSE_BOAT_REG.Loc_id = LOCATION.Loc_id INNER JOIN Location AS Location_1 ON HOUSE_BOAT_REG.Loc_id = LOCATION_1.Loc_id  where PACKAGES.Pack_id = '" + Session["packid"] + "'";
        PackDet.BoatGetDataset(PackDet.BoatQuery);
        dvPackageDetails.DataSource = PackDet.BoatDs;
        dvPackageDetails.DataBind();
    }
    //Selecting and passing date from Detailsview to Other page
    protected void dvPackageDetails_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "BookNow")
        {
            int pid = Convert.ToInt16(dvPackageDetails.DataKey.Value.ToString());
            Application["pid"] = (dvPackageDetails.Rows[0].Cells[1]).Text;
            Application["pname"] = (dvPackageDetails.Rows[1].Cells[1]).Text;
            Application["bname"] = (dvPackageDetails.Rows[2].Cells[1]).Text;
            Response.Redirect("~/CUSTOMER/House_Boat_Booking_Package.aspx?Pack_id=" + Application["pid"] + " and Pack_name=" + Application["pname"] + " and Boatname=" + Application["bname"] + " and Boat_id="+ Application["Boat_Id"]+"");
        }
    }
}