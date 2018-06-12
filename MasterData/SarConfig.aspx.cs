
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
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

public partial class SarConfig : System.Web.UI.Page
{
    BTC btc = new BTC();
    Connection Conn = new Connection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getcblReportProject();
            getcblReportActivity();
            GetRate();
            getddlYear();
            GetData(CurrentUser.SchoolID);
            ckFullText();
        }
        txtUpdateLink.Attributes.Add("onkeyup", "Cktxt(0);");
        txtLogSarLink.Attributes.Add("onkeyup", "Cktxt(0);");
        txtForwardMail.Attributes.Add("onkeyup", "Cktxt(0);");
        //txtIdentity.Attributes.Add("onkeyup", "CkIdentity();");
        //txtIdentity2.Attributes.Add("onkeyup", "CkIdentity2();");
    }
    private void GetRate()
    {
        rbtlRate.Items.Insert(0, new ListItem(" Ẻ��� (1 ���ҧ�ء��Ǵ���˹ѡ��ṹ)", "0"));
        rbtlRate.Items.Insert(1, new ListItem(" Ẻ���� (2 ���ҧ㹺ҧ��Ǵ���˹ѡ��ṹ)", "1"));
        rbtlRate.Items.Insert(2, new ListItem(" Ẻࢵ 1 ���. (12 �ҵðҹ)", "2"));
        rbtlRate.Items.Insert(3, new ListItem(" Ẻ�ҵðҹ���� (4 �ҵðҹ)", "3"));
        rbtlRate.DataBind();
    }
    private void getddlYear()
    {
        btc.getdllStudyYear(ddlYearS);
        btc.getDefault(ddlYearS, "StudyYear", "StudyYear");
    }
    private void getcblReportProject()
    {
        cblReportProject.Items.Insert(0, new ListItem(" Ẻ��� 1 ", "0"));
        cblReportProject.Items.Insert(1, new ListItem(" Ẻ��� 2 ", "1"));
    }
    private void getcblReportActivity()
    {
        cblReportActivity.Items.Insert(0, new ListItem(" 㺤Ӣ� ", "0"));
    }
    private void getReport(string strReport, CheckBoxList cbl)
    {
        string[] ckReport = strReport.Split(',');
        for (int i = 0; i <= cbl.Items.Count - 1; i++)
        {
            for (int j = 0; j <= ckReport.Length - 1; j++)
            {
                if (cbl.Items[i].Value == ckReport[j].ToString())
                {
                    cbl.Items[i].Selected = true;
                    break;
                }
            }
        }
    }
    private void GetData(string id)
    {
        if (String.IsNullOrEmpty(id)) return;
        DataView dv = Conn.Select(string.Format("Select *, IsNull(ckSale, 0) ck_Sale From MR_School Where SchoolID = '" + id + "'"));

        if (dv.Count != 0)
        {
            txtIdentity.Text = dv[0]["IdentityName"].ToString();
            txtIdentity2.Text = dv[0]["IdentityName2"].ToString();
            txtUpdateLink.Text = dv[0]["UpdateLink"].ToString();
            txtLogSarLink.Text = dv[0]["LogSarLink"].ToString();
            txtForwardMail.Text = dv[0]["MailTo"].ToString();
            txtPositionResponsible.Text = dv[0]["PositionResponsible"].ToString();
            txtPositionHeadGroupSara.Text = dv[0]["PositionHeadGroupSara"].ToString();
            txtPositionHeadGroup.Text = dv[0]["PositionHeadGroup"].ToString();

            rbtlYearType.SelectedValue = Convert.ToInt32(dv[0]["ckBudgetYear"]).ToString();
            rbtlIdentity1.SelectedValue = Convert.ToInt32(dv[0]["iNameShow"]).ToString();
            rbtlIdentity2.SelectedValue = Convert.ToInt32(dv[0]["iNameShow2"]).ToString();
            rbtlStrategicObjectives.SelectedValue = Convert.ToInt32(dv[0]["ckStrategicObjectives"]).ToString();
            rbtlStrategic.SelectedValue = Convert.ToInt32(dv[0]["ckStrategic"]).ToString();
            rbtlCorporateStrategy.SelectedValue = Convert.ToInt32(dv[0]["ckCorporateStrategy"]).ToString();
            rbtlStrategicPlan.SelectedValue = Convert.ToInt32(dv[0]["ckStrategicPlan"]).ToString();
            rbtlMainActivity.SelectedValue = Convert.ToInt32(dv[0]["ckMainActivity"]).ToString();
            rbtlStrategies.SelectedValue = Convert.ToInt32(dv[0]["ckStrategies"]).ToString();
            rbtlActivityStatus.SelectedValue = Convert.ToInt32(dv[0]["ckActivityStatus"]).ToString();
            rbtlAcAssessment.SelectedValue = Convert.ToInt32(dv[0]["ckAcAssessment"]).ToString();
            rbtlFullText.SelectedValue = Convert.ToInt32(dv[0]["ckFullText"]).ToString();

            rbtlStandardNation.SelectedValue = Convert.ToInt32(dv[0]["ckStandardNation"]).ToString();
            rbtlStandardMinistry.SelectedValue = Convert.ToInt32(dv[0]["ckStandardMinistry"]).ToString();

            rbtlRate.SelectedValue = Convert.ToInt32(dv[0]["ckRate"]).ToString();

            cbReportW.Checked = Convert.ToBoolean(dv[0]["ckWord"]);
            cbReportE.Checked = Convert.ToBoolean(dv[0]["ckExcel"]);
            cbReportP.Checked = Convert.ToBoolean(dv[0]["ckPDF"]);

            getReport(dv[0]["ckReportProject"].ToString(), cblReportProject);
            getReport(dv[0]["ckReportActivity"].ToString(), cblReportActivity);

            if (CurrentUser.RoleLevel < 98)
            {
                btSave.Visible = false;
            }
            else
            {
                btSave.Visible = true;
            }
        }
    }
    private string ckReport(CheckBoxList cbl)
    {
        string ckReport = "";
        for (int i = 0; i < cbl.Items.Count; i++)
        {
            if (cbl.Items[i].Selected == true)
            {
                ckReport += cbl.Items[i].Value +",";
            }
        }
        if (ckReport != "")
        {
            return ckReport.Substring(0, ckReport.Length - 1);
        }
        else
        {
            return ckReport;
        }
    }
    protected void btSave_Click(object sender, EventArgs e)
    {
        string ckReportPj = ckReport(cblReportProject);
        string ckReportAc = ckReport(cblReportActivity);

        Int32 i = Conn.Update("MR_School", "Where SchoolID = '" + CurrentUser.SchoolID + "' ", "IdentityName, IdentityName2, iNameShow, iNameShow2, ckStrategicObjectives, ckStandardNation, ckStandardMinistry, ckRate, ckStrategic, ckFullText, ckBudgetYear, UpdateLink, LogSarLink, MailTo, PositionResponsible, PositionHeadGroupSara, PositionHeadGroup, ckStrategicPlan, ckCorporateStrategy, ckMainActivity, ckStrategies, ckActivityStatus, ckAcAssessment, ckWord, ckExcel, ckPDF, UpdateUser, UpdateDate, ckReportProject, ckReportActivity",
            txtIdentity.Text, txtIdentity2.Text, rbtlIdentity1.SelectedValue, rbtlIdentity2.SelectedValue, rbtlStrategicObjectives.SelectedValue, rbtlStandardNation.SelectedValue, rbtlStandardMinistry.SelectedValue, Convert.ToInt32(rbtlRate.SelectedValue), rbtlStrategic.SelectedValue, rbtlFullText.SelectedValue, rbtlYearType.SelectedValue, txtUpdateLink.Text, txtLogSarLink.Text, txtForwardMail.Text, txtPositionResponsible.Text, txtPositionHeadGroupSara.Text, txtPositionHeadGroup.Text, rbtlStrategicPlan.SelectedValue, rbtlCorporateStrategy.SelectedValue, rbtlMainActivity.SelectedValue, rbtlStrategies.SelectedValue, rbtlActivityStatus.SelectedValue, rbtlAcAssessment.SelectedValue, cbReportW.Checked, cbReportE.Checked, cbReportP.Checked, CurrentUser.ID, DateTime.Now, ckReportPj, ckReportAc);

        if (rbtlckRate.SelectedIndex == 0)
        {
            try
            {
                Conn.Execute("GenRate", "RateType", rbtlRate.SelectedValue);
                Conn.Execute("GenScoreGroupSideAndStandard", "RateType, StudyYear", rbtlRate.SelectedValue, Convert.ToInt32(ddlYearS.SelectedValue));
                Conn.Execute("GenIndRate", "RateType, StudyYear", rbtlRate.SelectedValue, Convert.ToInt32(ddlYearS.SelectedValue));
            }
            catch (Exception ex)
            {

            }
        }

        if (rbtlYearType.SelectedValue == "1") // �է�����ҳ
        {
            Conn.Execute("ckMenuBudgetYear", "ck", 1);
        }
        else
        {
            Conn.Execute("ckMenuBudgetYear", "ck", 0);
        }

        if (rbtlStandardNation.SelectedValue == "1") // �ҵðҹ�ҵ�
        {
           Conn.Execute("ckMenuStandardNation", "ck", 1);
        }
        else
        {
           Conn.Execute("ckMenuStandardNation", "ck", 0);
        }

        if (rbtlStandardMinistry.SelectedValue == "1") // �ҵðҹ��з�ǧ
        { 
           Conn.Execute("ckMenuStandardMinistry", "ck", 1);
        }
        else
        {
           Conn.Execute("ckMenuStandardMinistry", "ck", 0);
        }

        if (rbtlStrategicObjectives.SelectedValue == "1") // �ѵ�ػ��ʧ���ԧ���ط��
        {
            Conn.Execute("ckMenuStrategicObjectives", "ck", 1);
        }
        else
        {
            Conn.Execute("ckMenuStrategicObjectives", "ck", 0);
        }

        if (rbtlStrategic.SelectedValue == "1") // �ط���ʵ��
        {
            Conn.Execute("ckMenuStrategic", "ck", 1);
        }
        else
        {
            Conn.Execute("ckMenuStrategic", "ck", 0);
        }

        if (rbtlStrategicPlan.SelectedValue == "1") // ���ط���дѺἹ�ҹ
        {
            Conn.Execute("ckMenuStrategicPlan", "ck", 1);
        }
        else
        {
            Conn.Execute("ckMenuStrategicPlan", "ck", 0);
        }

        if (rbtlCorporateStrategy.SelectedValue == "1") // ���ط���дѺͧ���
        {
            Conn.Execute("ckMenuCorporateStrategy", "ck", 1);
        }
        else
        {
            Conn.Execute("ckMenuCorporateStrategy", "ck", 0);
        }

        if (rbtlMainActivity.SelectedValue == "1") // �Ԩ������ѡ
        {
            Conn.Execute("ckMenuMainActivity", "ck", 1);
        }
        else
        {
            Conn.Execute("ckMenuMainActivity", "ck", 0);
        }
        
        btc.Msg_Head(Img1, MsgHead, true, "2", i);
        rbtlckRate.SelectedIndex = 1;
        PanelRate.Enabled = false;
        GetData(CurrentUser.SchoolID);
    }
    protected void rbtlFullText_SelectedIndexChanged(object sender, EventArgs e)
    {
        ckFullText();
    }
    private void ckFullText()
    {
        if (rbtlFullText.SelectedIndex == 0)
        {
            lblExFullText.Text = "Ex. �ҵðҹ��� 1. xxxxxxxxxxx";
        }
        else
        {
            lblExFullText.Text = "Ex. �ҵ�ҹ��� 1, 2, 3, 4";
        }
    }
    protected void rbtlckRate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtlckRate.SelectedIndex == 0)
        {
            PanelRate.Enabled = true;
        }
        else
        {
            PanelRate.Enabled = false;
        }
    }
    protected void cblReportProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblReportProject.Text = "";
        if (cblReportProject.SelectedIndex == 0)
        {
            lblReportProject.Text = "- �ʴ���������´�Ԩ������Ч�����ҳ����������ͧ������ҳ";
        }
        if (cblReportProject.SelectedIndex == 1)
        {
            lblReportProject.Text = "- �ʴ���������´�Ԩ����Ẻᨧ����������¡Ԩ����";
        }
    }
}
