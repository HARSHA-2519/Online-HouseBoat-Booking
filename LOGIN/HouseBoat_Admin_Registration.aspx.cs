using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LOGIN_HouseBoat_Admin_Registration : System.Web.UI.Page
{
    BoatBookingClass HouseAdminReg = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        HouseAdminReg.BoatConnection();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Get the data from database and checking there Exists
        HouseAdminReg.BoatQuery = "Select * from HB_ADMIN where Name='" + txtName.Text + "' and Address_Line1='"+txtAddress1.Text+"' and Email='"+txtEmail.Text+"'";
        HouseAdminReg.BoatReadData(HouseAdminReg.BoatQuery);
        if (HouseAdminReg.BoatDr.Read())
        {
            HouseAdminReg.BoatDr.Close();
            Response.Write("<script>alert('Data Already Exit')</script>");
        }
        else
        {
            HouseAdminReg.BoatDr.Close();
            //Insert username and password into Login table and HouseBoat Admin details into HB_ADMIN table.
            HouseAdminReg.BoatQuery = "insert into LOGIN values('" + txtUsername.Text + "','" + txtPassword.Text + "',2)";
            HouseAdminReg.BoatWriteData(HouseAdminReg.BoatQuery);
            HouseAdminReg.BoatQuery = "select @@identity";
            HouseAdminReg.BoatScalar(HouseAdminReg.BoatQuery);
            HouseAdminReg.BoatQuery = "Insert into HB_ADMIN values('" + txtName.Text + "','"+txtAddress1.Text+"','"+txtAddress2.Text+"','"+txtEmail.Text+"',"+txtMobile.Text+",'"+rblGender.SelectedValue+"','"+System.DateTime.Now.ToString("MM/dd/yy")+"',"+ HouseAdminReg.Boatsid+ ",'NEW')";
            HouseAdminReg.BoatWriteData(HouseAdminReg.BoatQuery);
            Response.Write("<script>alert('Data Submitted')</script>");
            Server.Transfer("Login.aspx");
        }
        Clear();
    }
    //Clear all Controls
    public void Clear()
    {
        txtName.Focus();
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtConfirmPassword.Text = "";
        txtEmail.Text = "";
        txtMobile.Text = "";
        txtName.Text = "";
        txtPassword.Text = "";
        txtUsername.Text = "";
        rblGender.SelectedIndex = -1;
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LOGIN/HouseBoat_Admin_Registration.aspx");
    }
}
