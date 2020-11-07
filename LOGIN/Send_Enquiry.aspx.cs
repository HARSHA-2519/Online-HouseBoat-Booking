using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LOGIN_Send_Enquiry : System.Web.UI.Page
{
    BoatBookingClass Enq = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Enq.BoatConnection();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Get the data from database and checking there Exists
        Enq.BoatQuery = "Select * from Enquiry where Enq_name='" + txtEquName.Text + "' and Email='" + txtEmail.Text + "' and Phone="+txtMobNumber.Text+"";
        Enq.BoatReadData(Enq.BoatQuery);
        if (Enq.BoatDr.Read())
        {
            Enq.BoatDr.Close();
            Response.Write("<script>alert('Data Already Exit')</script>");
        }
        else
        {
            //Insert Enquiry into the table
            Enq.BoatDr.Close();
            Enq.BoatQuery = "Insert into Enquiry values('" + txtEquName.Text + "','" + txtEmail.Text + "',"+txtMobNumber.Text+",'"+txtMsg.Text+"','New')";
            Enq.BoatWriteData(Enq.BoatQuery);
            Response.Write("<script>alert('Data Submitted')</script>");
        }
        Clear();
    }    
    //Clear all Controls
    public void Clear()
    {
        txtEquName.Focus();
        txtEmail.Text = "";
        txtEquName.Text="";
        txtMobNumber.Text = "";
        txtMsg.Text = "";
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LOGIN/Send_Enquiry.aspx");
    }
}