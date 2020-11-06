using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_Manage_District : System.Web.UI.Page
{
    BoatBookingClass Dist = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Dist.BoatConnection();
            if (!IsPostBack)
            {
                BindState();
                BindDistrict();
            }
        }
    }
    public void BindState()
    {
        //Bind Dropdown list value of State
        Dist.BoatQuery = "Select * from State";
        Dist.BoatReadData(Dist.BoatQuery);
        ddlSate.DataSource = Dist.BoatDr;
        ddlSate.DataTextField = "State";
        ddlSate.DataValueField = "Stateid";
        ddlSate.DataBind();
        ddlSate.Items.Insert(0, "---Select State---");
        Dist.BoatDr.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            Dist.BoatQuery = "Select * from District where Dist='" + txtDistrict.Text + "' and Stateid=" + ddlSate.SelectedValue + "";
            Dist.BoatReadData(Dist.BoatQuery);
            if (Dist.BoatDr.Read())
            {
                Dist.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert District into the table
                Dist.BoatDr.Close();
                Dist.BoatQuery = "Insert into District values('" + txtDistrict.Text + "'," + ddlSate.SelectedValue + ")";
                Dist.BoatWriteData(Dist.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            Clear();
            BindDistrict();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Dist.BoatCon.Close();
            Dist.BoatCon.Dispose();
            Dist.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtDistrict.Text = "";
        ddlSate.SelectedIndex = -1;
    }
    //Bind tables into GridView for Update and delete data
    public void BindDistrict()
    {
        Dist.BoatQuery = string.Format(@"SELECT        STATE.Stateid, STATE.State, DISTRICT.Dist,DISTRICT.Dist_id
FROM            STATE INNER JOIN
                         DISTRICT ON STATE.Stateid = DISTRICT.Stateid");
        Dist.BoatGetDataset(Dist.BoatQuery);
        gvDist.DataSource = Dist.BoatDs;
        gvDist.DataBind();
    }
    protected void gvDist_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //Update the each value of DISTRICT.
            int did = Convert.ToInt32(gvDist.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtDist = (TextBox)gvDist.Rows[e.RowIndex].FindControl("txtDist");
            DropDownList ddlSta = (DropDownList)gvDist.Rows[e.RowIndex].FindControl("ddlState");
            Dist.BoatQuery = "Update DISTRICT set Dist='" + txtDist.Text + "',Stateid=" + ddlSta.SelectedValue + " where Dist_id=" + did + "";
            Dist.BoatWriteData(Dist.BoatQuery);
            gvDist.EditIndex = -1;
            BindDistrict();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Dist.BoatCon.Close();
            Dist.BoatCon.Dispose();
            Dist.Boatcmd.Dispose();
        }
    }
    protected void gvDist_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvDist.EditIndex = e.NewEditIndex;
        BindDistrict();
    }
    protected void gvDist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //Delete Each row from the database.
            int did = Convert.ToInt32(gvDist.DataKeys[e.RowIndex].Value.ToString());
            Dist.BoatQuery = "Delete from DISTRICT where Dist_id=" + did + "";
            Dist.BoatWriteData(Dist.BoatQuery);
            BindDistrict();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Dist.BoatCon.Close();
            Dist.BoatCon.Dispose();
            Dist.Boatcmd.Dispose();
        }
    }
    protected void gvDist_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvDist.EditIndex = -1;
        BindDistrict();
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ADMIN/Manage_District.aspx");
    }
}