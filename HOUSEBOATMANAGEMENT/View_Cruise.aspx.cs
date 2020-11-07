using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HOUSEBOATMANAGEMENT_View_Cruise : System.Web.UI.Page
{
    BoatBookingClass ViewCust = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["HOUSEBOATADMIN"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            ViewCust.BoatConnection();
            if (!IsPostBack)
            {
                BindCustDetails();
            }
        }
    }
    //Bind the Table Customer
    public void BindCustDetails()
    {
        ViewCust.BoatQuery = @"SELECT        CUSTOMER_REG.Cust_id, CUSTOMER_REG.Name, CUSTOMER_REG.Address_Line1, CUSTOMER_REG.Address_Line2, CUSTOMER_REG.Age, 
                         CUSTOMER_REG.Gender, DISTRICT.Dist_id, DISTRICT.Dist,LOCATION.Loc_id, LOCATION.Loc_name, CUSTOMER_REG.Email, CUSTOMER_REG.Phone_no, 
                         CUSTOMER_REG.Reg_date, CUSTOMER_REG.Status
FROM            CUSTOMER_REG INNER JOIN
                         DISTRICT ON CUSTOMER_REG.Dist_id = DISTRICT.Dist_id INNER JOIN
                         LOCATION ON CUSTOMER_REG.Loc_id = LOCATION.Loc_id ";
        ViewCust.BoatGetDataset(ViewCust.BoatQuery);
        dvCustomerProfile.DataSource = ViewCust.BoatDs;
        dvCustomerProfile.DataBind();
    }
    protected void dvCustomerProfile_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        dvCustomerProfile.PageIndex = e.NewPageIndex;
        BindCustDetails();
    }
}