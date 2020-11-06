using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CUSTOMER_PaymentRecepit_Without_Package : System.Web.UI.Page
{
    BoatBookingClass PayDet = new BoatBookingClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        else
            PayDet.BoatConnection();
        if (Application["Bookid"] != null)
        {
            lblBookID.Text = Application["Bookid"].ToString();
        }
        if (Application["bname"] != null)
        {
            lblBoatID.Text = Application["bname"].ToString();
        }

        findPaydate(lblBookID.Text);
        findCustomeraddress(lblBookID.Text);
        findOwneraddress(lblBookID.Text);
        BindPaymentDetails(lblBookID.Text);
        findTotal(lblBookID.Text);
    }
    //Get the values of tables to find pay date
    private void findPaydate(String Bookid)
    {
        PayDet.BoatQuery = @"SELECT         BOAT_BOOKING.Book_date,CUSTOMER_REG.Name,BOAT_BOOKING.Book_id
FROM            BOAT_BOOKING INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id where BOAT_BOOKING.Book_id='" + Bookid + "' and BOAT_BOOKING.Cust_id ='" + Session["Cust_id"] + "'";
        PayDet.BoatReadData(PayDet.BoatQuery);
        if (PayDet.BoatDr.Read())
        {
            lblBookDate.Text = PayDet.BoatDr[0].ToString();
            lblCustName.Text = PayDet.BoatDr[1].ToString();
            PayDet.BoatDr.Close();
        }
        PayDet.BoatDr.Close();
    }
    //Get the values of tables to find Customer address
    private void findCustomeraddress(String Bookid)
    {
        PayDet.BoatQuery = @"SELECT        CUSTOMER_REG.Address_Line1, BOAT_BOOKING.Book_id
FROM BOAT_BOOKING INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id where BOAT_BOOKING.Cust_id ='" + Session["Cust_id"] + "' and BOAT_BOOKING.Book_id='" + Bookid + "' ";
        PayDet.BoatReadData(PayDet.BoatQuery);
        if (PayDet.BoatDr.Read())
        {
            Application["Address"] = PayDet.BoatDr[0].ToString();
            lblCustAddress.Text = Application["Address"].ToString();
            PayDet.BoatDr.Close();
        }
        PayDet.BoatDr.Close();
    }
    //Get the values of tables to find Owner address
    private void findOwneraddress(String Bookid)
    {
        PayDet.BoatQuery = @"SELECT        HOUSE_BOAT_REG.Address_Line1, BOAT_BOOKING.Book_id
FROM BOAT_BOOKING INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id where BOAT_BOOKING.Book_id='" + Bookid + "' ";
        PayDet.BoatReadData(PayDet.BoatQuery);
        if (PayDet.BoatDr.Read())
        {
            Application["OwnerAdd"] = PayDet.BoatDr[0].ToString();
            lblOwnerAddress.Text = Application["OwnerAdd"].ToString();
            PayDet.BoatDr.Close();
        }
        PayDet.BoatDr.Close();
    }
    //GridView Bind for take print
    public void BindPaymentDetails(String Bookid)
    {
        PayDet.BoatQuery = @"SELECT        BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, BOAT_BOOKING.Adv_amt
FROM            BOAT_BOOKING INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id where Boat_Booking.Book_id='" + Bookid + "'";
        PayDet.BoatGetDataset(PayDet.BoatQuery);
        gvPaymentDetails.DataSource = PayDet.BoatDs;
        gvPaymentDetails.DataBind();

    }
    //Get the values of tables to find total amount
    private void findTotal(String Bookid)
    {
        PayDet.BoatQuery = @"select Total_amt from BOAT_BOOKING where Book_id='" + Bookid + "'";
        PayDet.BoatReadData(PayDet.BoatQuery);
        if (PayDet.BoatDr.Read())
        {
            lblTotal.Text = PayDet.BoatDr[0].ToString();
            PayDet.BoatDr.Close();
        }
        PayDet.BoatDr.Close();
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        exportpdf();
    }
    //PDF file to take Printout
    private void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=PaymentInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //return;
        //  base.VerifyRenderingInServerForm(control);
    }
}