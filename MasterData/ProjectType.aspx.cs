using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ProjectType : System.Web.UI.Page
{
    Connection Conn = new Connection();
    BTC btc = new BTC();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            if (!string.IsNullOrEmpty(Request["Cr"]))
            {
                btc.Msg_Head(Img1, MsgHead, true, Request["ckmode"], Convert.ToInt32(Request["Cr"]));
            }

            ClearAll();
            string mode = Request["mode"];
            if (!string.IsNullOrEmpty(mode))
            {
                switch (mode.ToLower())
                {
                    case "1":
                        MultiView1.ActiveViewIndex = 1;
                        btc.GenSort(txtSort, "ProjectType", "");
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), Guid.NewGuid().ToString(), "Cktxt(0);", true);
                        break;
                    case "2":
                        MultiView1.ActiveViewIndex = 1;
                        GetData(Request["id"]);
                        break;
                    case "3":
                        MultiView1.ActiveViewIndex = 0;
                        Delete(Request["id"]);
                        break;
                }
            }
            else
            {
                DataBind();
            }
        }
        txtProjectType.Attributes.Add("onkeyup", "Cktxt(0);");
        txtCk.Attributes.Add("onkeyup", "Cktxt(0);");
        txtSort.Attributes.Add("onkeyup", "Cktxt(0);");
    }
    public override void DataBind()
    {
        string StrSql = "Select * From ProjectType Where DelFlag = 0 ";

        if (txtSearch.Text != "")
        {
            StrSql = StrSql + " And ProjectTypeName Like '%" + txtSearch.Text + "%' ";
        }
        DataView dv = Conn.Select(string.Format(StrSql + " Order By Sort "));
        GridView1.DataSource = dv;
        lblSearchTotal.InnerText = dv.Count.ToString();
        GridView1.DataBind();
    }
    private void GetData(string id)
    {
        if (string.IsNullOrEmpty(id)) return;
        DataView dv = Conn.Select(string.Format("Select * From ProjectType Where ProjectTypeID = '" + id + "'"));

        if (dv.Count != 0)
        {
            txtProjectType.Text = dv[0]["ProjectTypeName"].ToString();
            txtCk.Text = dv[0]["ckType"].ToString();
            txtSort.Text = dv[0]["Sort"].ToString();
        }
    }
    private void ClearAll()
    {
        txtProjectType.Text = "";
        txtCk.Text = "";
        txtSort.Text = "";
        txtSearch.Text = "";
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        DataBind();
    }
    private void bt_Save()
    {
        Int32 i = 0;
        if (String.IsNullOrEmpty(Request["mode"]) || Request["mode"] == "1")
        {
            string NewID = Guid.NewGuid().ToString();
            i = Conn.AddNew("ProjectType", "ProjectTypeID, ProjectTypeName, ckType, Sort, DelFlag, CreateUser, CreateDate, UpdateUser, UpdateDate", 
                NewID, txtProjectType.Text, txtCk.Text, txtSort.Text, 0, CurrentUser.ID, DateTime.Now, CurrentUser.ID, DateTime.Now);
            Response.Redirect("ProjectType.aspx?ckmode=1&Cr=" + i);
        }

        if (Request["mode"] == "2")
        {
            i = Conn.Update("ProjectType", "Where ProjectTypeID = '" + Request["id"] + "' ", "ProjectTypeName, ckType, Sort, UpdateUser, UpdateDate", 
                txtProjectType.Text, txtCk.Text, txtSort.Text, CurrentUser.ID, DateTime.Now);
            Response.Redirect("ProjectType.aspx?ckmode=2&Cr=" + i);
        }
    }
    protected void btSave_Click(object sender, EventArgs e)
    {
        bt_Save();
    }
    private void Delete(string id)
    {
        if (String.IsNullOrEmpty(id)) return;
        //DataView dv = Conn.Select(string.Format("Select ProjectTypeID From Indicators Where ProjectTypeID = '" + id + "' And DelFlag = '0' "));
        //if (dv.Count > 0)
        //{
        //    Response.Redirect("ProjectType.aspx?ckmode=3&Cr=0");
        //}
        //else
        //{
            Int32 i = Conn.Update("ProjectType", "Where ProjectTypeID = '" + id + "' ", "DelFlag, UpdateUser, UpdateDate", 1, CurrentUser.ID, DateTime.Now);
            Response.Redirect("ProjectType.aspx?ckmode=3&Cr=" + i);
        //}
    }
}