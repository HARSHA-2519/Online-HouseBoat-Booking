using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_View_Gallery : System.Web.UI.Page
{
    BoatBookingClass Gal = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Gal.BoatConnection();
            if (!IsPostBack)
            {
                BindGallery();
            }
        }
    }
    //Bind the table Gallery .
    public void BindGallery()
    {
        Gal.BoatQuery = @"SELECT        GALLERY.Gallary_id, HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, GALLERY.ImagePath, GALLERY.Add_date
FROM            GALLERY INNER JOIN
                         HOUSE_BOAT_REG ON GALLERY.Boat_id = HOUSE_BOAT_REG.Boat_id";
        Gal.BoatGetDataset(Gal.BoatQuery);
        dlGallery.DataSource = Gal.BoatDs;
        dlGallery.DataBind();
    }
}