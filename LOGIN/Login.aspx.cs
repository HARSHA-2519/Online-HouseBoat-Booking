using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LOGIN_Login : System.Web.UI.Page
{
    BoatBookingClass Login = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Login.BoatConnection();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //Get the data from database and checking there Exists
        Login.BoatQuery = "select Username from Login where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "' and Role_id=1";
        Login.BoatReadData(Login.BoatQuery);
        if (Login.BoatDr.Read())
        {
            Session["Admin"] = Login.BoatDr[0].ToString();
            Response.Redirect("~/ADMIN/Admin_Home_Page.aspx");
            Login.BoatDr.Close();
        }
        else
        {
            Login.BoatDr.Close();
            Response.Write("<script>alert('Invalid Username or Password')</script>");
        }
        //Selecting HouseBoat Admin details from Login Table.
        Login.BoatQuery = string.Format(@"SELECT      HB_ADMIN.Admin_id, LOGIN.Password, LOGIN.Username,  LOGIN.Role_id, HB_ADMIN.Status,  LOGIN.Login_id,HB_ADMIN.Login_id
FROM            HB_ADMIN INNER JOIN
                         LOGIN ON HB_ADMIN.Login_id = LOGIN.Login_id where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "' and Role_id=2 and Status='Active'");
        Login.BoatReadData(Login.BoatQuery);
        if (Login.BoatDr.Read())
        {
            Session["HOUSEBOATADMIN"] = Login.BoatDr[0].ToString();
            Session["HouseBoatPWD"] = Login.BoatDr[1].ToString();
             Response.Redirect("~/HOUSEBOATMANAGEMENT/HouseBoat_Admin_Home_Page.aspx");
            Login.BoatDr.Close();
        }
        else
        {
            Login.BoatDr.Close();
            Response.Write("<script>alert('Invalid Username or Password')</script>");
        }
        //Select Customer Login details.
        Login.BoatQuery = string.Format(@"SELECT      CUSTOMER_REG.Cust_id,CUSTOMER_REG.Name,   LOGIN.Login_id, LOGIN.Username, LOGIN.Password, LOGIN.Role_id,CUSTOMER_REG.Status, CUSTOMER_REG.Login_id AS Expr1
FROM            LOGIN INNER JOIN
                         CUSTOMER_REG ON LOGIN.Login_id = CUSTOMER_REG.Login_id where LOGIN.Username='" + txtUsername.Text + "' and LOGIN.Password='" + txtPassword.Text + "' and Role_id=3 and Status='Active'");
        Login.BoatReadData(Login.BoatQuery);
        if (Login.BoatDr.Read())
        {
            Session["Cust_id"] = Login.BoatDr[0].ToString();
            Session["CustName"] = Login.BoatDr[1].ToString();
            Response.Redirect("~/CUSTOMER/Customer_Home_Page.aspx");
            Login.BoatDr.Close();
        }
        else
        {
            Login.BoatDr.Close();
            Response.Write("<script>alert('Invalid Username or Password')</script>");
        }
        Clear();
    }
    //Clear all Controls
    public void Clear()
    {
        txtUsername.Text = "";
        txtUsername.Focus();
        txtPassword.Text = "";
    }
    //Reset the Page and Clear all Controls
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LOGIN/Login.aspx");
    }
}