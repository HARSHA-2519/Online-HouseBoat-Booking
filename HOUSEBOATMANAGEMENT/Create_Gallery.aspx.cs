using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class HOUSEBOATMANAGEMENT_Create_Gallery : System.Web.UI.Page
{
    BoatBookingClass Gallery = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["HOUSEBOATADMIN"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
        {
        Gallery.BoatConnection();
        if (!IsPostBack)
        {
          BindBoatName();
        }
        }
    }
    public void BindBoatName()
    {
        //Bind Dropdown list value of House_Boat_Reg
        Gallery.BoatQuery = "Select Boat_id,Boatname from House_Boat_Reg where Admin_id='" + Session["HOUSEBOATADMIN"] + "'";
        Gallery.BoatReadData(Gallery.BoatQuery);

        ddlBoatName.DataSource = Gallery.BoatDr;
        ddlBoatName.DataTextField = "Boatname";
        ddlBoatName.DataValueField = "Boat_id";
        ddlBoatName.DataBind();
        ddlBoatName.Items.Insert(0, "---Select Boat---");
        Gallery.BoatDr.Close();
    }
    protected void lbtnUpload_Click(object sender, EventArgs e)
    {

        if (fupGallery.HasFile == false)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", "<script>alert('No File Uploaded.')</script>", false);
        }
        else
        {
            foreach (var files in fupGallery.PostedFiles)
            {
                string imagename = Path.GetFileName(fupGallery.PostedFile.FileName);

                imagename = imagename.Split('.')[0].ToString();

                string pathname;

                pathname = Server.MapPath("~/BoatImages/") + fupGallery.FileName;

                fupGallery.PostedFile.SaveAs(pathname);
                //Insert values into Gallery Table
                Gallery.BoatQuery = "insert into gallery values(" + ddlBoatName.SelectedValue + ",'"+fupGallery.FileName.ToString() + "','" + imagename + "','" + System.DateTime.Now.ToString("MM/dd/yy") + "')";
                Gallery.BoatWriteData(Gallery.BoatQuery);
            }
            Response.Write("<script>alert('File Uploaded.')</script>");
            bindDataList();
        }
        Clear(); 
    }
    //Bind Gallery into GridView for Update and delete data
    public void bindDataList()
    {
        Gallery.BoatQuery = "Select * from Gallery where Boat_id="+ddlBoatName.SelectedValue+"";
        Gallery.BoatGetDataset(Gallery.BoatQuery);
        dlGallery.DataSource = Gallery.BoatDs;
        dlGallery.DataBind();
    }
    //Clear all Controls
    public void Clear()
    {
        ddlBoatName.SelectedIndex = -1;
    }
    protected void ddlBoatName_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDataList();
    }
}