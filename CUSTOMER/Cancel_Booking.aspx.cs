using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_Cancel_Booking : System.Web.UI.Page
{
    public string id;
    
    BoatBookingClass CancelBo = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            CancelBo.BoatConnection();
            if (!IsPostBack)
            {
                BindHouseBoat(id);
            }
        }
    }
    //Bind GridView of Booking
    public void BindHouseBoat(string id)
    {
        CancelBo.BoatQuery = @"SELECT        BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, CUSTOMER_REG.Cust_id,CUSTOMER_REG.Name, BOAT_BOOKING.Book_date, BOAT_BOOKING.Total_amt, BOAT_BOOKING.Status
FROM            BOAT_BOOKING INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id where BOAT_BOOKING.Status='New Booking' and CUSTOMER_REG.Cust_id=" + Session["Cust_id"] + "";
        CancelBo.BoatGetDataset(CancelBo.BoatQuery);
        gvCancelBook.DataSource = CancelBo.BoatDs;
        gvCancelBook.DataBind();
    }
    //Bind DetailsView of Booking
    public void BindHouseBoatDetails()
    {
        CancelBo.BoatQuery = @" SELECT        BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, BOAT_BOOKING.Pack_or_Not, CUSTOMER_REG.Name, BOAT_BOOKING.Tot_memb, BOAT_BOOKING.Tot_adults, BOAT_BOOKING.Tot_child, 
                         BOAT_BOOKING.Adv_amt, BOAT_BOOKING.Book_date, BOAT_BOOKING.Total_amt,BOAT_BOOKING.Admin_id, BOAT_BOOKING.Status
FROM            BOAT_BOOKING INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id where BOAT_BOOKING.Book_id='" + Application["BookId"] + "' and CUSTOMER_REG.Cust_id=" + Session["Cust_id"] + "";
        CancelBo.BoatGetDataset(CancelBo.BoatQuery);
        dvCancelBook.DataSource = CancelBo.BoatDs;
        dvCancelBook.DataBind();
    }
    protected void gvCancelBook_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            int ri =Convert.ToInt32( e.CommandArgument);
            string bid = gvCancelBook.Rows[ri].Cells[0].Text;
            Application["BookId"] = bid;
            BindHouseBoatDetails();
        }
    }
    protected void dvCancelBook_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {

            string bid = dvCancelBook.Rows[0].Cells[1].Text;
            Application["BookId"] = bid;
            //for updating the BOAT_BOOKING details
            CancelBo.BoatQuery = "update BOAT_BOOKING set Status='Cancel' where BOAT_BOOKING.Book_id='" + Application["BookId"] + "'";
            CancelBo.BoatWriteData(CancelBo.BoatQuery);
            Response.Write("<script>alert('Cancelled')</script>");
            BindHouseBoatDetails();
        }
    }
    protected void dvCancelBook_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }
}