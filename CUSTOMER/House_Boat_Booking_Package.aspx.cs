using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_House_Boat_Booking_Package : System.Web.UI.Page
{
    BoatBookingClass BoatBookingPack = new BoatBookingClass();
    int count;
    protected void Page_Load(object sender, EventArgs e)
    {
        BoatBookingPack.BoatConnection();
        if (Application["pname"] != null)
        {          
            txtPackaName.Text= Application["pname"].ToString();
        }
        if (Application["bname"] != null)
        {
            txtBoatName.Text = Application["bname"].ToString();
        }
        if (Application["pid"] != null)
        {
            lblBoatName.Text = Application["pid"].ToString();
        }

        // Generate auto primary key
        BoatBookingPack.BoatQuery = "select count(*) from BOAT_BOOKING";
        BoatBookingPack.BoatReadData(BoatBookingPack.BoatQuery);
        BoatBookingPack.BoatDr.Close();
        count = Convert.ToInt16(BoatBookingPack.BoatScalar(BoatBookingPack.BoatQuery)) + 1;
        txtBookingId.Text = "HBB00" + count;
        Application["Bookid"] = txtBookingId.Text;
        BoatBookingPack.BoatDr.Close();

        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        txtAdvPay.Visible = false;
        lblFr.Visible = false;
        lblTo.Visible = false;
        lblDays.Visible = false;
        CardPaymentPanel.Visible = false;
        if (!IsPostBack)
        {
            Rate();
            CustomerName();
        }
    }
    protected void btnBook_Click(object sender, EventArgs e)
    {
        try
        {
            //Insert into BoatBooking with Cardless Payment
            if (rblAdvPayment.SelectedItem.Text == "CARDLESS")
            {
                BoatBookingPack.BoatQuery = "Insert into Boat_Booking(Book_id,Boat_id,Pack_or_not,Pack_id,Cust_id,Tot_memb,Tot_adults,Tot_child,From_date,To_date,Adv_amt,Book_date,Total_amt,Status) values('" + Application["Bookid"] + "'," + Application["Boat_Id"] + ",'Yes'," + Application["pid"] + ",'" + Session["Cust_id"] + "'," + txtTotalMember.Text + "," + txtTotalAdults.Text + "," + txtTotalChild.Text + ",'" + txtFromDate.Text + "','" + txtToDate.Text + "'," + txtAdvPay.Text + ",'" + System.DateTime.Now.ToString("MM/dd/yy") + "'," + txtTotalAmount.Text + ",'New Booking')";
                BoatBookingPack.BoatWriteData(BoatBookingPack.BoatQuery);
                Response.Write("<script>alert('Data Submitted!!!')</script>");
                Server.Transfer("PaymentRecepit_Without_Package.aspx?Book_id='" + Application["Bookid"] + "' and Boat_id='" + Application["bname"] + "'");
            }
            else
            {
                //Insert into BoatBooking with Card Payment
                BoatBookingPack.BoatQuery = "Insert into Boat_Booking(Book_id,Boat_id,Pack_or_not,Pack_id,Cust_id,Tot_memb,Tot_adults,Tot_child,From_date,To_date,Adv_amt,Book_date,Total_amt,Status) values('" + Application["Bookid"] + "'," + Application["Boat_Id"] + ",'Yes'," + Application["pid"] + ",'" + Session["Cust_id"] + "'," + txtTotalMember.Text + "," + txtTotalAdults.Text + "," + txtTotalChild.Text + ",'" + txtFromDate.Text + "','" + txtToDate.Text + "'," + txtAdvAmt.Text + ",'" + System.DateTime.Now.ToString("MM/dd/yy") + "'," + txtTotalAmount.Text + ",'New Booking')";
                BoatBookingPack.BoatWriteData(BoatBookingPack.BoatQuery);
                Response.Write("<script>alert('Data Submitted!!!')</script>");
                Server.Transfer("Payment_Recepit.aspx?Book_id='" + Application["Bookid"] + "' and Boat_id='"+ Application["bname"] + "'");
         }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            BoatBookingPack.BoatCon.Close();
            BoatBookingPack.BoatCon.Dispose();
            BoatBookingPack.Boatcmd.Dispose();
        }
    }
    //Get the value of Name from CUSTOMER_REG table
    public void CustomerName()
    {
        BoatBookingPack.BoatQuery = "select Name from CUSTOMER_REG where Cust_id='"+Session["Cust_id"] +"' ";
        BoatBookingPack.BoatReadData(BoatBookingPack.BoatQuery);
        if (BoatBookingPack.BoatDr.Read())
        {
            txtCustomerName.Text =BoatBookingPack.BoatDr[0].ToString();
            BoatBookingPack.BoatDr.Close();
        }
        BoatBookingPack.BoatDr.Close();
    }
    //Get the values  from PACKAGES table
    public void Rate()
    {
        BoatBookingPack.BoatQuery = "select Rate,Valid_From,Valid_to_dt,Tot_days from PACKAGES where pack_id='"+ Application["pid"] + "'";
        BoatBookingPack.BoatReadData(BoatBookingPack.BoatQuery);
        if (BoatBookingPack.BoatDr.Read())
        {
            Application["Rate"] = Convert.ToInt32(BoatBookingPack.BoatDr[0].ToString());
            txtFromDate.Text =Convert.ToDateTime( BoatBookingPack.BoatDr[1]).ToString("yyyy/MM/dd");
            lblFr.Text = txtFromDate.Text;
            txtTo.Text = Convert.ToDateTime(BoatBookingPack.BoatDr[2]).ToString("yyyy/MM/dd");
            lblTo.Text = txtTo.Text;
            Application["Days"] = Convert.ToInt32(BoatBookingPack.BoatDr[3].ToString());
            lblDays.Text = Application["Days"].ToString();
            BoatBookingPack.BoatDr.Close();
        }
        BoatBookingPack.BoatDr.Close();
    }
    //RadioBtton checking condition
    protected void rblAdvPayment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblAdvPayment.SelectedItem.Text == "CARDLESS")
        {
            txtAdvPay.Visible = true;
        }
        else
        {
            CardPaymentPanel.Visible = true;
            txtPayType.Text = rblAdvPayment.SelectedItem.Text;
        }
    }
    //Calculating Total Amount
    protected void txtAdvPay_TextChanged(object sender, EventArgs e)
    {
       txtTotalAmount.Text= Convert.ToString(Convert.ToInt32(Application["Rate"]) - Convert.ToInt32(txtAdvPay.Text));
    }
    protected void btnPayNow_Click(object sender, EventArgs e)
    {
        try
        {
            //Insert the values of ADV_PAY table
            BoatBookingPack.BoatDr.Close();
            BoatBookingPack.BoatQuery = "Insert into ADV_PAY values('" + Application["Bookid"] + "','" + txtBankName.Text + "','" + System.DateTime.Now.ToString("MM/dd/yy") + "','" + txtPayType.Text + "','" + ddlCardType.SelectedItem.Text + "','" + txtCardNumber.Text + "','" + txtExpireDate.Text + "'," + txtAdvAmt.Text + ",'Paid')";
            BoatBookingPack.BoatWriteData(BoatBookingPack.BoatQuery);
            CardPaymentPanel.Visible = false;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            BoatBookingPack.BoatCon.Close();
            BoatBookingPack.BoatCon.Dispose();
            BoatBookingPack.Boatcmd.Dispose();
        }
    }
    //Calculating Total Amount
    protected void txtAdvAmt_TextChanged(object sender, EventArgs e)
    {
        txtTotalAmount.Text = Convert.ToString(Convert.ToInt32(Application["Rate"]) - Convert.ToInt32(txtAdvAmt.Text));
    }
    //Calculating Total Member
    protected void txtTotalChild_TextChanged(object sender, EventArgs e)
    {
        txtTotalMember.Text = Convert.ToString(Convert.ToInt32(txtTotalAdults.Text) + Convert.ToInt32(txtTotalChild.Text));
    }
    //Checking Duration Date
    protected void txtFromDate_TextChanged(object sender, EventArgs e)
    {
        DateTime Date1 = Convert.ToDateTime(txtFromDate.Text);
        DateTime date2 = Convert.ToDateTime(lblFr.Text);
        DateTime date3 = Convert.ToDateTime(lblTo.Text);
        if (Date1 < date2 || Date1.AddMonths(1) > date3)
        {
            Response.Write("<script>alert('No Booking date.Plz select date between\\n" + date2.ToString("dd - MMM") + " & " + date3.ToString("dd - MMM") + ".')</script>");
            txtFromDate.Text=lblFr.Text;
            txtToDate.ReadOnly = true;
        }
        else
        {
            //Add values here
           DateTime formatteddays = Date1.AddDays(Int16.Parse(lblDays.Text));
            //Get the entered date
           txtToDate.Text = formatteddays.ToString("dd/MM/yyyy");
        }
    }
}