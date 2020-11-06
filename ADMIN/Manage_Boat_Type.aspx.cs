using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class ADMIN_Manage_Boat_Type : System.Web.UI.Page
{
    BoatBookingClass BoatT = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            BoatT.BoatConnection();
            if (!IsPostBack)
            {
                BindBoatType();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            BoatT.BoatQuery = "Select * from Boat_Type where Typename='" + txtBoatType.Text + "'";
            BoatT.BoatReadData(BoatT.BoatQuery);
            if (BoatT.BoatDr.Read())
            {
                BoatT.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert Boat_Type into the table
                BoatT.BoatDr.Close();
                BoatT.BoatQuery = "Insert into Boat_Type values('" + txtBoatType.Text + "')";
                BoatT.BoatWriteData(BoatT.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            Clear();
            BindBoatType();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            BoatT.BoatCon.Close();
            BoatT.BoatCon.Dispose();
            BoatT.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtBoatType.Text = "";
    }
    //Bind Boat Type deatils into GridView for Update data
    public void BindBoatType()
    {
        BoatT.BoatQuery = "Select * from Boat_Type";
        BoatT.BoatGetDataset(BoatT.BoatQuery);
        gvBoatType.DataSource = BoatT.BoatDs;
        gvBoatType.DataBind();
    }
    protected void gvBoatType_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //Update the each value of BoatType.
            int Bid = Convert.ToInt32(gvBoatType.DataKeys[e.RowIndex].Value.ToString());
            TextBox txttype = (TextBox)gvBoatType.Rows[e.RowIndex].FindControl("txtBoatType");
            BoatT.BoatQuery = "Update BoatT set Typename='" + txttype.Text + "' where Btype_id=" + Bid + "";
            BoatT.BoatWriteData(BoatT.BoatQuery);
            gvBoatType.EditIndex = -1;
            BindBoatType();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            BoatT.BoatCon.Close();
            BoatT.BoatCon.Dispose();
            BoatT.Boatcmd.Dispose();
        }
    }
    protected void gvBoatType_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvBoatType.EditIndex = e.NewEditIndex;
        BindBoatType();
    }

    protected void gvBoatType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //Delete Each row from the database.
            int tid = Convert.ToInt32(gvBoatType.DataKeys[e.RowIndex].Value.ToString());
            BoatT.BoatQuery = "Delete from BoatT where Btype_id=" + tid + "";
            BoatT.BoatWriteData(BoatT.BoatQuery);
            BindBoatType();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            BoatT.BoatCon.Close();
            BoatT.BoatCon.Dispose();
            BoatT.Boatcmd.Dispose();
        }
    }
    protected void gvBoatType_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvBoatType.EditIndex = -1;
        BindBoatType();
    }
     //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ADMIN/Manage_Boat_Type.aspx");
    }
}