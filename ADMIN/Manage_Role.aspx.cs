using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_Manage_Role : System.Web.UI.Page
{
    BoatBookingClass Role = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Role.BoatConnection();
            if (!IsPostBack)
            {
                BindRole();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            Role.BoatQuery = "Select * from Role where Role='" + txtRole.Text + "'";
            Role.BoatReadData(Role.BoatQuery);
            if (Role.BoatDr.Read())
            {
                Role.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert Role into the table
                Role.BoatDr.Close();
                Role.BoatQuery = "Insert into Role values('" + txtRole.Text + "')";
                Role.BoatWriteData(Role.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            Clear();
            BindRole();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Role.BoatCon.Close();
            Role.BoatCon.Dispose();
            Role.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtRole.Text = "";
    }
    //Bind Role into GridView for Update and Delete data
    public void BindRole()
    {
        Role.BoatQuery = "Select * from Role";
        Role.BoatGetDataset(Role.BoatQuery);
        gvRole.DataSource = Role.BoatDs;
        gvRole.DataBind();
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ADMIN/Manage_Role.aspx");
    }

    protected void gvRole_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //Update the each value of Role.
            int tid = Convert.ToInt32(gvRole.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtRole = (TextBox)gvRole.Rows[e.RowIndex].FindControl("txtRole");
            Role.BoatQuery = "Update Role set Role='" + txtRole.Text + "' where Roleid=" + tid + "";
            Role.BoatWriteData(Role.BoatQuery);
            gvRole.EditIndex = -1;
            BindRole();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Role.BoatCon.Close();
            Role.BoatCon.Dispose();
            Role.Boatcmd.Dispose();
        }
    }
    protected void gvRole_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvRole.EditIndex = e.NewEditIndex;
        BindRole();
    }

    protected void gvRole_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //Delete Each row from the database.
            int tid = Convert.ToInt32(gvRole.DataKeys[e.RowIndex].Value.ToString());
            Role.BoatQuery = "Delete from Role where Roleid=" + tid + "";
            Role.BoatWriteData(Role.BoatQuery);
            BindRole();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Role.BoatCon.Close();
            Role.BoatCon.Dispose();
            Role.Boatcmd.Dispose();
        }
    }
    protected void gvRole_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvRole.EditIndex = -1;
        BindRole();
    }
}