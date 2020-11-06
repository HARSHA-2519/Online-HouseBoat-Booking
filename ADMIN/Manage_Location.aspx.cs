using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_Manage_Location : System.Web.UI.Page
{
    BoatBookingClass Loc = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Loc.BoatConnection();
            if (!IsPostBack)
            {
                BindLocation();
                BindDistrict();
            }
        }
    }
    public void BindDistrict()
    {
        //Bind Dropdown list value of District
        Loc.BoatQuery = "Select * from District";
        Loc.BoatReadData(Loc.BoatQuery);
        ddlDist.DataSource = Loc.BoatDr;
        ddlDist.DataTextField = "Dist";
        ddlDist.DataValueField = "Dist_id";
        ddlDist.DataBind();
        ddlDist.Items.Insert(0, "---Select District---");
        Loc.BoatDr.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            Loc.BoatQuery = "Select * from Location where Loc_name='" + txtLocation.Text + "' and Dist_id=" + ddlDist.SelectedValue + "";
            Loc.BoatReadData(Loc.BoatQuery);
            if (Loc.BoatDr.Read())
            {
                Loc.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert Location into the table
                Loc.BoatDr.Close();
                Loc.BoatQuery = "Insert into Location values('" + txtLocation.Text + "'," + ddlDist.SelectedValue + ")";
                Loc.BoatWriteData(Loc.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            Clear();
            BindLocation();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Loc.BoatCon.Close();
            Loc.BoatCon.Dispose();
            Loc.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtLocation.Text = "";
        ddlDist.SelectedIndex = -1;
    }
    //Bind tables into GridView for Update and delete data
    public void BindLocation()
    {
        Loc.BoatQuery = string.Format(@"SELECT        DISTRICT.Dist_id, DISTRICT.Dist, LOCATION.Loc_id, LOCATION.Loc_name
FROM            DISTRICT INNER JOIN
                         LOCATION ON DISTRICT.Dist_id = LOCATION.Dist_id");
        Loc.BoatGetDataset(Loc.BoatQuery);
        gvLocation.DataSource = Loc.BoatDs;
        gvLocation.DataBind();
    }
    protected void gvLocation_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //Update the each value of LOCATION.
            int Lid = Convert.ToInt32(gvLocation.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtloc = (TextBox)gvLocation.Rows[e.RowIndex].FindControl("txtLocation");
            DropDownList ddlDistr = (DropDownList)gvLocation.Rows[e.RowIndex].FindControl("ddlDistrict");
            Loc.BoatQuery = "Update LOCATION set Loc_name='" + txtloc.Text + "',Dist_id=" + ddlDistr.SelectedValue + " where Loc_id=" + Lid + "";
            Loc.BoatWriteData(Loc.BoatQuery);
            gvLocation.EditIndex = -1;
            BindDistrict();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Loc.BoatCon.Close();
            Loc.BoatCon.Dispose();
            Loc.Boatcmd.Dispose();
        }
    }
    protected void gvLocation_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLocation.EditIndex = e.NewEditIndex;
        BindDistrict();
    }
    protected void gvLocation_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //Delete Each row from the database.
            int Lid = Convert.ToInt32(gvLocation.DataKeys[e.RowIndex].Value.ToString());
            Loc.BoatQuery = "Delete from LOCATION where Loc_id=" + Lid + "";
            Loc.BoatWriteData(Loc.BoatQuery);
            BindDistrict();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Loc.BoatCon.Close();
            Loc.BoatCon.Dispose();
            Loc.Boatcmd.Dispose();
        }
    }
    protected void gvLocation_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvLocation.EditIndex = -1;
        BindDistrict();
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ADMIN/Manage_Loction.aspx");
    }
}