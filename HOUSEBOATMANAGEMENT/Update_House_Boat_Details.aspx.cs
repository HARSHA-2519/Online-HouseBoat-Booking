using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HOUSEBOATMANAGEMENT_Update_House_Boat_Details : System.Web.UI.Page
{
    public int id;
    BoatBookingClass HouseB = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["HOUSEBOATADMIN"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
            HouseB.BoatConnection();
            if (!IsPostBack)
            {
                BindHouseBoatDetails(id);
            }
        }
    }
    //Bind HoseBoat Details for update the all deatils
    public void BindHouseBoatDetails(int id)
    {
        HouseB.BoatQuery = @" SELECT        HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, LOCATION.Loc_id, LOCATION.Loc_name, BOAT_TYPE.Btype_id, BOAT_TYPE.Typename, HOUSE_BOAT_REG.Tot_rooms, HOUSE_BOAT_REG.Descp, 
                         HOUSE_BOAT_REG.Cont_name, HOUSE_BOAT_REG.Address_Line1, HOUSE_BOAT_REG.Address_Line2, HOUSE_BOAT_REG.Cont_no, HOUSE_BOAT_REG.Boat_image, HOUSE_BOAT_REG.Rate_per_day, 
                         HOUSE_BOAT_REG.Status, HB_ADMIN.Admin_id, HB_ADMIN.Name
FROM            HOUSE_BOAT_REG INNER JOIN
                         BOAT_TYPE ON HOUSE_BOAT_REG.Btype_id = BOAT_TYPE.Btype_id INNER JOIN
                         LOCATION ON HOUSE_BOAT_REG.Loc_id = LOCATION.Loc_id INNER JOIN
                         HB_ADMIN ON HOUSE_BOAT_REG.Admin_id = HB_ADMIN.Admin_id";
        HouseB.BoatGetDataset(HouseB.BoatQuery);
        dvUpdateHouseBoat.DataSource = HouseB.BoatDs;
        dvUpdateHouseBoat.DataBind();
    }
    protected void dvUpdateHouseBoat_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        string img;
        int id = Convert.ToInt32(dvUpdateHouseBoat.DataKey.Value.ToString());
        TextBox txtname = (TextBox)dvUpdateHouseBoat.FindControl("txtBoatname");
        DropDownList ddlLoc = (DropDownList)dvUpdateHouseBoat.FindControl("ddlLoc_id");
        DropDownList ddlBtype = (DropDownList)dvUpdateHouseBoat.FindControl("ddlBtype_id");
        TextBox txtRoom = (TextBox)dvUpdateHouseBoat.FindControl("txtTot_name");
        TextBox txtDescp = (TextBox)dvUpdateHouseBoat.FindControl("txtDescp");
        TextBox txtContname = (TextBox)dvUpdateHouseBoat.FindControl("txtCont_name");
        TextBox txtAddress1 = (TextBox)dvUpdateHouseBoat.FindControl("txtAddress_Line1");
        TextBox txtAddress2 = (TextBox)dvUpdateHouseBoat.FindControl("txtAddress_Line2");
        TextBox txtContno = (TextBox)dvUpdateHouseBoat.FindControl("txtCont_no");
        TextBox txtRate = (TextBox)dvUpdateHouseBoat.FindControl("txtRate_per_day");
        TextBox txtImage = (TextBox)dvUpdateHouseBoat.FindControl("txtBoat_image");
        FileUpload fupImage = (FileUpload)dvUpdateHouseBoat.FindControl("fupBoat_image");
        DropDownList ddlOwner = (DropDownList)dvUpdateHouseBoat.FindControl("ddlAdmin_id");
        if (fupImage.HasFile)
        {
            fupImage.SaveAs(Server.MapPath("~/BoatImages/" + fupImage.FileName));
            img = fupImage.FileName;
        }
        else
        {
            img = txtImage.Text;
        }
        //Update the each Row.
        HouseB.BoatQuery = "Update House_Boat_Reg set Boatname='" + txtname.Text + "',Loc_id=" + ddlLoc.SelectedValue + ",Btype_id=" + ddlLoc.SelectedValue + ",Tot_rooms=" + txtRoom.Text + ",Descp='" + txtDescp.Text + "',Cont_name='" + txtContname.Text + "',Address_Line1='" + txtAddress1.Text + "',Address_Line2='" + txtAddress2.Text + "',Cont_no=" + txtContno.Text + ",Boat_image='" + img + "',Rate_per_day=" + txtRate.Text + ",Admin_id=" + ddlOwner.SelectedValue + " where Boat_id=" + id + "";
        HouseB.BoatWriteData(HouseB.BoatQuery);
        dvUpdateHouseBoat.ChangeMode(DetailsViewMode.ReadOnly);
        BindHouseBoatDetails(id);
    }
    protected void dvUpdateHouseBoat_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvUpdateHouseBoat.ChangeMode(e.NewMode);
        BindHouseBoatDetails(id);
    }
}