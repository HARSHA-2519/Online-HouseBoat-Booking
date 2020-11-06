using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_CustomerMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (Session["Customer"] != null)
       // {
       //    lbMsg.Text = Session["Customer"].ToString();
       //// Response.Write("<script>alert(' <b><font color=Brown>" + "WELLCOME:: " + "</font>" + "<b><font color=red>" + Session["Customer"] + "</font>'</script>");
       // //  lbMsg.Text = " <b><font color=Brown>" + "WELLCOME:: " + "</font>" + "<b><font color=red>" + Session["CustName"] + "</font>";
       //  }
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoServerCaching();
        HttpContext.Current.Response.Cache.SetNoStore();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session["CustName"] = null;
        Session["Cust_id"] = null;
        Response.Redirect("~/LOGIN/Login.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/PackageBookingF.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/Search_Boat_Details.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/House_Boat_Booking.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/Customer_Home_Page.aspx.aspx");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/Update_Profile.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/Send_Feedback.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/View_Boat_Details.aspx");
    }
    protected void LinkButton13_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/View_Gallery.aspx");
    }
    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CUSTOMER/View_Packages.aspx");
    }
}
