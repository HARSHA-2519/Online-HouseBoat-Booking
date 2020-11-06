using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_Manage_Facility : System.Web.UI.Page
{
    BoatBookingClass Facil = new BoatBookingClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Facil.BoatConnection();
            if (!IsPostBack)
            {
                BindFacility();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            Facil.BoatQuery = "Select * from Facility where Facility='" + txtFacility.Text + "'";
            Facil.BoatReadData(Facil.BoatQuery);
            if (Facil.BoatDr.Read())
            {
                Facil.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert Facility into the table
                Facil.BoatDr.Close();
                Facil.BoatQuery = "Insert into Facility values('" + txtFacility.Text + "')";
                Facil.BoatWriteData(Facil.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            Clear();
            BindFacility();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Facil.BoatCon.Close();
            Facil.BoatCon.Dispose();
            Facil.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtFacility.Text = "";
    }
    //Bind Facility into GridView for Update and delete data
    public void BindFacility()
    {
        Facil.BoatQuery = "Select * from Facility";
        Facil.BoatGetDataset(Facil.BoatQuery);
        gvFacility.DataSource = Facil.BoatDs;
        gvFacility.DataBind();
    }
    protected void gvFacility_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //Update the each value of Facility.
            int Fid = Convert.ToInt32(gvFacility.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtFac = (TextBox)gvFacility.Rows[e.RowIndex].FindControl("txtFacility");
            Facil.BoatQuery = "Update Facility set Facility='" + txtFac.Text + "' where Fac_id=" + Fid + "";
            Facil.BoatWriteData(Facil.BoatQuery);
            gvFacility.EditIndex = -1;
            BindFacility();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Facil.BoatCon.Close();
            Facil.BoatCon.Dispose();
            Facil.Boatcmd.Dispose();
        }
    }
    protected void gvFacility_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvFacility.EditIndex = e.NewEditIndex;
        BindFacility();
    }
    protected void gvFacility_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //Delete Each row from the database.
            int Fid = Convert.ToInt32(gvFacility.DataKeys[e.RowIndex].Value.ToString());
            Facil.BoatQuery = "Delete from Facility where Fac_id=" + Fid + "";
            Facil.BoatWriteData(Facil.BoatQuery);
            BindFacility();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Facil.BoatCon.Close();
            Facil.BoatCon.Dispose();
            Facil.Boatcmd.Dispose();
        }
    }
    protected void gvFacility_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvFacility.EditIndex = -1;
        BindFacility();
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ADMIN/Manage_Facility.aspx");
    }
}