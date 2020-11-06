using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_Activate_Customer : System.Web.UI.Page
{
    public int id;
    BoatBookingClass CustD = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            CustD.BoatConnection();
            if (!IsPostBack)
            {
                BindCust(id);
            }
        }
    }
    public void BindCust(int id)
    {
        //Bind some details of Customer into GridView
        CustD.BoatQuery = @" SELECT CUSTOMER_REG.Cust_id,CUSTOMER_REG.Name, CUSTOMER_REG.Address_Line1, CUSTOMER_REG.Address_Line2, CUSTOMER_REG.Age, CUSTOMER_REG.Gender, DISTRICT.Dist_id, DISTRICT.Dist, LOCATION.Loc_id, 
                                 LOCATION.Loc_name, CUSTOMER_REG.Email, CUSTOMER_REG.Phone_no, CUSTOMER_REG.Reg_date, CUSTOMER_REG.Status
        FROM            CUSTOMER_REG INNER JOIN DISTRICT ON CUSTOMER_REG.Dist_id = DISTRICT.Dist_id INNER JOIN LOCATION ON CUSTOMER_REG.Loc_id = LOCATION.Loc_id where CUSTOMER_REG.Status='New'";
        CustD.BoatGetDataset(CustD.BoatQuery);
        gvCustDetails.DataSource = CustD.BoatDs;
        gvCustDetails.DataBind();
    }
    public void BindCustDetails(int id)
    {
        //Bind full details of Customer into DetailsView
        CustD.BoatQuery = @"SELECT CUSTOMER_REG.Cust_id,CUSTOMER_REG.Name, CUSTOMER_REG.Address_Line1, CUSTOMER_REG.Address_Line2, CUSTOMER_REG.Age, CUSTOMER_REG.Gender, DISTRICT.Dist_id, DISTRICT.Dist, LOCATION.Loc_id, 
                                 LOCATION.Loc_name, CUSTOMER_REG.Email, CUSTOMER_REG.Phone_no, CUSTOMER_REG.Reg_date, CUSTOMER_REG.Status
        FROM            CUSTOMER_REG INNER JOIN DISTRICT ON CUSTOMER_REG.Dist_id = DISTRICT.Dist_id INNER JOIN LOCATION ON CUSTOMER_REG.Loc_id = LOCATION.Loc_id where CUSTOMER_REG.Cust_Id=" + id + "";
        CustD.BoatGetDataset(CustD.BoatQuery);
        dvCustDetails.DataSource = CustD.BoatDs;
        dvCustDetails.DataBind();
    }
    protected void gvCustDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            int id = Convert.ToInt32(gvCustDetails.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value);
            BindCustDetails(id);
        }
    }
    protected void dvCustDetails_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Accept")
        {
            int id = Convert.ToInt32(dvCustDetails.DataKey.Value.ToString());
            //for updating the CUSTOMER_REG details
            CustD.BoatQuery = "update CUSTOMER_REG set Status='Active' where CUSTOMER_REG.Boat_id=" + id.ToString() + "";
            CustD.BoatWriteData(CustD.BoatQuery);
            Response.Write("<script>alert('Activated')</script>");
            BindCustDetails(id);
        }
        if (e.CommandName == "Reject")
        {
            int id = Convert.ToInt32(dvCustDetails.DataKey.Value.ToString());
            //for updating the CUSTOMER_REG details
            CustD.BoatQuery = "update CUSTOMER_REG set Status='Reject' where CUSTOMER_REG.Boat_id=" + id.ToString() + "";
            CustD.BoatWriteData(CustD.BoatQuery);
            Response.Write("<script>alert('Activated')</script>");
            BindCustDetails(id);
        }
    }
}