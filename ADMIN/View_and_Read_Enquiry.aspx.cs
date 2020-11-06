using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_View_and_Read_Enquiry : System.Web.UI.Page
{
    BoatBookingClass Equ = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Equ.BoatConnection();
            if (!IsPostBack)
            {
                BindEquiry();
            }
        }
    }
    //Bind the table ENQUIRY.
    public void BindEquiry()
    {
        Equ.BoatQuery = @"SELECT Enq_id, Enq_name, Email, Phone, Msg, Status FROM ENQUIRY where Status='New'";
        Equ.BoatGetDataset(Equ.BoatQuery);
        gvEnquriy.DataSource = Equ.BoatDs;
        gvEnquriy.DataBind();
    }
    protected void gvEnquriy_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Read")
        {
            int ri = Convert.ToInt32(e.CommandArgument);
            string bid = gvEnquriy.Rows[ri].Cells[0].Text;
            //for updating the ENQUIRY details
            Equ.BoatQuery = "update ENQUIRY set Status='Read' where Enq_id= " + bid + " ";
            Equ.BoatWriteData(Equ.BoatQuery);
            Response.Write("<script>alert('Readed')</script>");
            BindEquiry();
        }
    }
}
