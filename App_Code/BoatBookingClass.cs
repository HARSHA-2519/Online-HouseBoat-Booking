using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class BoatBookingClass
{
    public SqlConnection BoatCon = new SqlConnection();
    public SqlCommand Boatcmd;
    public SqlDataReader BoatDr;
    public string BoatQuery;
    public DataSet BoatDs;
    public SqlDataAdapter BoatDa;
    public int id;
    public int Boatsid;

    public void BoatConnection()
    {
        BoatCon.ConnectionString = ConfigurationManager.ConnectionStrings["HouseBoatBookingDB"].ConnectionString;
        BoatCon.Open();
    }
    public void BoatWriteData(string BoatQuery)
    {
        Boatcmd = new SqlCommand(BoatQuery, BoatCon);
        Boatcmd.ExecuteNonQuery();
    }
    public void BoatReadData(string BoatQuery)
    {
        Boatcmd = new SqlCommand(BoatQuery, BoatCon);
        BoatDr = Boatcmd.ExecuteReader();
    }
    public void BoatGetDataset(string BoatQuery)
    {
        Boatcmd = new SqlCommand(BoatQuery, BoatCon);
        BoatDa = new SqlDataAdapter(Boatcmd);
        BoatDs = new DataSet();
        BoatDa.Fill(BoatDs);
    }
    public int BoatScalar(string BoatQuery)
    {
        Boatcmd = new SqlCommand(BoatQuery, BoatCon);
        Boatsid = Convert.ToInt32(Boatcmd.ExecuteScalar());
        return Boatsid;
    }
}