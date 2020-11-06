using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_Update_Profile : System.Web.UI.Page
{
    BoatBookingClass UpdateCust = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            UpdateCust.BoatConnection();
            if (!IsPostBack)
            {
                BindCustDetails();
            }
        }
    }
    //Bind DetilsView for updating the profile
    public void BindCustDetails()
    {
        UpdateCust.BoatQuery = @"SELECT        CUSTOMER_REG.Cust_id, CUSTOMER_REG.Name, CUSTOMER_REG.Address_Line1, CUSTOMER_REG.Address_Line2, CUSTOMER_REG.Age, 
                         CUSTOMER_REG.Gender, DISTRICT.Dist_id, DISTRICT.Dist,LOCATION.Loc_id, LOCATION.Loc_name, CUSTOMER_REG.Email, CUSTOMER_REG.Phone_no, 
                         CUSTOMER_REG.Reg_date, CUSTOMER_REG.Status
FROM            CUSTOMER_REG INNER JOIN
                         DISTRICT ON CUSTOMER_REG.Dist_id = DISTRICT.Dist_id INNER JOIN
                         LOCATION ON CUSTOMER_REG.Loc_id = LOCATION.Loc_id where Cust_id=" + Session["Cust_id"] + "";
        UpdateCust.BoatGetDataset(UpdateCust.BoatQuery);
        dvCustomerProfile.DataSource = UpdateCust.BoatDs;
        dvCustomerProfile.DataBind();
    }
    protected void dvCustomerProfile_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        dvCustomerProfile.PageIndex = e.NewPageIndex;
        BindCustDetails();
    }
    //Update table CUSTOMER_REG.
    protected void dvCustomerProfile_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int Custid = Convert.ToInt32(dvCustomerProfile.DataKey.Value.ToString());
        TextBox txtname = (TextBox)dvCustomerProfile.FindControl("Name");
        TextBox txtAdd1 = (TextBox)dvCustomerProfile.FindControl("Address_Line1");
        TextBox txtAdd2 = (TextBox)dvCustomerProfile.FindControl("Address_Line2");
        TextBox txtAge = (TextBox)dvCustomerProfile.FindControl("Age");
        RadioButtonList rblGender = (RadioButtonList)dvCustomerProfile.FindControl("Gender");
        DropDownList ddlDist = (DropDownList)dvCustomerProfile.FindControl("Dist_id");
        DropDownList ddlLoc = (DropDownList)dvCustomerProfile.FindControl("Loc_id");
        TextBox txtEmail = (TextBox)dvCustomerProfile.FindControl("Email");
        TextBox txtMob = (TextBox)dvCustomerProfile.FindControl("Phone_no");
        UpdateCust.BoatQuery = "update CUSTOMER_REG set Name='" + txtname.Text + "',Address_Line1='" + txtAdd1.Text + "',Address_Line2='" + txtAdd2.Text + "',Age=" + txtAge.Text + ",Gender='" + rblGender.SelectedItem.Text + "',Dist_id=" + ddlDist.SelectedValue + ",Loc_id=" + ddlLoc.SelectedValue + ",Email='" + txtEmail.Text + "',Phone_no=" + txtMob.Text + " where Cust_id=" + Custid + "";
        UpdateCust.BoatWriteData(UpdateCust.BoatQuery);
        dvCustomerProfile.ChangeMode(DetailsViewMode.ReadOnly);
        BindCustDetails();
        Response.Write("<script>alert('Successfully updated!!!')</script>");
    }
    protected void dvCustomerProfile_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvCustomerProfile.ChangeMode(e.NewMode);
        BindCustDetails();
    }
}