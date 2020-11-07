using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LOGIN_Customer_Registration : System.Web.UI.Page
{
    BoatBookingClass Cust = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Cust.BoatConnection();
        if(!IsPostBack)
        {
            BindState();
        }
    }
    public void BindDistrict()
    {
        //Bind Dropdown list value of Course
        Cust.BoatQuery = "Select * from District where Stateid=" + ddlState.SelectedValue + "";
        Cust.BoatReadData(Cust.BoatQuery);
        ddlDistrict.DataSource = Cust.BoatDr;
        ddlDistrict.DataTextField = "Dist";
        ddlDistrict.DataValueField = "Dist_id";
        ddlDistrict.DataBind();
        ddlDistrict.Items.Insert(0, "---Select District---");
        Cust.BoatDr.Close();
    }
    public void BindState()
    {
        //Bind Dropdown list value of Course
        Cust.BoatQuery = "Select * from State";
        Cust.BoatReadData(Cust.BoatQuery);
        ddlState.DataSource = Cust.BoatDr;
        ddlState.DataTextField = "State";
        ddlState.DataValueField = "Stateid";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "---Select State---");
        Cust.BoatDr.Close();
    }
    public void BindLocation()
    {
        //Bind Dropdown list value of Course
        Cust.BoatQuery = "Select * from Location where Dist_id=" + ddlDistrict.SelectedValue + "";
        Cust.BoatReadData(Cust.BoatQuery);
        ddlLocation.DataSource = Cust.BoatDr;
        ddlLocation.DataTextField = "Loc_name";
        ddlLocation.DataValueField = "Dist_id";
        ddlLocation.DataBind();
        ddlLocation.Items.Insert(0, "---Select Location---");
        Cust.BoatDr.Close();
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        //Get the data from database and checking there Exists
        Cust.BoatQuery = "Select * from Customer_Reg where Name='" + txtName.Text + "' and Phone_no='" + txtPhoneNumber.Text + "' and Email='" + txtEmail.Text + "'";
        Cust.BoatReadData(Cust.BoatQuery);
        if (Cust.BoatDr.Read())
        {
            Cust.BoatDr.Close();
            Response.Write("<script>alert('Data Already Exit')</script>");
        }
        else
        {
            Cust.BoatDr.Close();
            //Insert username and password into Login table
            Cust.BoatQuery = "insert into LOGIN values('" + txtUsername.Text + "','" + txtPassword.Text + "',3)";
            Cust.BoatWriteData(Cust.BoatQuery);
            Cust.BoatQuery = "select @@identity";
            Cust.BoatScalar(Cust.BoatQuery);
            //Insert Status into the table
            Cust.BoatQuery = "Insert into Customer_Reg values('" + txtName.Text + "','" + txtAddress1.Text + "','" + txtAddress2.Text + "'," + txtAge.Text + ",'"+rblGender.SelectedValue+"',"+ddlDistrict.SelectedValue+"," + ddlLocation.SelectedValue + ",'" + txtEmail.Text + "'," + txtPhoneNumber.Text + ",'"+System.DateTime.Now.ToString("MM/dd/yy")+ "'," + Cust.Boatsid + ",'NEW')";
            Cust.BoatWriteData(Cust.BoatQuery);
            Response.Write("<script>alert('Data Submitted')</script>");
            //("you are redirected to home page")
            Server.Transfer("Login.aspx");
        }
        Clear();
    }
    //Bind District when clicking the dropdown of State
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDistrict();
    }
    //Bind Location when clicking the dropdown of District
    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindLocation();
    }
    //Clear all Controls
    public void Clear()
    {
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtAge.Text = "";
        txtBoatImage.Text = "";
        txtConfirmPassword.Text = "";
        txtEmail.Text = "";
        txtName.Text = "";
        txtPassword.Text = "";
        txtPhoneNumber.Text = "";
        txtUsername.Text = "";
        ddlDistrict.SelectedIndex = -1;
        ddlLocation.SelectedIndex = -1;
        ddlState.SelectedIndex = -1;
        rblGender.SelectedIndex = -1;
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LOGIN/Customer_Registration.aspx");
    }
}