using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_View_Feedback : System.Web.UI.Page
{
    BoatBookingClass Fed = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Fed.BoatConnection();
            if (!IsPostBack)
            {
                BindFeedback();
            }
        }
    }
    //Bind tables into GridView.
    public void BindFeedback()
    {
        Fed.BoatQuery = @"SELECT FEEDBACK.Feedb_id, FEEDBACK.Feedback, FEEDBACK.Date, CUSTOMER_REG.Cust_id, CUSTOMER_REG.Name
FROM            FEEDBACK INNER JOIN
                         CUSTOMER_REG ON FEEDBACK.Cust_id = CUSTOMER_REG.Cust_id";
        Fed.BoatGetDataset(Fed.BoatQuery);
        gvFeedback.DataSource = Fed.BoatDs;
        gvFeedback.DataBind();
    }
}