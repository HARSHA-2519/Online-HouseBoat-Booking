using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HOUSEBOATMANAGEMENT_Manage_Staff : System.Web.UI.Page
{
    BoatBookingClass Staff = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["HOUSEBOATADMIN"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            Staff.BoatConnection();
            if (!IsPostBack)
            {
                BindState();
                BindBoatName();
            }
        }
    }
    public void BindDistrict()
    {
        //Bind Dropdown list value of District
        Staff.BoatQuery = "Select * from District where Stateid=" + ddlState.SelectedValue + "";
        Staff.BoatReadData(Staff.BoatQuery);
        ddlDist.DataSource = Staff.BoatDr;
        ddlDist.DataTextField = "Dist";
        ddlDist.DataValueField = "Dist_id";
        ddlDist.DataBind();
        ddlDist.Items.Insert(0, "---Select District---");
        Staff.BoatDr.Close();
    }
    public void BindState()
    {
        //Bind Dropdown list value of State
        Staff.BoatQuery = "Select * from State";
        Staff.BoatReadData(Staff.BoatQuery);
        ddlState.DataSource = Staff.BoatDr;
        ddlState.DataTextField = "State";
        ddlState.DataValueField = "Stateid";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "---Select State---");
        Staff.BoatDr.Close();
    }
    public void BindLocation()
    {
        //Bind Dropdown list value of Location
        Staff.BoatQuery = "Select * from Location where Dist_id=" + ddlDist.SelectedValue + "";
        Staff.BoatReadData(Staff.BoatQuery);
        ddlLocation.DataSource = Staff.BoatDr;
        ddlLocation.DataTextField = "Loc_name";
        ddlLocation.DataValueField = "Dist_id";
        ddlLocation.DataBind();
        ddlLocation.Items.Insert(0, "---Select Location---");
        Staff.BoatDr.Close();
    }
    public void BindBoatName()
    {
        //Bind Dropdown list value of Location
        Staff.BoatQuery = "Select Boat_id,Boatname from House_Boat_Reg where Admin_id='" + Session["HOUSEBOATADMIN"] + "' ";
        Staff.BoatReadData(Staff.BoatQuery);
        ddlBoatName.DataSource = Staff.BoatDr;
        ddlBoatName.DataTextField = "Boatname";
        ddlBoatName.DataValueField = "Boat_id";
        ddlBoatName.DataBind();
        ddlBoatName.Items.Insert(0, "---Select Boat---");
        Staff.BoatDr.Close();
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            Staff.BoatQuery = "Select * from Staff where Boat_id=" + ddlBoatName.SelectedValue + " and Name='" + txtStaffName.Text + "' and Address_Line1='" + txtAddress1.Text + "'";
            Staff.BoatReadData(Staff.BoatQuery);
            if (Staff.BoatDr.Read())
            {
                Staff.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert Staff details into the table
                Staff.BoatDr.Close();
                Staff.BoatQuery = "Insert into Staff values(" + ddlBoatName.SelectedValue + ",'" + txtStaffName.Text + "','" + txtAddress1.Text + "','" + txtAddress2.Text + "'," + txtPhone.Text + ",'" + txtEmail.Text + "'," + txtAge.Text + ",'" + rblGender.SelectedValue + "'," + ddlDist.SelectedValue + "," + ddlLocation.SelectedValue + ")";
                Staff.BoatWriteData(Staff.BoatQuery);
                Response.Write("<script>alert('Data Submitted')</script>");
            }
            Clear();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Staff.BoatCon.Close();
            Staff.BoatCon.Dispose();
            Staff.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        ddlBoatName.SelectedIndex = -1;
        ddlDist.SelectedIndex = -1;
        ddlLocation.SelectedIndex = -1;
        ddlState.SelectedIndex = -1;
        txtAddress1.Text = "";
        txtAddress1.Focus();
        txtAddress2.Text = "";
        txtAge.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtStaffName.Text = "";
        rblGender.SelectedIndex = -1;
    }
    //Get the value of District when click the Dropdown list of State
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDistrict();
    }
    //Get the value of Location when click the Dropdown list of District
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindLocation();
    }
}