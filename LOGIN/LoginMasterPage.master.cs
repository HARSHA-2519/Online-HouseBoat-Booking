using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class LOGIN_LoginMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LOGIN/Login_Home_Page.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LOGIN/SignUpForm.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LOGIN/Send_Enquiry.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session["agencyid"] = null;
        Session["agencyname"] = null;
        Session["ag_hold_name"] = null;
        Response.Redirect("~/LOGIN/Login.aspx");
    }
}
