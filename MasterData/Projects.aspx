<%@ Page Language="C#" MasterPageFile="~/Master/MasterOriginal.master" AutoEventWireup="true"
    CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function AddItem() {
            location.href = "Projects.aspx?mode=1";
        }
        function EditItem(id) {
            location.href = "Projects.aspx?mode=2&id=" + id;
        }
        function deleteItem(id) {
            if (confirm('��ͧ���ź��¡�ù�� ���������')) location.href = "Projects.aspx?mode=3&id=" + id;
        }
        function gotoItem(id) {
            location.href = "Activity.aspx?mode=1&id=" + id;
        }
        function Cancel() {
            location.href = "Projects.aspx";
        }
        function printRpt(mode, type, id) {
            var ckSing = $get("<%=cbNotSign.ClientID%>").checked;
            var ckLogo = $get("<%=cbNotLogo.ClientID%>").checked;
            window.open("../GtReport/Viewer.aspx?rpt=" + mode + "&id=" + id + "&rpttype=" + type + "&ckSign=" + ckSing + "&ckLogo=" + ckLogo);
        }
        function Cktxt(m, a) {
            var ck = 0;
            //var txtStrategicPlan = $get("<%=txtStrategicPlan.ClientID%>");
            //var ErrorStrategicPlan = $get("ErrorStrategicPlan");
            var txtProjectsDetail = $get("<%=txtProjectsDetail.ClientID%>");
            var ErrorProjectsDetail = $get("ErrorProjectsDetail");
            var txtProjects = $get("<%=txtProjects.ClientID%>");
            var ErrorProjects = $get("ErrorProjects");
            var txtPurpose = $get("<%=txtPurpose.ClientID%>");
            var ErrorPurpose = $get("ErrorPurpose");
            var txtPurpose2 = $get("<%=txtPurpose2.ClientID%>");
            var ErrorPurpose2 = $get("ErrorPurpose2");
            var txtTarget = $get("<%=txtTarget.ClientID%>");
            var ErrorTarget = $get("ErrorTarget");
            var txtTarget2 = $get("<%=txtTarget2.ClientID%>");
            var ErrorTarget2 = $get("ErrorTarget2");
            var txtPeriod1 = $get("<%=txtPeriod1.ClientID%>");
            var ErrorPeriod1 = $get("ErrorPeriod1");
            var txtResponsibleName = $get("<%=txtResponsibleName.ClientID%>");
            var txtResponsiblePosition = $get("<%=txtResponsiblePosition.ClientID%>");
            var ErrorResponsible = $get("ErrorResponsible");
            var ErrorApproval = $get("ErrorApproval");
            var txtSort = $get("<%=txtSort.ClientID%>");
            var ErrorSort = $get("ErrorSort");
            var txtPlace = $get("<%=txtPlace.ClientID%>");
            var ErrorPlace = $get("ErrorPlace");
            //var txtProjectRegistration = $get("<%=txtProjectRegistration.ClientID%>");
            //var ErrorProjectRegistration = $get("ErrorProjectRegistration");
            var txtIOCode = $get("<%=txtIOCode.ClientID%>");
            var ErrorIOCode = $get("ErrorIOCode");

            ck += ckTxtNull(m, txtSort, ErrorSort);
            ck += ckTxtNull(m, txtResponsiblePosition, ErrorResponsible);
            ck += ckTxtNull(m, txtResponsibleName, ErrorResponsible);
            ck += ckTxtNull(m, txtPeriod1, ErrorPeriod1);
            ck += ckTxtNull(m, txtPlace, ErrorPlace);
            //ck += ckTxtNull(m, txtTarget2, ErrorTarget2);
            //ck += ckTxtNull(m, txtTarget, ErrorTarget);
            //ck += ckTxtNull(m, txtPurpose2, ErrorPurpose2);
            ck += ckTxtNull(m, txtPurpose, ErrorPurpose);
            ck += ckTxtNull(m, txtProjectsDetail, ErrorProjectsDetail);
            //ck += ckTxtNull(m, txtStrategicPlan, ErrorStrategicPlan);
            ck += ckTxtNull(m, txtProjects, ErrorProjects);
            //ck += ckTxtNull(m, txtIOCode, ErrorIOCode);
            //ck += ckTxtNull(m, txtProjectRegistration, ErrorProjectRegistration);

            if (ck > 0) {
                return false;
            }
            else {
                if (a < 3) {
                    return confirmApprove(a);
                }
                else {
                    return true;
                }
            }
        }
        function confirmApprove(mode) {
            var ck = 0;
            if (mode == 1) {
                if (confirm('��ͧ���͹��ѵ��ç��ù�����������?')) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                if (mode == 2) {
                    if (confirm('��ͧ��â͢�������������������������������?')) {
                        var txtComment = $get("<%=txtComment.ClientID%>");
                        var ErrorComment = $get("ErrorComment");
                        ck += ckTxtNull(1, txtComment, ErrorComment);
                        if (ck > 0) {
                            return false;
                        }
                        else {
                            return true;
                        }
                    }
                    else {
                        return false;
                    }
                }
                else {
                    if (confirm('��ͧ������ ͹��ѵ��ç��ù�����������?')) {
                        var txtComment = $get("<%=txtComment.ClientID%>");
                        var ErrorComment = $get("ErrorComment");
                        ck += ckTxtNull(1, txtComment, ErrorComment);
                        if (ck > 0) {
                            return false;
                        }
                        else {
                            return true;
                        }
                    }
                    else {
                        return false;
                    }
                }
            }
        }
        function Cktxt2(m) {
            var ck = 0;
            var ddlCreateUser = $get("<%=ddlCreateUser.ClientID%>");
            var ErrorCreateUser = $get("ErrorCreateUser");
            ck += ckDdlNull(m, ddlCreateUser, ErrorCreateUser);

            if (ck > 0) {
                return false;
            }
            else {
                return true;
            }
        }
        function ckddlDate(mode) {
            if (mode == 1) {
                var d2 = $get("<%=ddlSDay.ClientID%>").value;
                var m2 = $get("<%=ddlSMonth.ClientID%>").value;
                var y2 = $get("<%=ddlSYear.ClientID%>").value;
                ckDatetimeDDL(d2, m2, y2, $get("<%=ddlSDay.ClientID%>"));

                var d = $get("<%=ddlSDay.ClientID%>").value;
                var m = $get("<%=ddlSMonth.ClientID%>").value;
                var y = $get("<%=ddlSYear.ClientID%>").value;
                $get("<%=txtSDay.ClientID%>").value = d + '/' + m + '/' + y;
            }
            if (mode == 2) {
                var d2 = $get("<%=ddlEDay.ClientID%>").value;
                var m2 = $get("<%=ddlEMonth.ClientID%>").value;
                var y2 = $get("<%=ddlEYear.ClientID%>").value;
                ckDatetimeDDL(d2, m2, y2, $get("<%=ddlEDay.ClientID%>"));

                var d = $get("<%=ddlEDay.ClientID%>").value;
                var m = $get("<%=ddlEMonth.ClientID%>").value;
                var y = $get("<%=ddlEYear.ClientID%>").value;
                $get("<%=txtEDay.ClientID%>").value = d + '/' + m + '/' + y;
            }
            //$get("<%=txtPeriod1.ClientID%>").value = $get("<%=txtSDay.ClientID%>").value + ' �֧ ' + $get("<%=txtEDay.ClientID%>").value;
        }
    </script>
    <style type="text/css">
        .txtBoxlblnone2 {
            border: none 0px #FFFFFF;
            color: #424242;
            font-weight: bold;
            font-size: medium;
            width: 200px;
            text-align: right;
        }
        .SignatureImage {
        vertical-align:bottom; 
        border:none;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="pageDiv">
                <div class="warningDiv">
                    <asp:Image ID="Img1" runat="server" Visible="false" />
                    <asp:Label ID="MsgHead" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <div class="headTable">
                    �Ѵ���ç���
                </div>
                <div class="spaceDiv"></div>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="view" runat="server">
                        <div id="Div1" class="TableSearch">
                            <div class="SearchTable">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">�����ç���</span>
                                </div>
                                <div class="spaceDiv"></div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span id="lblSearchYear" runat="server" class="spantxt">�ա���֡�� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchYear" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearchYear_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%--<div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">���ط�� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearch2" Width="500px" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSearch2_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>--%>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ��ѡ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchMainDept" Width="500px" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSearchMainDept_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ�ͧ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchMainSubDept" Width="500px" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSearchMainSubDept_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList ID="ddlSearchDept" CssClass="ddlSearch" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearchDept_SelectedIndexChanged" Width="500px">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">����Ѻ�Դ�ͺ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList ID="ddlSearchEmp" CssClass="ddlSearch" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearchEmp_SelectedIndexChanged" Width="350px">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">�Ӥ��� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:TextBox CssClass="txtSearch" ID="txtSearch" runat="server" Width="322px"></asp:TextBox><asp:Button
                                            CssClass="btSearch" onmouseover="SearchBt(this,'btSearchOver');" onmouseout="SearchBt(this,'btSearch');"
                                            ID="btSearch" runat="server" OnClick="btSearch_Click" ToolTip="�������ͤ���" Text="  " />
                                    </div>
                                </div>
                                <div class="clear"></div>
                                <div class="spaceDiv"></div>
                                <div class="SearchTotal">
                                    <span class="spantxt">�ӹǹ��辺 : </span><span id="lblSearchTotal" class="spantxt"
                                        style="color: Black;" runat="server"></span>&nbsp;<span class="spantxt">��¡��</span>
                                </div>
                                <div class="spaceDiv"></div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                            <div id="divbtAdd" class="btAddDiv">
                                <asp:Button ID="btAdd" CssClass="btAdd" runat="server" OnClientClick="AddItem();"
                                    Text="       ���ҧ�ç�������" ToolTip="���ҧ�ç�������" />
                            </div>
                            <div class="ckSign">
                                <asp:CheckBox ID="cbNotSign" runat="server" Text=" ���͡�����§ҹ�������ǹ�繪���" />
                                <asp:CheckBox ID="cbNotLogo" runat="server" Text=" ���͡�����§ҹ����ʴ�����" />
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                        <div class="clear"></div>
                        <div class="spaceDiv"></div>
                        <div class="gridViewDiv">
                            <Control:DataGridView ID="GridView1" runat="server" ShowFooter="true" PageSize="50">
                                <Columns>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="3%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="ʶҹ�">
                                        <ItemTemplate>
                                            <%# GetstatusIsApprove(Eval("ProjectsCode"), Eval("IsWait")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="͹��ѵ�" Visible="false">
                                        <ItemTemplate>
                                            <%# statusIsApprove(Eval("IsApprove")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="����¹ ��.">
                                        <ItemTemplate>
                                            <%# Eval("ProjectRegistration").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        <FooterTemplate>
                                            ��� :
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="13pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�����ç���">
                                        <ItemTemplate>
                                            <%# checkedit(Eval("ProjectsCode").ToString(), Eval("EmpID").ToString(), Eval("ProjectsName").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="17%" />
                                        <FooterTemplate>
                                            ��� :
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="13pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="������ҳ">
                                        <ItemTemplate>
                                            <%# GetBudget(Eval("ProjectsCode").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                        <FooterTemplate>
                                            <%# GetTotalBudget().ToString("N2")%>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="13pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:BoundField HeaderText="������ҧ" DataField="EmpName">
                                        <ItemStyle Width="13%" HorizontalAlign="Left" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:BoundField>
                                    <Control:BoundField HeaderText="˹��§ҹ" DataField="DeptName">
                                        <ItemStyle Width="12%" HorizontalAlign="Left" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:BoundField>
                                    <Control:TemplateField HeaderText="㺤Ӣ�1">
                                        <ItemTemplate>
                                            <a href="javascript:;" <%# new BTC().getLinkReportWEP("W") %> onclick="printRpt(12,'w','<%#Eval("ProjectsCode")%>');">
                                                <img style="border: 0; cursor: pointer;" title="���¡��㺤Ӣ��ç��� �ʴ��Ԩ���� Ẻ�͡��� Word" src="../Image/WordIcon.png" /></a>
                                            <a href="javascript:;" <%# new BTC().getLinkReportWEP("E") %> onclick="printRpt(12,'e','<%#Eval("ProjectsCode")%>');">
                                                <img style="border: 0; cursor: pointer;" title="���¡��㺤Ӣ��ç��� �ʴ��Ԩ���� Ẻ�͡��� Excel" src="../Image/Excel.png" /></a>
                                            <a href="javascript:;" <%# new BTC().getLinkReportWEP("P") %> onclick="printRpt(12,'p','<%#Eval("ProjectsCode")%>');">
                                                <img style="border: 0; cursor: pointer;" title="���¡��㺤Ӣ��ç��� �ʴ��Ԩ���� Ẻ�͡��� PDF" src="../Image/PdfIcon.png" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="㺤Ӣ�2" HeaderToolTip="㺤Ӣͷ�� 2" Visible="false">
                                        <ItemTemplate>
                                            <a href="javascript:;" <%# new BTC().getLinkReportWEP("W") %> onclick="printRpt(56,'w','<%#Eval("ProjectsCode")%>');">
                                                <img style="border: 0; cursor: pointer;" title="���¡��㺤Ӣ��ç��� �ʴ���¡�ä������µ���Ԩ���� Ẻ�͡��� Word" src="../Image/WordIcon.png" /></a>
                                            <a href="javascript:;" <%# new BTC().getLinkReportWEP("E") %> onclick="printRpt(56,'e','<%#Eval("ProjectsCode")%>');">
                                                <img style="border: 0; cursor: pointer;" title="���¡��㺤Ӣ��ç��� �ʴ���¡�ä������µ���Ԩ���� Ẻ�͡��� Excel" src="../Image/Excel.png" /></a>
                                            <a href="javascript:;" <%# new BTC().getLinkReportWEP("P") %> onclick="printRpt(56,'p','<%#Eval("ProjectsCode")%>');">
                                                <img style="border: 0; cursor: pointer;" title="���¡��㺤Ӣ��ç��� �ʴ���¡�ä������µ���Ԩ���� Ẻ�͡��� PDF" src="../Image/PdfIcon.png" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <%# checkedit(Eval("ProjectsCode").ToString(), Eval("EmpID").ToString(), "")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="4%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="ź">
                                        <ItemTemplate>
                                            <%# checkdelete(Eval("ProjectsCode").ToString(), Eval("EmpID").ToString(), Eval("IsApprove"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="4%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ӵ��">
                                        <ItemTemplate>
                                            <%# checkGoto(Eval("ProjectsCode").ToString(), Eval("EmpID").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="12pt"
                                            BackColor="#cecece" BorderStyle="Solid" BorderColor="gray" BorderWidth="2" />
                                    </Control:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" />
                            </Control:DataGridView>
                            <div class="footerTotal" style="display:none;">
                                ���������ҳ������ : <span id="ToltalBudget" class="lblTotal1" runat="server"></span>�ҷ
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </asp:View>
                    <asp:View ID="edit" runat="server">
                        <div id="table1" class="PageManageDiv">
                            <div class="inputrowH" Visible="false" runat="server">
                                <div class="divF_Head">
                                    <span id="lblYear" runat="server" class="spantxt">�ա���֡�� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlYearS" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlYearS_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div id="divProjectRegistration" class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <span class="spantxt">����¹�ç��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:Label ID="txtProjectRegistration" runat="server" Text=""></asp:Label>
                                    <%--<asp:TextBox CssClass="txtBoxL" ID="txtProjectRegistration" runat="server" MaxLength="20" Width="200px"></asp:TextBox>--%>
                                    <%--<span class="ColorRed">*</span> <span id="ErrorProjectRegistration" class="ErrorMsg">��سһ�͹����¹�ç���</span>--%>
                                </div>
                            </div>
                            <div class="inputrowH"  Visible="false" runat="server">
                                <div class="divF_Head">
                                    <span class="spantxt">IO Code : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtIOCode" runat="server" MaxLength="20" Width="200px"></asp:TextBox>
                                    <%--<span class="ColorRed">*</span><span id="ErrorIOCode" class="ErrorMsg">��سһ�͹ IO Code</span>--%>
                                    <span class="spantxt">UL Code : </span>
                                    <asp:TextBox CssClass="txtBoxL" ID="txtULCode" runat="server" MaxLength="20" Width="200px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�����ç��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtProjects" runat="server" MaxLength="300" Width="600px"></asp:TextBox>
                                    <asp:HiddenField ID="hdfMainSubDeptCode" runat="server" />
                                    <asp:HiddenField ID="hdfIsWait" runat="server" />
                                    <span class="ColorRed">*</span> <span id="ErrorProjects" class="ErrorMsg">��سһ�͹�ç���/�ҹ</span>
                                </div>
                            </div>
                            <div class="inputrowH"  Visible="false" runat="server">
                                <div class="divF_Head">
                                    <span class="spantxt">�������ç��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:RadioButtonList ID="rbtlProjectType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rbtlProjectType_SelectedIndexChanged" RepeatColumns="5"></asp:RadioButtonList>
                                    <asp:RadioButtonList ID="rbtlSubProjectType" runat="server" RepeatColumns="4"></asp:RadioButtonList>
                                </div>
                            </div>
                            <div id="divStrategic" class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                    <asp:Label ID="lblStrategic" CssClass="spantxt" runat="server" Text="�ط���ʵ�� : "></asp:Label>
                                </div>
                                <div class="divB_Head">
                                    <asp:CheckBoxList ID="cblStrategic" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                            <div id="divIdentityName2" class="inputrowH" runat="server" visible="true">
                                <div class="divF_Head">
                                    <%--<asp:Label ID="lblIdentityName2" CssClass="spantxt" runat="server" Text="�ѵ�ѡɳ� : " Visible="false"></asp:Label>--%>
                                    <asp:Label ID="lblIdentityName2" CssClass="spantxt" runat="server" Text="�ط���ʵ�� : " Visible="true"></asp:Label>
                                </div>
                                <div class="divB_Head">
                                    <asp:CheckBoxList ID="cblIdentityName2" runat="server">
                                    </asp:CheckBoxList>
                                    <asp:Label ID="lblErrorIdentityName2" runat="server" Text="��ͧ���͡�ѵ�ѡɳ�" ForeColor="Red" Visible="false"></asp:Label>
                                    <asp:TextBox CssClass="txtBoxL" ID="txtIdentityName2" runat="server" Width="600px" Visible="false"></asp:TextBox>
                                </div>
                            </div>
                            <div id="divIdentityName" class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                    <asp:Label ID="lblIdentityName" CssClass="spantxt" runat="server" Text="�͡�ѡɳ� : " Visible="false"></asp:Label>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtIdentityName" runat="server" Width="600px" Visible="false"></asp:TextBox>
                                </div>
                            </div>
                            <div id="divStrategies" class="inputrowH" runat="server" >
                                <div class="divF_Head">
                                    <span class="spantxt">���ط���дѺͧ��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:CheckBoxList ID="cblStrategies" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cblStrategies_SelectedIndexChanged">
                                    </asp:CheckBoxList>
                                    <asp:Label ID="lblErrorStrategies" runat="server" Text="��ͧ���͡���ط��" ForeColor="Red" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <div id="divCorporateStrategy" class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <span class="spantxt">��Ǫ���Ѵ������ط��ͧ��� KPI : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:CheckBoxList ID="cblCorporateStrategy" runat="server">
                                    </asp:CheckBoxList>
                                    <asp:Label ID="lblErrorCorporateStrategy" runat="server" Text="��ͧ���͡ KPI" ForeColor="Red" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <div runat="server" Visible="false">
                            <div id="divStrategicPlan" class="inputrowH" runat="server" Visible="false">
                                <div class="divF_Head">
                                    <span class="spantxt">��Ǫ���Ѵ�дѺ�ӹѡ KPI : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox ID="txtStrategicPlan" CssClass="txtBoxL txt550" Width="600" MaxLength="700" runat="server" Visible="false"></asp:TextBox>
                                    <%--<span class="ColorRed">*</span>--%> <span id="ErrorStrategicPlan" class="ErrorMsg">��سһ�͹���ط���дѺἹ�ҹ</span>
                                    <asp:DropDownList CssClass="ddl" ID="ddlStrategicPlan" Width="600px" runat="server" Visible="false">
                                    </asp:DropDownList>
                                    <asp:CheckBoxList ID="cblStrategicPlan" runat="server">
                                    </asp:CheckBoxList>
                                    <asp:Label ID="lblErrorStrategicPlan" runat="server" Text="��ͧ���͡��Ǫ���Ѵ�дѺ�ӹѡ KPI" ForeColor="Red" Visible="false"></asp:Label>
                                </div>
                            </div>
                           </div>
                            <div id="divStrategicObjectives" class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <asp:Label ID="lblStrategicObjectives" CssClass="spantxt" runat="server" Text="�ѵ�ػ��ʧ���ԧ���ط�� :  " Visible="false"></asp:Label>
                                </div>
                                <div class="divB_Head">
                                    <asp:CheckBoxList ID="cblStrategicObjectives" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                            <div id="divStandardNation" class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <asp:Label ID="lblStandardNation" CssClass="spantxt" runat="server" Text="�ҵðҹ����֡�Ҫҵ� : " Visible="false"></asp:Label>
                                </div>
                                <div class="divB_Head">
                                    <asp:CheckBoxList ID="cblStandardNation" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                            <div id="divStandardMinistry" class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <asp:Label ID="lblStandardMinistry" CssClass="spantxt" runat="server" Text="�ҵðҹ�������з�ǧ : " Visible="false"></asp:Label>
                                </div>
                                <div class="divB_Head">
                                    <asp:CheckBoxList ID="cblStandardMinistry" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="inputrowH">
                                    <div class="divF_Head">
                                        <span class="spantxt">���͢��¤���������� : </span>
                                    </div>
                                    <div class="divB_Head">
                                            <asp:CheckBox id="cblInternal" runat="server" Text=" ���� (�к�)" AutoPostBack="true" OnCheckedChanged="cblInternal_CheckedChanged"></asp:CheckBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox id="txtInternal" runat="server" Visible="false"></asp:TextBox>
                                            </br>
                                            <asp:CheckBox id="cblExternal" runat="server" Text=" ��¹͡ (�к�)" AutoPostBack="true" OnCheckedChanged="cblExternal_CheckedChanged"></asp:CheckBox>&nbsp;&nbsp;
                                            <asp:TextBox id="txtExternal" runat="server" Visible="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="inputrowH">
                                    <div class="divF_Head">
                                        <span class="spantxt">������ҳ (�ҷ) : </span>
                                    </div>
                                    <div class="divB_Head">
                                        <asp:TextBox CssClass="txtBoxL" ID="TextBox1" runat="server" Width="600px"
                                            TextMode="MultiLine" Height="80px"></asp:TextBox>
                                        <span class="ColorRed">*</span> <span id="" class="ErrorMsg">��سһ�͹��ѡ�������˵ؼ�</span>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="inputrowH">
                                    <div class="divF_Head">
                                        <span class="spantxt">��ѡ�������˵ؼ� : </span>
                                    </div>
                                    <div class="divB_Head">
                                        <asp:TextBox CssClass="txtBoxL" ID="txtProjectsDetail" runat="server" Width="600px"
                                            TextMode="MultiLine" Height="80px"></asp:TextBox>
                                        <span class="ColorRed">*</span> <span id="ErrorProjectsDetail" class="ErrorMsg">��سһ�͹��ѡ�������˵ؼ�</span>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ѵ�ػ��ʧ�� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtPurpose" runat="server" Width="600px" TextMode="MultiLine"
                                        Height="80px"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorPurpose" class="ErrorMsg">��سһ�͹�ѵ�ػ��ʧ��</span>
                                    <div class="inputrowH" style="display: none;">
                                        <div class="divF_Head" style="width: 10%;">
                                            <span class="spantxt">�ż�Ե (outputs)</span>
                                        </div>
                                        <div class="divB_Head">
                                        </div>
                                    </div>
                                    <div class="inputrowH" style="display: none;">
                                        <div class="divF_Head" style="width: 10%;">
                                            <span class="spantxt">���Ѿ�� (outcomes)</span>
                                        </div>
                                        <div class="divB_Head">
                                            <asp:TextBox CssClass="txtBoxL" ID="txtPurpose2" runat="server" Width="500px" TextMode="MultiLine"
                                                Height="100px"></asp:TextBox>
                                            <span class="ColorRed">*</span> <span id="ErrorPurpose2" class="ErrorMsg">��سһ�͹�ѵ�ػ��ʧ��</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="inputrowH">
                                <div class="inputrowH">
                                    <div class="divF_Head">
                                        <span class="spantxt">������������ : </span>
                                    </div>
                                    <div class="divB_Head">
                                        <asp:TextBox CssClass="txtBoxL" ID="txtTargetGroup" runat="server" Width="600px"
                                            TextMode="MultiLine" Height="80px" MaxLength="300"></asp:TextBox>
                                        <span class="ColorRed">*</span> <span id="" class="ErrorMsg">��سһ�͹������������</span>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH" style="display:none;">
                                <div class="divF_Head">
                                    <span class="spantxt">��Ǫ���Ѵ / ������� / ����Ѵ��л����Թ�Ť�������� : </span>
                                </div>
                                <div class="divB_Head">
                                    <div class="inputrowH">
                                        <div class="divF_Head" style="width: 10%;">
                                            <span class="spantxt">�ԧ����ҳ</span>
                                        </div>
                                        <div class="divB_Head">
                                            <asp:TextBox CssClass="txtBoxL" ID="txtTarget" runat="server" Width="500px" TextMode="MultiLine"
                                                Height="100px"></asp:TextBox>
                                            <span class="ColorRed">*</span> <span id="ErrorTarget" class="ErrorMsg">��سһ�͹��������ԧ����ҳ</span>
                                        </div>
                                    </div>
                                    <div class="inputrowH">
                                        <div class="divF_Head" style="width: 10%;">
                                            <span class="spantxt">�ԧ�س�Ҿ</span>
                                        </div>
                                        <div class="divB_Head">
                                            <asp:TextBox CssClass="txtBoxL" ID="txtTarget2" runat="server" Width="500px" TextMode="MultiLine"
                                                Height="100px"></asp:TextBox>
                                            <span class="ColorRed">*</span> <span id="ErrorTarget2" class="ErrorMsg">��سһ�͹��������ԧ�س�Ҿ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH" style="display:none;">
                                <div class="inputrowH">
                                    <div class="divF_Head">
                                        <span class="spantxt">����ͧ��ͷ���� : </span>
                                    </div>
                                    <div class="divB_Head">
                                        <asp:TextBox CssClass="txtBoxL" ID="txtEvaTool" runat="server" Width="600px"
                                            TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�������Ҵ��Թ�ҹ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtPeriod1" runat="server" Width="600px"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorPeriod1" class="ErrorMsg">��سһ�͹��������</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ѹ�����Թ�ҹ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList ID="ddlSDay" CssClass="ddl" runat="server">
                                    </asp:DropDownList>
                                    /
                                <asp:DropDownList ID="ddlSMonth" CssClass="ddl" runat="server">
                                </asp:DropDownList>
                                    /
                                <asp:DropDownList ID="ddlSYear" CssClass="ddl" runat="server">
                                </asp:DropDownList>
                                    <asp:TextBox ID="txtSDay" CssClass="txtBoxnone" onkeypress="return false" runat="server"></asp:TextBox>
                                    <span class="spantxt">�֧�ѹ���</span>
                                    <asp:DropDownList ID="ddlEDay" CssClass="ddl" runat="server">
                                    </asp:DropDownList>
                                    /
                                <asp:DropDownList ID="ddlEMonth" CssClass="ddl" runat="server">
                                </asp:DropDownList>
                                    /
                                <asp:DropDownList ID="ddlEYear" CssClass="ddl" runat="server">
                                </asp:DropDownList>
                                    <asp:TextBox ID="txtEDay" CssClass="txtBoxnone" onkeypress="return false" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <span class="spantxt">�Է�ҡ� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtLecturer" runat="server" Width="600px" TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="" class="ErrorMsg">��سһ�͹�Է�ҡ�</span>
                                </div>
                            </div>
                            <div class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <span class="spantxt">��Ǣ�͡�èѴ�֡ͺ�� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtTopics" runat="server" Width="600px" TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="" class="ErrorMsg">��سһ�͹��Ǣ�͡�èѴ�֡ͺ��</span>
                                </div>
                            </div>
                            <div class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                    <span class="spantxt">ʶҹ�����Թ�ҹ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtPlace" runat="server" Width="600px"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorPlace" class="ErrorMsg">��سһ�͹ʶҹ�����Թ�ҹ</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <%--<span class="spantxt">����Ѻ�Դ�ͺ�ç��� : </span>--%>
                                    <asp:TextBox ID="spnResponsibleName" CssClass="txtBoxlblnone2" Width="200px" AutoPostBack="true" OnTextChanged="spnResponsibleName_TextChanged" runat="server"></asp:TextBox><span class="spantxt"> : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:HiddenField ID="hdfCreateUser" runat="server" />
                                    <asp:TextBox CssClass="txtBoxL" ID="txtResponsibleName" runat="server" Width="250px"></asp:TextBox>
                                    <span class="spantxt">���˹� : </span>
                                    <asp:TextBox CssClass="txtBoxL" ID="txtResponsiblePosition" runat="server" Width="270px"></asp:TextBox>
                                    <span class="ColorRed">*</span><span id="ErrorResponsible" class="ErrorMsg">��سһ�͹�����ż���Ѻ�Դ�ͺ�ç���</span>
                                </div>
                            </div>
                            <div class="inputrowH" runat="server">
                                <div class="divF_Head">
                                    <span class="spantxt">�ŷ��Ҵ��Ҩ����Ѻ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtExpectedResults" runat="server" Width="600px" TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="" class="ErrorMsg">��سһ�͹�ŷ��Ҵ��Ҩ����Ѻ</span>
                                </div>
                            </div>
                            <div class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlDept" runat="server" Width="330" AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="ColorRed">*</span> <span id="ErrorDepartment" class="ErrorMsg">��س����͡˹��§ҹ</span>
                                </div>
                            </div>
                            <div class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ�������Ǣ�ͧ :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlDeptJoin" runat="server" Width="330">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                    <span class="spantxt">�ӴѺ��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxNum" ID="txtSort" runat="server" onkeypress="return KeyNumber(event);"
                                        Width="50px"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorSort" class="ErrorMsg">��سһ�͹�ӴѺ���</span>
                                </div>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <asp:Label ID="lblCreate" runat="server" CssClass="spantxt4"></asp:Label>&nbsp;<asp:LinkButton ID="lbtEditCreate" runat="server" Visible="false" OnClick="lbtEditCreate_Click">���</asp:LinkButton>
                            </div>
                            <div id="divSearchCreateUser" runat="server" class="centerDiv" style="min-height: 25px;" visible="false">
                                <asp:TextBox ID="txtSearchCreateUser" CssClass="txtSearch" runat="server" Width="200"></asp:TextBox><asp:Button CssClass="btSearch" onmouseover="SearchBt(this,'btSearchOver');" onmouseout="SearchBt(this,'btSearch');"
                                    ID="btSearchCreateUser" runat="server" OnClick="btSearchCreateUser_Click" ToolTip="�������ͤ���" Text="  " />
                            </div>
                            <div id="divddlCreateUser" runat="server" class="centerDiv" style="min-height: 30px;" visible="false">
                                <asp:DropDownList ID="ddlCreateUser" CssClass="ddl" runat="server"></asp:DropDownList><span id="ErrorCreateUser" class="ErrorMsg">���͡����Ѻ�Դ�ͺ�ç���</span>
                            </div>
                            <div id="divbtnEditCreate" runat="server" class="centerDiv" style="min-height: 25px;" visible="false">
                                <asp:Button ID="btnEditCreate" runat="server" Text="�ѹ�֡" OnClientClick="return Cktxt2(1);" OnClick="btnEditCreate_Click" /><asp:Button ID="btnCancelCreate" runat="server" Text="¡��ԡ" OnClick="btnCancelCreate_Click" />
                            </div>
                            <div class="centerDiv">
                                <asp:Label ID="lblUpdate" runat="server" CssClass="spantxt4"></asp:Label>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <asp:Label ID="lblApprove" runat="server" CssClass="spantxt4"></asp:Label><br />
                                <asp:Label ID="lblComment" runat="server" CssClass="spantxt4"></asp:Label>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <div class="classButton">
                                    <div class="classBtSave">
                                        <asp:Button ID="btSave" CssClass="btYes" runat="server" Text="       �ѹ�֡" OnClick="btSave_Click"
                                            OnClientClick="return Cktxt(1, 3);" ToolTip="�ѹ�֡�ç��ù��" />
                                        <asp:Button ID="btSaveAgain" CssClass="btYesToo" runat="server" Text="       �ѹ�֡������ҧ�ç�������"
                                            OnClick="btSaveAgain_Click" OnClientClick="return Cktxt(1, 3);" ToolTip="�ѹ�֡�ç��ù��������ҧ�ç�������" />
                                        <asp:Button ID="btSaveAndGo" CssClass="btYesAndGo" runat="server" Text="       �ѹ�֡������ҧ�Ԩ�������"
                                            OnClick="btSaveAndGo_Click" OnClientClick="return Cktxt(1, 3);" ToolTip="�ѹ�֡�ç��ù��������ҧ�Ԩ�������" />
                                    </div>
                                    <div class="classBtCancel">
                                        <input type="button" class="btNo" value="      ���ѹ�֡" title="���ѹ�֡�ç��ù��" onclick="Cancel();" />
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                            <div class="gridViewDiv">
                                <Control:DataGridView ID="GridView2" runat="server" Visible="false">
                                    <Columns>
                                        <Control:TemplateField HeaderText="�ӴѺ���">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        </Control:TemplateField>
                                        <Control:BoundField HeaderText="�����ç���" DataField="ProjectsName">
                                            <ItemStyle Width="80%" HorizontalAlign="Left" />
                                        </Control:BoundField>
                                        <%--<Control:BoundField HeaderText="������ҳ" DataField="TotalAmount" DataFormatString="{0:n2}">
                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                        </Control:BoundField>--%>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" />
                                </Control:DataGridView>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                            <div class="spaceDiv"></div>
                            <div id="divApprove" class="TableSearch" runat="server" visible="false">
                                <div class="SearchTable" style="width:1000px;">
                                    <div class="SearchHead">
                                        <span class="spantxt2 spansize14">ŧ��� / ͹��ѵ��ç���</span>
                                    </div>
                                    <div class="spaceDiv"></div>
                                    <Control:DataGridView ID="gridApproveFlow" runat="server">
                                        <Columns>
                                            <Control:TemplateField HeaderText="���">
                                                <ItemTemplate>
                                                    <%# Eval("StepNo").ToString() %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="2%" />
                                            </Control:TemplateField>
                                            <Control:TemplateField HeaderText="˹�ҷ���Ѻ�Դ�ͺ">
                                                <ItemTemplate>
                                                    <%# Eval("ApproveStepName").ToString() %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="30%" />
                                            </Control:TemplateField>
                                            <Control:TemplateField HeaderText="����Ѻ�Դ�ͺ">
                                                <ItemTemplate>
                                                    <%# Eval("EmpName").ToString() %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                                            </Control:TemplateField>
                                            <Control:TemplateField HeaderText="���˹�">
                                                <ItemTemplate>
                                                    <%# Eval("ApprovePositionName").ToString() %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                                            </Control:TemplateField>
                                            <Control:TemplateField HeaderText="ʶҹ�">
                                                <ItemTemplate>
                                                    <%# statusIsApprove(Eval("IsApprove2")) %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            </Control:TemplateField>
                                            <Control:TemplateField HeaderText="�ѹ���͹��ѵ�">
                                                <ItemTemplate>
                                                    <%# DateIsApprove(Eval("CreateDate")) %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                            </Control:TemplateField>
                                            <Control:TemplateField HeaderText="�����Դ���">
                                                <ItemTemplate>
                                                    <span style="font-size:12px;"><%# strComment(Eval("Comment")) %></span>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="13%" />
                                            </Control:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Right" />
                                    </Control:DataGridView>
                                    <div class="spaceDiv"></div>
                                    <div class="centerDiv">
                                        <div id="divBtApprove" class="classButton2" runat="server" visible="false">
                                            <asp:TextBox ID="txtComment" TextMode="MultiLine" Height="50" Width="300" placeholder="ŧ�����Դ���" runat="server"></asp:TextBox>
                                            <span id="ErrorComment" class="ErrorMsg">* ��سһ�͹��ͤԴ���</span>
                                            <div class="spaceDiv"></div>
                                            <span>���ʼ�ҹ : </span><asp:TextBox ID="txtPassword" CssClass="txtBoxL" Width="150" TextMode="Password" placeholder="���ʼ�ҹ" runat="server"></asp:TextBox> <asp:Label ID="lblErrorPassword" runat="server" Visible="false" Text="���ʼ�ҹ���١��ͧ" ForeColor="Red"></asp:Label>
                                            <div class="spaceDiv"></div>
                                            <span id="lblHeadDept" runat="server" visible="false">���͡���͹��ѵ� : </span><asp:DropDownList ID="ddlHeadDept" CssClass="ddl" runat="server" Visible="false"></asp:DropDownList><asp:Label ID="lblErrorHeadDept" runat="server" Visible="false" Text="��س����͡���͹��ѵ�" ForeColor="Red"></asp:Label>
                                            <div class="spaceDiv"></div>
                                            <div class="classBtWait">
                                                <asp:Button ID="btApprove" CssClass="btApproveProject" runat="server" Text="     ͹��ѵ�" OnClick="btApprove_Click"
                                                    OnClientClick="return Cktxt(1, 1);" ToolTip="͹��ѵ��ç���" />
                                                <asp:Button ID="btWait" CssClass="btWaitProject" runat="server" Text="      �͢������������/��Ѻ���" OnClick="btWait_Click"
                                                    OnClientClick="return Cktxt(1, 2);" ToolTip="�͢������������/��Ѻ���" />
                                                <asp:Button ID="btUnApprove" CssClass="btUnApproveProject" runat="server" Text="     ���͹��ѵ�" OnClick="btUnApprove_Click"
                                                    OnClientClick="return Cktxt(1, 0);" ToolTip="���͹��ѵ��ç���" />
                                            </div>
                                            <div class="spaceDiv"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </asp:View>
                </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
