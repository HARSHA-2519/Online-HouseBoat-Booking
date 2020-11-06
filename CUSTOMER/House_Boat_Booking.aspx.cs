using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUSTOMER_House_Boat_Booking : System.Web.UI.Page
{
    BoatBookingClass BoatBooking = new BoatBookingClass();
    int count;
    protected void Page_Load(object sender, EventArgs e)
    {
        BoatBooking.BoatConnection();
        //Code for auto generating Booking ID
        BoatBooking.BoatQuery = "select count(*) from BOAT_BOOKING";
        BoatBooking.BoatReadData(BoatBooking.BoatQuery);
        BoatBooking.BoatDr.Close();
        count = Convert.ToInt16(BoatBooking.BoatScalar(BoatBooking.BoatQuery)) + 1;
        txtBookingId.Text = "HBB00" + count;
        Application["Bookid"] = txtBookingId.Text;
        BoatBooking.BoatDr.Close();
        if (HttpContext.Current.Session["Cust_id"] == null)
        {
            Response.Redirect("~/LOGIN/Login.aspx");
        }
        txtAdvPay.Visible = false;
        CardPaymentPanel.Visible = false;
        if (!IsPostBack)
        {
            BindLocationFrom();
            BindLocationTo();
            BindBoatName();
        }
        txtCustomerName.Text = Session["CustName"].ToString();
    }
    public void BindLocationFrom()
    {
        //Bind Dropdown list value of Location
        BoatBooking.BoatQuery = "Select * from Location";
        BoatBooking.BoatReadData(BoatBooking.BoatQuery);
        ddlDepLoc.DataSource = BoatBooking.BoatDr;
        ddlDepLoc.DataTextField = "Loc_name";
        ddlDepLoc.DataValueField = "Dist_id";
        ddlDepLoc.DataBind();
        ddlDepLoc.Items.Insert(0, "---Location From---");
        BoatBooking.BoatDr.Close();
    }
    public void BindLocationTo()
    {
        //Bind Dropdown list value of Location
        BoatBooking.BoatQuery = "Select * from Location";
        BoatBooking.BoatReadData(BoatBooking.BoatQuery);
        ddlArrLoc.DataSource = BoatBooking.BoatDr;
        ddlArrLoc.DataTextField = "Loc_name";
        ddlArrLoc.DataValueField = "Dist_id";
        ddlArrLoc.DataBind();
        ddlArrLoc.Items.Insert(0, "---Location To---");
        BoatBooking.BoatDr.Close();
    }
    public void BindBoatName()
    {
        //Bind Dropdown list value of BoatName 
        BoatBooking.BoatQuery = "Select Boat_id,Boatname from House_Boat_Reg ";
        BoatBooking.BoatReadData(BoatBooking.BoatQuery);
        ddlBoatname.DataSource = BoatBooking.BoatDr;
        ddlBoatname.DataTextField = "Boatname";
        ddlBoatname.DataValueField = "Boat_id";
        ddlBoatname.DataBind();
        ddlBoatname.Items.Insert(0, "---Select Boat---");
        BoatBooking.BoatDr.Close();
    }
    protected void btnBook_Click(object sender, EventArgs e)
    {
        try
        {
            //Insert into BoatBooking with Cardless Payment
            if (rblAdvPayment.SelectedItem.Text == "CARDLESS")
            {
                BoatBooking.BoatQuery = "Insert into Boat_Booking(Book_id,Boat_id,Pack_or_not,Cust_id,Tot_memb,Tot_adults,Tot_child,No_Days,Dep_Loc_id,Arr_loc_id,Extra_req,Food_req,Adv_amt,Book_date,Exp_budget,Total_amt,Status) values('" + Application["Bookid"] + "'," + ddlBoatname.SelectedValue + ",'No','" + Session["Cust_id"] + "'," + txtTotalMember.Text + "," + txtTotalAdults.Text + "," + txtTotalChild.Text + "," + txtNoOfDays.Text + "," + ddlDepLoc.SelectedValue + "," + ddlArrLoc.SelectedValue + ",'" + txtExtReq.Text + "','" + rblFoodReq.SelectedValue + "'," + txtAdvPay.Text + ",'" + System.DateTime.Now.ToString("MM/dd/yy") + "'," + txtExpBudget.Text + "," + txtTotalAmount.Text + ",'New Booking')";
                BoatBooking.BoatWriteData(BoatBooking.BoatQuery);
                Response.Write("<script>alert('Data Submitted!!!')</script>");
            Server.Transfer("PaymentRecepit_Without_Package.aspx?Book_id='" + Application["Bookid"] + "' and Boat_id='" + Application["BoatName"] + "'");
             }
            else
            {
                //Insert into BoatBooking with Card Payment
                BoatBooking.BoatQuery = "Insert into Boat_Booking(Book_id,Boat_id,Pack_or_not,Cust_id,Tot_memb,Tot_adults,Tot_child,No_Days,Dep_Loc_id,Arr_loc_id,Extra_req,Food_req,Adv_amt,Book_date,Exp_budget,Total_amt,Status) values('" + Application["Bookid"] + "'," + ddlBoatname.SelectedValue + ",'No','" + Session["Cust_id"] + "'," + txtTotalMember.Text + "," + txtTotalAdults.Text + "," + txtTotalChild.Text + "," + txtNoOfDays.Text + "," + ddlDepLoc.SelectedValue + "," + ddlArrLoc.SelectedValue + ",'" + txtExtReq.Text + "','" + rblFoodReq.SelectedValue + "'," + txtAdvAmt.Text + ",'" + System.DateTime.Now.ToString("MM/dd/yy") + "'," + txtExpBudget.Text + "," + txtTotalAmount.Text + ",'New Booking')";
                BoatBooking.BoatWriteData(BoatBooking.BoatQuery);
                Response.Write("<script>alert('Data Submitted!!!')</script>");
                Server.Transfer("Payment_Recepit.aspx?Book_id='" + Application["Bookid"] + "' and Boat_id='" + Application["BoatName"] + "'");
            }
    }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            BoatBooking.BoatCon.Close();
            BoatBooking.BoatCon.Dispose();
            BoatBooking.Boatcmd.Dispose();
        }
    }
    //Get the value of Rate from HOUSE_BOAT_REG table
    public void Rate()
    {
        BoatBooking.BoatQuery = "select Boatname, Rate_per_day from HOUSE_BOAT_REG where Boat_id=" + ddlBoatname.SelectedValue + "";
        BoatBooking.BoatReadData(BoatBooking.BoatQuery);
        if (BoatBooking.BoatDr.Read())
        {
            Application["BoatName"]= BoatBooking.BoatDr[0].ToString();
            txtRate.Text = BoatBooking.BoatDr[1].ToString();
            BoatBooking.BoatDr.Close();
        }
        BoatBooking.BoatDr.Close();
    }
    //Select the payment type Card or Cardless
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
    //Calculate the Total Amount in Cardless base Payment
    protected void txtAdvPay_TextChanged(object sender, EventArgs e)
    {
        txtTotalAmount.Text = Convert.ToString((Convert.ToInt32(txtTotalMember.Text) * Convert.ToInt32(txtRate.Text) * Convert.ToInt32(txtNoOfDays.Text)) - Convert.ToInt32(txtAdvPay.Text));
    }
    //Insert the value of Bank details and amont into ADV_PAY table
    protected void btnPayNow_Click(object sender, EventArgs e)
    {
        try
        {
            BoatBooking.BoatDr.Close();
            BoatBooking.BoatQuery = "Insert into ADV_PAY values('" + Application["Bookid"] + "','" + txtBankName.Text + "','" + System.DateTime.Now.ToString("MM/dd/yy") + "','" + txtPayType.Text + "','" + ddlCardType.SelectedItem.Text + "','" + txtCardNumber.Text + "','" + txtExpireDate.Text + "'," + txtAdvAmt.Text + ",'Paid')";
            BoatBooking.BoatWriteData(BoatBooking.BoatQuery);
            CardPaymentPanel.Visible = false;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
        finally
        {
            BoatBooking.BoatCon.Close();
            BoatBooking.BoatCon.Dispose();
            BoatBooking.Boatcmd.Dispose();
        }
    }
    //Calculate the Total Amount in Card base Payment
    protected void txtAdvAmt_TextChanged(object sender, EventArgs e)
    {
        txtTotalAmount.Text = Convert.ToString((Convert.ToInt32(txtTotalMember.Text) * Convert.ToInt32(txtRate.Text) * Convert.ToInt32(txtNoOfDays.Text)) - Convert.ToInt32(txtAdvAmt.Text));
    }
    //Calculate the Total Member
    protected void txtTotalChild_TextChanged(object sender, EventArgs e)
    {
        txtTotalMember.Text =Convert.ToString( Convert.ToInt32(txtTotalAdults.Text) + Convert.ToInt32(txtTotalChild.Text));
    }
    //Get the value of rate when select the boatname
    protected void ddlBoatname_SelectedIndexChanged(object sender, EventArgs e)
    {
        Rate();
    }
}