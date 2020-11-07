using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HOUSEBOATMANAGEMENT_House_Boat_Registration : System.Web.UI.Page
{
    BoatBookingClass HouseBoat = new BoatBookingClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["HOUSEBOATADMIN"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            HouseBoat.BoatConnection();
         if (!IsPostBack)
            {
              BindState();
              BindBoatType();
              BindFacility();
              AdminId();
             }
        }
    }
    public void BindDistrict()
    {
        //Bind Dropdown list value of District
        HouseBoat.BoatQuery = "Select * from District where Stateid="+ddlState.SelectedValue+"";
        HouseBoat.BoatReadData(HouseBoat.BoatQuery);
        ddlDistrict.DataSource = HouseBoat.BoatDr;
        ddlDistrict.DataTextField = "Dist";
        ddlDistrict.DataValueField = "Dist_id";
        ddlDistrict.DataBind();
        ddlDistrict.Items.Insert(0, "---Select District---");
        HouseBoat.BoatDr.Close();
    }
    public void BindState()
    {
        //Bind Dropdown list value of State
        HouseBoat.BoatQuery = "Select * from State";
        HouseBoat.BoatReadData(HouseBoat.BoatQuery);
        ddlState.DataSource = HouseBoat.BoatDr;
        ddlState.DataTextField = "State";
        ddlState.DataValueField = "Stateid";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "---Select State---");
        HouseBoat.BoatDr.Close();
    }
    public void BindLocation()
    {
        //Bind Dropdown list value of Location
        HouseBoat.BoatQuery = "Select * from Location where Dist_id="+ddlDistrict.SelectedValue+"";
        HouseBoat.BoatReadData(HouseBoat.BoatQuery);
        ddlLocation.DataSource = HouseBoat.BoatDr;
        ddlLocation.DataTextField = "Loc_name";
        ddlLocation.DataValueField = "Dist_id";
        ddlLocation.DataBind();
        ddlLocation.Items.Insert(0, "---Select Location---");
        HouseBoat.BoatDr.Close();
    }
    public void BindBoatType()
    {
        //Bind Dropdown list value of Boat Type
        HouseBoat.BoatQuery = "Select * from Boat_Type ";
        HouseBoat.BoatReadData(HouseBoat.BoatQuery);
        ddlBoatType.DataSource = HouseBoat.BoatDr;
        ddlBoatType.DataTextField = "Typename";
        ddlBoatType.DataValueField = "Btype_id";
        ddlBoatType.DataBind();
        ddlBoatType.Items.Insert(0, "---Boat Type---");
        HouseBoat.BoatDr.Close();
    }
    public void BindFacility()
    {
        //Bind Dropdown list value of Facility
        HouseBoat.BoatQuery = "Select Fac_id,Facility from Facility";
        HouseBoat.BoatReadData(HouseBoat.BoatQuery);
        cblFacility.DataSource = HouseBoat.BoatDr;
        cblFacility.DataTextField = "Facility";
        cblFacility.DataValueField = "Fac_id";
        cblFacility.DataBind();
        HouseBoat.BoatDr.Close();
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            HouseBoat.BoatQuery = "Select * from House_Boat_Reg where Boatname='" + txtBoatname.Text + "' and Cont_name='" + txtContName.Text + "' and Address_Line1='" + txtAddress1.Text + "'";
            HouseBoat.BoatReadData(HouseBoat.BoatQuery);
            if (HouseBoat.BoatDr.Read())
            {
                HouseBoat.BoatDr.Close();
                Response.Write("<script>alert('Data Already Exit')</script>");
            }
            else
            {
                //Insert House_Boat_Reg into the table
                HouseBoat.BoatDr.Close();
                HouseBoat.BoatQuery = "Insert into House_Boat_Reg values('" + txtBoatname.Text + "'," + ddlLocation.SelectedValue + "," + ddlBoatType.SelectedValue + "," + txtTotalRoom.Text + ",'" + txtDescription.Text + "','" + txtContName.Text + "','" + txtAddress1.Text + "','" + txtAddress2.Text + "'," + txtContNumber.Text + ",'" + txtBoatImage.Text + "'," + txtRatePerDate.Text + ",'Active','" + Application["AdminId"] + "')";
                HouseBoat.BoatWriteData(HouseBoat.BoatQuery);
                HouseBoat.BoatQuery = "Select @@identity";
                HouseBoat.BoatScalar(HouseBoat.BoatQuery);
                foreach (ListItem Faci in cblFacility.Items)
                {
                    if (Faci.Selected)
                    {
                        //Insert Boat_Facility into the table
                        HouseBoat.BoatQuery = "Insert into Boat_Facility values(" + HouseBoat.Boatsid + "," + Faci.Value + ")";
                        HouseBoat.BoatWriteData(HouseBoat.BoatQuery);
                    }
                }
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
            HouseBoat.BoatCon.Close();
            HouseBoat.BoatCon.Dispose();
            HouseBoat.Boatcmd.Dispose();
        }
    }
    public void AdminId()
    {
        //Get the data from table HB_ADMIN
        HouseBoat.BoatQuery = "select Admin_id from HB_ADMIN";
        HouseBoat.BoatReadData(HouseBoat.BoatQuery);
        if (HouseBoat.BoatDr.Read())
        {
            Application["AdminId"] = Convert.ToInt32(HouseBoat.BoatDr[0].ToString());
            HouseBoat.BoatDr.Close();
        }
        HouseBoat.BoatDr.Close();

    }
    //Clear all Controls
    public void Clear()
    {
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtBoatname.Text = "";
        txtContName.Text = "";
        txtContNumber.Text = "";
        txtRatePerDate.Text = "";
        txtTotalRoom.Text = "";
        ddlBoatType.SelectedIndex = -1;
        ddlDistrict.SelectedIndex = -1;
        ddlLocation.SelectedIndex = -1;
        ddlState.SelectedIndex = -1;
    }
    //Get the value of District when click the Dropdown list of States
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDistrict();
    }
    //Get the value of Location when click the Dropdown list of District
    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindLocation();
    }
    //Upload Image Code.
    protected void lbtn_Upload_Click(object sender, EventArgs e)
    {
        imgBoat.Visible = true;
        fupBoatImage.SaveAs(Server.MapPath("~/BoatImages/" + fupBoatImage.FileName));
        imgBoat.ImageUrl = "~/BoatImages/" + fupBoatImage.FileName;
        txtBoatImage.Text = fupBoatImage.FileName;
    }
    //Reset the Page and Clear all Controls.
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/House_Boat_Registration.aspx");
    }
}