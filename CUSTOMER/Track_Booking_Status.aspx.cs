using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_Track_Booking_Status : System.Web.UI.Page
{
    public string id;

    BoatBookingClass TrackBook = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            TrackBook.BoatConnection();
            if (!IsPostBack)
            {
                BindHouseBoat(id);
            }
        }
    }
    //Bind GridView of Booking
    public void BindHouseBoat(string id)
    {
        TrackBook.BoatQuery = @"SELECT        BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, CUSTOMER_REG.Cust_id,CUSTOMER_REG.Name, BOAT_BOOKING.Book_date, BOAT_BOOKING.Total_amt, BOAT_BOOKING.Status
FROM            BOAT_BOOKING INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id where BOAT_BOOKING.Status='New Booking' and CUSTOMER_REG.Cust_id=" + Session["Cust_id"] + "";
        TrackBook.BoatGetDataset(TrackBook.BoatQuery);
        gvTrackBook.DataSource = TrackBook.BoatDs;
        gvTrackBook.DataBind();
    }
}