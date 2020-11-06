using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_Send_Feedback : System.Web.UI.Page
{
    BoatBookingClass Feedback = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Feedback.BoatConnection();
        }
        if(!IsPostBack)
        {
            BindFeedback();
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            Feedback.BoatQuery = "Select * from FEEDBACK where Feedback='" + txtFeedback.Text + "'";
            Feedback.BoatReadData(Feedback.BoatQuery);
            if (Feedback.BoatDr.Read())
            {
                Feedback.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert FEEDBACK into the table
                Feedback.BoatDr.Close();
                Feedback.BoatQuery = "Insert into FEEDBACK values('" + Session["Cust_id"] + "','" + txtFeedback.Text + "','" + System.DateTime.Now.ToString("MM/dd/yyyy") + "')";
                Feedback.BoatWriteData(Feedback.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            BindFeedback();
            Clear();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Feedback.BoatCon.Close();
            Feedback.BoatCon.Dispose();
            Feedback.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtFeedback.Text = "";
        txtFeedback.Focus();
    }
    //Bind tables into GridView for Update and delete data
    public void BindFeedback()
    {
        Feedback.BoatQuery = @"SELECT        FEEDBACK.Feedb_id, FEEDBACK.Feedback, FEEDBACK.Date, CUSTOMER_REG.Cust_id, CUSTOMER_REG.Name
FROM            FEEDBACK INNER JOIN
                         CUSTOMER_REG ON FEEDBACK.Cust_id = CUSTOMER_REG.Cust_id where FEEDBACK.Cust_id=" + Session["Cust_id"] + "";
        Feedback.BoatGetDataset(Feedback.BoatQuery);
        gvFeedback.DataSource = Feedback.BoatDs;
        gvFeedback.DataBind();
    }

    protected void gvFeedback_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int Fid = Convert.ToInt32(gvFeedback.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtFac = (TextBox)gvFeedback.Rows[e.RowIndex].FindControl("txtFeedback");
            //Update the each value of Feedback.
            Feedback.BoatQuery = "Update Feedback set Feedback='" + txtFac.Text + "',Date='"+System.DateTime.Now.ToString("MM/dd/yy")+"' where Feedb_id=" + Fid + "";
            Feedback.BoatWriteData(Feedback.BoatQuery);
            gvFeedback.EditIndex = -1;
            BindFeedback();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Feedback.BoatCon.Close();
            Feedback.BoatCon.Dispose();
            Feedback.Boatcmd.Dispose();
        }
    }
    protected void gvFeedback_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvFeedback.EditIndex = e.NewEditIndex;
        BindFeedback();
    }
    protected void gvFeedback_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //Delete Each row from the database.
            int Fid = Convert.ToInt32(gvFeedback.DataKeys[e.RowIndex].Value.ToString());
            Feedback.BoatQuery = "Delete from Feedback where Feedb_id=" + Fid + "";
            Feedback.BoatWriteData(Feedback.BoatQuery);
            BindFeedback();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Feedback.BoatCon.Close();
            Feedback.BoatCon.Dispose();
            Feedback.Boatcmd.Dispose();
        }
    }
    protected void gvFeedback_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvFeedback.EditIndex = -1;
        BindFeedback();
    }
}