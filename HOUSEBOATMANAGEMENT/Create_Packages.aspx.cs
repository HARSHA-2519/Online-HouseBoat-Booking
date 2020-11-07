using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HOUSEBOATMANAGEMENT_Create_Packages : System.Web.UI.Page
{
    BoatBookingClass Package = new BoatBookingClass();
    public string FoodMenu;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["HOUSEBOATADMIN"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
        Package.BoatConnection();
         if(!IsPostBack)
         {
            BindBoatName();
            BindLocationFrom();
            BindLocationTo();
         }
        }
    }
    public void BindLocationFrom()
    {
        //Bind Dropdown list value of  FROM_Location
        Package.BoatQuery = "Select * from Location";
        Package.BoatReadData(Package.BoatQuery);
        ddlLocationfrom.DataSource = Package.BoatDr;
        ddlLocationfrom.DataTextField = "Loc_name";
        ddlLocationfrom.DataValueField = "Dist_id";
        ddlLocationfrom.DataBind();
        ddlLocationfrom.Items.Insert(0, "---Location From---");
        Package.BoatDr.Close();
    }
    public void BindLocationTo()
    {
        //Bind Dropdown list value of TO_Location
        Package.BoatQuery = "Select * from Location";
        Package.BoatReadData(Package.BoatQuery);
        ddlLocationTo.DataSource = Package.BoatDr;
        ddlLocationTo.DataTextField = "Loc_name";
        ddlLocationTo.DataValueField = "Dist_id";
        ddlLocationTo.DataBind();
        ddlLocationTo.Items.Insert(0, "---Location To---");
        Package.BoatDr.Close();
    }
    public void BindBoatName()
    {
        //Bind Dropdown list value of BoatName 
        Package.BoatQuery = "Select Boat_id,Boatname from House_Boat_Reg where Admin_id='" + Session["HOUSEBOATADMIN"] + "'";
        Package.BoatReadData(Package.BoatQuery);
        ddlBoatname.DataSource = Package.BoatDr;
        ddlBoatname.DataTextField = "Boatname";
        ddlBoatname.DataValueField = "Boat_id";
        ddlBoatname.DataBind();
        ddlBoatname.Items.Insert(0, "---Select Boat---");
        Package.BoatDr.Close();
    }

    protected void btnAddPackage_Click(object sender, EventArgs e)
    {
        try
        {
            //Get the data from database and checking there Exists
            Package.BoatQuery = "Select * from  Packages where Pack_name='" + txtPackname.Text + "' and boat_id=" + ddlBoatname.SelectedValue + " and Tot_days=" + txtTotalDays.Text + " and Duration='" + txtDuration.Text + "' and Rate=" + txtRate.Text + "";
            Package.BoatReadData(Package.BoatQuery);

            if (Package.BoatDr.Read())
            {
                Package.BoatDr.Close();
                Response.Write("<script>alert('Package already exists!!!')</script>");
            }
            else
            {
                Package.BoatDr.Close();
                if (fupImage.HasFile)
                {
                    //Insert Packages into the table
                    fupImage.SaveAs(Server.MapPath("~/BoatImages/" + fupImage.FileName));
                    Package.BoatQuery = "Insert into Packages values('" + txtPackname.Text + "'," + ddlBoatname.SelectedValue + "," + txtTotalDays.Text + "," + ddlLocationfrom.SelectedValue + "," + ddlLocationTo.SelectedValue + ",'" + txtPackStart.Text + "','" + txtPackEnd.Text + "','" + rblFoodMenu.SelectedValue + "','" + txtExtra.Text + "','" + fupImage.FileName + "','" + txtDuration.Text + "'," + txtRate.Text + ",'Active')";
                    Package.BoatWriteData(Package.BoatQuery);
                    Response.Write("<script>alert('Submitted Successfully!!!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Aldeary have!!!')</script>");
                }
            }
            Clear();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            Package.BoatCon.Close();
            Package.BoatCon.Dispose();
            Package.Boatcmd.Dispose();
        }
    }
    //Clear all Controls
    public void Clear()
    {
        txtDuration.Text = "";
        ddlBoatname.SelectedIndex = -1;
        txtExtra.Text = "";
        ddlLocationfrom.SelectedIndex = -1;
        ddlLocationTo.SelectedIndex = -1;
        txtPackEnd.Text = "";
        txtPackname.Text = "";
        txtPackStart.Text = "";
        txtRate.Text = "";
        txtTotalDays.Text = "";
        rblFoodMenu.SelectedIndex = -1;
    }
    //Reset the Page and Clear all Controls
    protected void btnResetPackage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HOUSEBOATMANAGEMENT/Create_Pack.aspx");
    }
}
