using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class HOUSEBOATMANAGEMENT_HouseBoatMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoServerCaching();
        HttpContext.Current.Response.Cache.SetNoStore();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/HouseBoat_Admin_Home_Page.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/Create_Packages.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/Manage_Staff.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/Create_Gallery.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session["agencyid"] = null;
        Session["agencyname"] = null;
        Session["ag_hold_name"] = null;
        Response.Redirect("~/LOGIN/Login.aspx");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/View_Cruise.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/View_Enquiry.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/View_Feedback.aspx");
    }
    protected void LinkButton13_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/Manage_Staff.aspx");
    }
}
