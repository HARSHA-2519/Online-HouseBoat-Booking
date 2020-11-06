using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_Manage_State : System.Web.UI.Page
{
    BoatBookingClass State = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            State.BoatConnection();
            if (!IsPostBack)
            {
                BindState();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            State.BoatQuery = "Select * from State where State='" + txtState.Text + "'";
            State.BoatReadData(State.BoatQuery);
            if (State.BoatDr.Read())
            {
                State.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert State into the table
                State.BoatDr.Close();
                State.BoatQuery = "Insert into State values('" + txtState.Text + "')";
                State.BoatWriteData(State.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            Clear();
            BindState();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            State.BoatCon.Close();
            State.BoatCon.Dispose();
            State.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtState.Text = "";
    }
    //Bind State into GridView for Update and delete data
    public void BindState()
    {
        State.BoatQuery = "Select * from State";
        State.BoatGetDataset(State.BoatQuery);
        gvState.DataSource = State.BoatDs;
        gvState.DataBind();
    }

    protected void gvState_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //Update the each value of State.
            int tid = Convert.ToInt32(gvState.DataKeys[e.RowIndex].Value.ToString());
            TextBox txttype = (TextBox)gvState.Rows[e.RowIndex].FindControl("txtState");
            State.BoatQuery = "Update State set State='" + txttype.Text + "' where Stateid=" + tid + "";
            State.BoatWriteData(State.BoatQuery);
            gvState.EditIndex = -1;
            BindState();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            State.BoatCon.Close();
            State.BoatCon.Dispose();
            State.Boatcmd.Dispose();
        }
    }
    protected void gvState_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvState.EditIndex = e.NewEditIndex;
        BindState();
    }
    protected void gvState_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //Delete Each row from the database.
            int tid = Convert.ToInt32(gvState.DataKeys[e.RowIndex].Value.ToString());
            State.BoatQuery = "Delete from State where Stateid=" + tid + "";
            State.BoatWriteData(State.BoatQuery);
            BindState();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            State.BoatCon.Close();
            State.BoatCon.Dispose();
            State.Boatcmd.Dispose();
        }
    }
    protected void gvState_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvState.EditIndex = -1;
        BindState();
    }
    //Reset the Page and Clear all Controls.
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ADMIN/Manage_State.aspx");
    }
}