using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HOUSEBOATMANAGEMENT_Activate_Booking : System.Web.UI.Page
{
    public string id;

    BoatBookingClass ActBook = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(HttpContext.Current.Session["HOUSEBOATADMIN"] ==null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            ActBook.BoatConnection();
            if (!IsPostBack)
            {
                BindBoatBooking(id);
            }
        }
    }
    public void BindBoatBooking(string id)
    {
        //Bind Tables into GridView for Activating Booking
        ActBook.BoatQuery = @"SELECT        BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, CUSTOMER_REG.Cust_id,CUSTOMER_REG.Name, BOAT_BOOKING.Book_date, BOAT_BOOKING.Total_amt, BOAT_BOOKING.Status
FROM            BOAT_BOOKING INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id where BOAT_BOOKING.Status='New Booking'";
        ActBook.BoatGetDataset(ActBook.BoatQuery);
        gvActivateBook.DataSource = ActBook.BoatDs;
        gvActivateBook.DataBind();
    }
    public void BindBoatBookingDetails()
    {
        //Bind Details of Tables into DetailView
        ActBook.BoatQuery = @" SELECT        BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, BOAT_BOOKING.Pack_or_Not, CUSTOMER_REG.Name, BOAT_BOOKING.Tot_memb, BOAT_BOOKING.Tot_adults, BOAT_BOOKING.Tot_child, 
                         BOAT_BOOKING.Adv_amt, BOAT_BOOKING.Book_date, BOAT_BOOKING.Total_amt, BOAT_BOOKING.Status
FROM            BOAT_BOOKING INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id where BOAT_BOOKING.Book_id='" + Application["BookId"] + "'";
        ActBook.BoatGetDataset(ActBook.BoatQuery);
        dvActivateBook.DataSource = ActBook.BoatDs;
        dvActivateBook.DataBind();
    }
    protected void gvCancelBook_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            int ri = Convert.ToInt32(e.CommandArgument);
            string bid = gvActivateBook.Rows[ri].Cells[0].Text;
            Application["BookId"] = bid;
            BindBoatBookingDetails();
        }
    }

    protected void dvCancelBook_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Activate")
        {

            string bid = dvActivateBook.Rows[0].Cells[1].Text;
            Application["BookId"] = bid;
            //for updating the BOAT_BOOKING details
            ActBook.BoatQuery = "update BOAT_BOOKING set Status='Activate' where BOAT_BOOKING.Book_id='" + Application["BookId"] + "'";
            ActBook.BoatWriteData(ActBook.BoatQuery);
            Response.Write("<script>alert('Cancelled')</script>");
            BindBoatBookingDetails();
        }
        if (e.CommandName == "Reject")
        {
            string bid = dvActivateBook.Rows[0].Cells[1].Text;
            Application["BookId"] = bid;
            //for updating the BOAT_BOOKING details
            ActBook.BoatQuery = "update BOAT_BOOKING set Status='Reject' where BOAT_BOOKING.Book_id='" + Application["BookId"] + "'";
            ActBook.BoatWriteData(ActBook.BoatQuery);
            Response.Write("<script>alert('Cancelled')</script>");
            BindBoatBookingDetails();
        }
    }

    protected void dvCancelBook_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }
}