using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Prescription : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\tahani96\Documents\Visual Studio 2010\WebSites\Mid2\App_Data\Database.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
    }
    protected void Btnupdate_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Update prescription Set Doc_id='" + DropDownListname.SelectedValue + "', Pat_id='" + Txtpatient.Text + "', Date='" + Txtdate.Text + "', Fee='" + Txtfee.Text + "'WHERE ([prs_id] = @prs_id)", conn);
        cmd.Parameters.AddWithValue("@prs_id", Textsearch.Text);

        Labelmass.Visible = true;
        Labelmass.Text = "Updated Succeefully";
        ClientScript.RegisterStartupScript(this.GetType(), "Updated secessfully", "alert('" + "Updated secessfully Succeefully" + "');", true);
        Labelmass.Text = "";
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    protected void Btninsert_Click(object sender, EventArgs e)
    {
        LabelName.Visible = true;
        LabelName.Text = "Insert Succeefully!";
        ClientScript.RegisterStartupScript(this.GetType(), "prescription ID inserted succesfully", "alert('" + "Insert secessfully" + "');", true);
        LabelName.Text = "";


        SqlCommand cmd = new SqlCommand("INSERT INTO[prescription] VALUES(@doc_id,@pat_id,@date,@fee)", conn);
        cmd.Parameters.AddWithValue("@doc_id", DropDownListname.SelectedValue);
        cmd.Parameters.AddWithValue("@pat_id", Txtpatient.Text);
        cmd.Parameters.AddWithValue("@date", Txtdate.Text);
        cmd.Parameters.AddWithValue("@fee", Txtfee.Text);

        cmd.ExecuteNonQuery();
        conn.Close();
    }

    protected void Txtpatient_TextChanged(object sender, EventArgs e)
    {
        SqlDataReader dr;
        SqlCommand SearchResultCmd = new SqlCommand("Select Pat_name from patient WHERE ([Pat_id] = @Pat_id)", conn);
        SearchResultCmd.Parameters.AddWithValue("@Pat_id", Txtpatient.Text);
        dr = SearchResultCmd.ExecuteReader();
        if (!dr.Read())
        {
            LabelName.Visible = true;
            LabelName.Text = "The ID you Entered is not exist!";
            ClientScript.RegisterStartupScript(this.GetType(), "Error!", "alert('" + "The ID you Entered is not exist!" + "');", true);
            LabelName.Text = "";

            dr.Close();
            conn.Close();
        }
        else
        {
            LabelName.Visible = true;
            LabelName.Text = dr["Pat_name"].ToString();
            dr.Close();
            SearchResultCmd.ExecuteNonQuery();
            conn.Close();
        }

    }
    protected void Btnsearch_Click(object sender, EventArgs e)
    {
        SqlDataReader dr;
        SqlCommand SearchCmd = new SqlCommand("Select * from Prescription WHERE([Prs_id] = @Prs_id)", conn);
        SearchCmd.Parameters.AddWithValue("@Prs_id", Textsearch.Text);

        dr = SearchCmd.ExecuteReader();
        if (dr.Read())
        {
            Txtpatient.Text = dr["Pat_id"].ToString();
            Txtdate.Text = dr["Date"].ToString();
            Txtfee.Text = dr["Fee"].ToString();
            DropDownListname.Text=(dr["Doc_id"].ToString());
        }
        else
        {
            Labelmass.Visible = true;
            Labelmass.Text = "The ID you Entered is not exist!";
            ClientScript.RegisterStartupScript(this.GetType(), "Error!", "alert('" + "The ID you Entered is not exist!" + "');", true);
            Labelmass.Text = "";
            dr.Close();
            conn.Close();
        }

    }

    protected void BtnClear_Click(object sender, EventArgs e)
    {

        Txtpatient.Text = "";
        Txtdate.Text = "";
        Txtfee.Text = "";
        Textsearch.Text = "";
        DropDownListname.ClearSelection();
    }
}
