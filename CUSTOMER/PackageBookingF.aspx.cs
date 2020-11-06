using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CUSTOMER_PackageBookingF : System.Web.UI.Page
{
    BoatBookingClass PackBook = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            PackBook.BoatConnection();
            lblDiscover.Visible = false;
            lblHoney.Visible = false;
            lblHouse.Visible = false;
            PackName();
            BoatID();
        }
    }
    //Bind HouseBoatPackage into Datalist.
    public void BindHouseBoatPackBook()
    {
        PackBook.BoatQuery = "SELECT PACKAGES.Pack_name, PACKAGES.Pack_id,Packages.Boat_id, PACKAGES.Tot_days, PACKAGES.Image, PACKAGES.Duration, HOUSE_BOAT_REG.Boatname, PACKAGES.Rate FROM PACKAGES INNER JOIN HOUSE_BOAT_REG ON PACKAGES.Boat_id = HOUSE_BOAT_REG.Boat_id where Pack_name='Houseboat Package' ";
        PackBook.BoatGetDataset(PackBook.BoatQuery);
        dlHouseBoatPackBook.DataSource = PackBook.BoatDs;
        dlHouseBoatPackBook.DataBind();
    }
    //Bind HoneMoonPackage into Datalist.
    public void BindHoneMoonPackBook()
    {
        PackBook.BoatQuery = "SELECT PACKAGES.Pack_name, PACKAGES.Pack_id,Packages.Boat_id, PACKAGES.Tot_days, PACKAGES.Image, PACKAGES.Duration, HOUSE_BOAT_REG.Boatname, PACKAGES.Rate FROM PACKAGES INNER JOIN HOUSE_BOAT_REG ON PACKAGES.Boat_id = HOUSE_BOAT_REG.Boat_id  where Pack_name='Honey Moon Package' ";
        PackBook.BoatGetDataset(PackBook.BoatQuery);
        dlHoneyMoonPackBook.DataSource = PackBook.BoatDs;
        dlHoneyMoonPackBook.DataBind();
    }
    //Bind DiscoverPackage into Datalist.
    public void BindDiscoverPackBook()
    {
        PackBook.BoatQuery = "SELECT PACKAGES.Pack_name, PACKAGES.Pack_id,Packages.Boat_id, PACKAGES.Tot_days, PACKAGES.Image, PACKAGES.Duration, HOUSE_BOAT_REG.Boatname, PACKAGES.Rate FROM PACKAGES INNER JOIN HOUSE_BOAT_REG ON PACKAGES.Boat_id = HOUSE_BOAT_REG.Boat_id where Pack_name='Discover Kerala Package' ";
        PackBook.BoatGetDataset(PackBook.BoatQuery);
        dlDiscoverPackBook.DataSource = PackBook.BoatDs;
        dlDiscoverPackBook.DataBind();
    }
    //Get the values from Packages
    public void PackName()
    {
        PackBook.BoatQuery = "select Pack_id,Pack_name from Packages where Boat_id='" + Application["Boat_Id"] + " '";
        PackBook.BoatReadData(PackBook.BoatQuery);
        if (PackBook.BoatDr.Read())
        {
            Application["PackID"] = PackBook.BoatDr[0].ToString();
            Application["PackName"] = PackBook.BoatDr[1].ToString();
            PackBook.BoatDr.Close();
        }
        PackBook.BoatDr.Close();
    }
    //Get the Boat_id from HOUSE_BOAT_REG
    public void BoatID()
    {
        PackBook.BoatQuery = "select Boat_id from HOUSE_BOAT_REG ";
        PackBook.BoatReadData(PackBook.BoatQuery);
        if (PackBook.BoatDr.Read())
        {
            Application["Boat_Id"] = Convert.ToInt32(PackBook.BoatDr[0].ToString());
            PackBook.BoatDr.Close();
        }
        PackBook.BoatDr.Close();
    }
    //Set controls Visibility
    protected void lbtnHoneyMoon_Click(object sender, EventArgs e)
    {
        dlHouseBoatPackBook.Visible = false;
        dlDiscoverPackBook.Visible = false;
        dlHoneyMoonPackBook.Visible = true;
        lblDiscover.Visible = false;
        lblHoney.Visible = true;
        lblHouse.Visible = false;
        BindHoneMoonPackBook();
    }
    //Set controls Visibility
    protected void lbtnDiscover_Click(object sender, EventArgs e)
    {
        dlHouseBoatPackBook.Visible = false;
        dlDiscoverPackBook.Visible = true;
        dlHoneyMoonPackBook.Visible = false;
        lblDiscover.Visible = true;
        lblHoney.Visible = false;
        lblHouse.Visible = false;
        BindDiscoverPackBook();
    }
    //Set controls Visibility
    protected void lbtnHouseBoat_Click(object sender, EventArgs e)
    {
        lblDiscover.Visible = false;
        lblHoney.Visible = false;
        lblHouse.Visible = true;
        dlHouseBoatPackBook.Visible = true;
        dlDiscoverPackBook.Visible = false;
        dlHoneyMoonPackBook.Visible = false;
        BindHouseBoatPackBook();
    }
    //Getting More Details About HoneyMoonPackage
    protected void dlHoneyMoonPackBook_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "More")
        {
            Session["packid"] = dlHoneyMoonPackBook.DataKeys[e.Item.ItemIndex].ToString();
            Response.Redirect("~/CUSTOMER/PackageDetails.aspx?Pack_id=" + Application["PackID"] + "");
        }
    }
    //Getting More Details About DiscoverPackage
    protected void dlDiscoverPackBook_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "More")
        {
            Session["packid"] = dlDiscoverPackBook.DataKeys[e.Item.ItemIndex].ToString();
            Response.Redirect("~/CUSTOMER/PackageDetails.aspx?Pack_id=" + Application["PackID"] + "");
        }
    }
    //Getting More Details About HouseboatPackage
    protected void dlHouseBoatPackBook_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "More")
        {
            Session["packid"] = dlHouseBoatPackBook.DataKeys[e.Item.ItemIndex].ToString();
            Response.Redirect("~/CUSTOMER/PackageDetails.aspx?Pack_id=" + Application["PackID"] + "");
        }
    }
}