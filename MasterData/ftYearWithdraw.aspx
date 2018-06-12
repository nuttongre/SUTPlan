<%@ Page Language="C#" MasterPageFile="~/Master/MasterOriginal.master" AutoEventWireup="true"
    CodeFile="ftYearWithdraw.aspx.cs" Inherits="ftYearWithdraw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../CSS/fileupload.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function Withdraw(id) {
            location.href = "ftYearWithdraw.aspx?mode=7&mid=" + Request("mid") + "&id=" + id;
        }
        function View2(id) {
            location.href = "ftYearWithdraw.aspx?mode=5&mid=" + id;
        }
        function Cancel() {
            if ((Request("mode") == "1") || (Request("mode") == "2")) {
                location.href = "ftYearWithdraw.aspx";
            }
            else {
                if ((Request("mode") == "6") || (Request("mode") == "7")) {
                    location.href = "ftYearWithdraw.aspx?mode=5&mid=" + Request("mid");
                }
                else {
                    location.href = "ftYearWithdraw.aspx";
                }
            }
        }
        function printRpt(mode, type) {
            var yearb = $get("<%=ddlSearchStudyYear2.ClientID%>").value;
            var term = $get("<%=ddlSearchStudyYear2.ClientID%>").value;
            window.open('../GtReport/Viewer.aspx?rpt=64&rpttype=' + type + '&bgyear=' + yearb + '&term=' + term + '&mid=' + Request("mid"));
        }
        function printRpt2(mode, type) {
            var yearb = $get("<%=ddlSearchYear.ClientID%>").value;
            var deptid = $get("<%=ddlSearchDept.ClientID%>").value;
            window.open('../GtReport/Viewer.aspx?rpt=65&rpttype=' + type + '&yearB=' + yearb + '&deptid=' + deptid);
        }
        function Cktxt(m) {
            var ck = 0;
            var ddlTerm = $get("<%=ddlTerm.ClientID%>");
            var ErrorTerm = $get("ErrorTerm");

            //ck += ckDdlNull(m, ddlTerm, ErrorTerm);

            if (ck > 0) {
                return false;
            }
            else {
                return true;
            }
        }
        function Cktxt2(m) {
            var ck = 0;
            var ddlClass = $get("<%=ddlClass.ClientID%>");
            var ErrorClass = $get("ErrorClass");
            var ddlftYearBudgetType = $get("<%=ddlftYearBudgetType.ClientID%>");
            var ErrorftYearBudgetType = $get("ErrorftYearBudgetType");
            var ddlftYearBudgetTypeDetail = $get("<%=ddlftYearBudgetTypeDetail.ClientID%>");
            var ErrorftYearBudgetTypeDetail = $get("ErrorftYearBudgetTypeDetail");

            ck += ckDdlNull(m, ddlftYearBudgetTypeDetail, ErrorftYearBudgetTypeDetail);
            ck += ckDdlNull(m, ddlftYearBudgetType, ErrorftYearBudgetType);
            ck += ckDdlNull(m, ddlClass, ErrorClass);

            if (ck > 0) {
                return false;
            }
            else {
                return true;
            }
        }
        function SumTotal() {
            var txtAmount = $get("<%=txtAmount2.ClientID%>").value.replace(/,/g, '');
            var txtPrice = $get("<%=txtPrice2.ClientID%>").value.replace(/,/g, '');
            $get("<%=lblTotalAmount2.ClientID%>").innerHTML = (parseInt(txtAmount) * parseFloat(txtPrice)).comma();
        }
        function AttDel(id, obj) {
            if (confirm('��ͧ���ź��¡�ù�� ���������')) {
                $.getJSON("ftYearWithdraw.aspx?opt=delAtt&attID=" + id, function (response) {
                    if ($(obj).parent().length == 1) {
                        $(obj).parent().parent().closest("div").remove();
                    }
                });
            }
        }
        function ValidateAttachFile(mode) {
            var attName;
            if (mode == 5) {
                attName = $get("<%=fpAttach2.ClientID%>").value;
            }
            else {
                if (mode == 7) {
                    attName = $get("<%=fpAttach.ClientID%>").value;
                }
            }
            if (attName == "") {
                alert("��س����͡���");
                return false;
            }
            else {
                return true;
            }
        }
        function SumGridTotal() {
            var Total = 0;
            var TotalDiff = 0;
            var grid = $get("<%=GridSubsidy.ClientID %>");
            for (var i = 0; i < grid.rows.length - 2; i++) {
                var txtT = $get("txtMoney" + i).value.replace(/,/g, '');

                Total = Total + parseFloat(txtT);

            }
            $get("txtTotalMoney").innerHTML = Total.comma();
            $get("hdfTotalMoney").value = Total.comma();

            var BudgetType = $get("<%=ddlftYearBudgetType.ClientID %>").value;
            if (BudgetType == 1) {
                $get("<%=txtAmount2.ClientID%>").value = "1";
                $get("<%=txtPrice2.ClientID%>").value = Total.comma().toString();
                SumTotal();

                $get("<%=txtAmount2.ClientID%>").disabled = "disabled";
                $get("<%=txtPrice2.ClientID%>").disabled = "disabled";
            }
        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="pageDiv">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="warningDiv">
                    <asp:Image ID="Img1" runat="server" Visible="false" />
                    <asp:Label ID="MsgHead" runat="server" Text="" Visible="false"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="headTable">
            �ѹ�֡������Թ���¹��� 15 ��
        </div>
        <div class="spaceDiv"></div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="view" runat="server">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="Div1" class="TableSearch">
                            <div class="SearchTable">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">������� / �ա���֡��</span>
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
                                        <span class="spantxt">�Ӥ��� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:TextBox CssClass="txtSearch txt300" ID="txtSearch" runat="server"></asp:TextBox><asp:Button
                                            CssClass="btSearch" onmouseover="SearchBt(this,'btSearchOver');" onmouseout="SearchBt(this,'btSearch');"
                                            ID="btSearch" runat="server" OnClick="btSearch_Click" ToolTip="�������ͤ���" Text="  " />
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">������͡��§ҹ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <a href="javascript:;" onclick="printRpt2(0,'p');">
                                            <img style="border: 0; cursor: pointer; vertical-align: top;" width="45px;" height="45px;" title="���¡����§ҹ Ẻ�͡��� PDF" src="../Image/icon/PdfIcon.png" /></a>
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
                        </div>
                        <div class="clear"></div>
                        <div class="spaceDiv"></div>
                        <div class="gridViewDiv">
                            <Control:DataGridView ID="GridView1" runat="server">
                                <Columns>
                                    <Control:TemplateField HeaderText="�ӴѺ">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="��� / ��">
                                        <ItemTemplate>
                                            <%# checkedit(Eval("MasterID").ToString(), Eval("Term").ToString() + " / " + Eval("StudyYear").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="˹��§ҹ">
                                        <ItemTemplate>
                                            <%# Eval("DeptName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="˹��§ҹ�ͧ">
                                        <ItemTemplate>
                                            <%# Eval("MainSubDeptName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </Control:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" />
                            </Control:DataGridView>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
            <asp:View ID="edit" runat="server">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div id="table1" class="PageManageDiv">
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlTerm" runat="server">
                                    </asp:DropDownList>&nbsp;<span class="ColorRed">*</span> <span id="ErrorTerm" class="ErrorMsg">��س����͡���</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span id="lblYear" runat="server" class="spantxt">�ա���֡�� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlYearS" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <asp:Label ID="lblCreate" runat="server" CssClass="spantxt4"></asp:Label>
                            </div>
                            <div class="centerDiv">
                                <asp:Label ID="lblUpdate" runat="server" CssClass="spantxt4"></asp:Label>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <asp:Label ID="lblDupicate" runat="server" ForeColor="Red" Text="�����ū��" Visible="false"></asp:Label>
                                <div class="classButton">
                                    <div class="classBtSave">
                                        <asp:Button ID="btSave" CssClass="btYes" runat="server" Text="       �ѹ�֡" OnClick="btSave_Click"
                                            OnClientClick="return Cktxt(0);" ToolTip="�ѹ�֡��õ�駤�ҹ��" />
                                    </div>
                                    <div class="classBtCancel">
                                        <input type="button" class="btNo" value="      ���ѹ�֡" title="���ѹ�֡��õ�駤�ҹ��" onclick="Cancel();" />
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
            <asp:View ID="view2" runat="server">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div id="Div2" class="TableSearch">
                            <div class="SearchTable">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">���Һѹ�֡������Թ���¹��� 15 ��</span>
                                </div>
                                <div class="spaceDiv"></div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">��� / �ա���֡�� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <div style="float: left;">
                                            <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchTerm" runat="server" AutoPostBack="true" Enabled="false"
                                                OnSelectedIndexChanged="ddlSearchTerm_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div style="float: left; padding: 0px 5px 0px 5px;">/ </div>
                                        <div style="float: left;">
                                            <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchStudyYear2" runat="server" AutoPostBack="true" Enabled="false"
                                                OnSelectedIndexChanged="ddlSearchStudyYear2_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">�дѺ��� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchClass" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearchClass_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">�������Թ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchBudgetType" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearchBudgetType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ��ѡ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchMainDept2" Width="500px" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSearchMainDept2_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ�ͧ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchMainSubDept2" Width="500px" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSearchMainSubDept2_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList ID="ddlSearchDept2" CssClass="ddlSearch" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearchDept2_SelectedIndexChanged" Width="500px">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">�Ӥ��� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:TextBox CssClass="txtSearch txt300" ID="txtSearch2" runat="server"></asp:TextBox><asp:Button
                                            CssClass="btSearch" onmouseover="SearchBt(this,'btSearchOver');" onmouseout="SearchBt(this,'btSearch');"
                                            ID="btSearch2" runat="server" OnClick="btSearch2_Click" ToolTip="�������ͤ���" Text="  " />
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">������͡��§ҹ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:Literal ID="linkReport" runat="server"></asp:Literal>
                                    </div>
                                </div>
                                <div class="clear"></div>
                                <div class="spaceDiv"></div>
                                <div class="SearchTotal">
                                    <span class="spantxt">�ӹǹ��辺 : </span><span id="lblSearchTotal2" class="spantxt"
                                        style="color: Black;" runat="server"></span>&nbsp;<span class="spantxt">��¡��</span>
                                </div>
                                <div class="spaceDiv"></div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                            <div class="btAddDiv">
                                <input type="button" class="btNo" value="      ��͹��Ѻ" title="��͹��Ѻ" onclick="Cancel();" />
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="clear"></div>
                <div class="spaceDiv"></div>
                <div class="gridViewDiv">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <Control:DataGridView ID="GridView2" runat="server" ShowFooter="true" PageSize="50">
                                <Columns>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="3%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <%# Eval("ClassName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�������Թ">
                                        <ItemTemplate>
                                            <%# Eval("BudgetTypeName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="11%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="��������������">
                                        <ItemTemplate>
                                            <%# getdtWithDraw(0, Eval("ItemID"), Eval("TotalAmount2"), Eval("BudgetDetailTypeName").ToString(), Eval("BudgetDetailTypeID")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="17%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ʹ¡��">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("SetMoney"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="7%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ӹǹ ��.">
                                        <ItemTemplate>
                                            <%# getStrAmount(Eval("Amount")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�Ҥ�">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("Price"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="5%" />
                                        <FooterTemplate>
                                            ��� : 
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="����Թ">
                                        <ItemTemplate>
                                            <%# GetAmount(Eval("TotalAmount"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                        <FooterTemplate>
                                            <%# GetTotalAmount() %>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���Թ">
                                        <ItemTemplate>
                                            <%# getdtWithDraw(1, Eval("ItemID"), Eval("Amount2"), "", Eval("BudgetDetailTypeID")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ӹǹ ��.">
                                        <ItemTemplate>
                                            <%# getStrAmount(Eval("Amount2")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�Ҥҷ����">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("Price2"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="7%" />
                                        <FooterTemplate>
                                            ��� : 
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="����Թ�����">
                                        <ItemTemplate>
                                            <%# GetAmount2(Eval("TotalAmount2"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                        <FooterTemplate>
                                            <%# GetTotalAmount2() %>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�������">
                                        <ItemTemplate>
                                            <%# GetAmount3(Eval("TotalAmount"), Eval("TotalAmount2"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                        <FooterTemplate>
                                            <%# GetTotalAmount3() %>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" />
                            </Control:DataGridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="clear"></div>
                    <div class="spaceDiv"></div>
                    <div class="TableSearch">
                        <div class="SearchTable">
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <div class="SearchHead">
                                        <span class="spantxt2 spansize14">��ػ�ʹ�Թ��ҡԨ����</span>
                                    </div>
                                    <div class="spaceDiv"></div>
                                    <div class="inputrow" style="display: none;">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�ӹǹ�ѡ���¹��� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 140px; text-align: right;">
                                            <asp:Label ID="lblTotalStudent" runat="server" Font-Bold="true"></asp:Label>
                                            ��
                                        </div>
                                    </div>
                                    <div class="inputrow" style="display: none;">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�Ҥ���� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 150px; text-align: right;">
                                            <asp:Label ID="lblTotalPrice" runat="server" Font-Bold="true"></asp:Label>
                                            �ҷ
                                        </div>
                                    </div>
                                    <div class="inputrow">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�ʹ������/�չ�� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 150px; text-align: right;">
                                            <asp:Label ID="lblSumTotal" runat="server" Font-Bold="true"></asp:Label>
                                            �ҷ
                                        </div>
                                    </div>
                                    <div id="divSetMoneyAcType" runat="server">
                                        <div class="inputrow">
                                            <div class="SearchtxtF">
                                                <span class="spantxt">�ʹ¡�� : </span>
                                            </div>
                                            <div class="SearchF" style="width: 150px; text-align: right;">
                                                <asp:Label ID="lblSetMoneyAcType" runat="server" Text="" Font-Bold="true"></asp:Label>
                                                �ҷ
                                            </div>
                                            <div style="float: left; padding-left: 10px;">
                                                <span style="color: red;">*</span>
                                                <asp:Label ID="lblNoteSetMoneyAcType" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="inputrow">
                                            <div class="SearchtxtF">
                                                <span class="spantxt">�ѹ�֡�ʹ¡�� : </span>
                                            </div>
                                            <div class="SearchF" style="padding-left: 10px;">
                                                <asp:Label ID="lblWithDrawUser" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="inputrow">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�ʹ��������� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 150px; text-align: right;">
                                            <asp:Label ID="lblSumTotalAll" runat="server" Font-Bold="true" Text="0.00"></asp:Label>
                                            �ҷ
                                        </div>
                                    </div>
                                    <div class="inputrow">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�ʹ����� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 150px; text-align: right;">
                                            <asp:Label ID="lblMoneyAcType" runat="server" Font-Bold="true" Text="0.00"></asp:Label>
                                            �ҷ
                                        </div>
                                    </div>
                                    <div class="inputrow">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�ʹ������� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 150px; text-align: right;">
                                            <asp:Label ID="lblTotalBalance" runat="server" Font-Bold="true" Text="0.00"></asp:Label>
                                            �ҷ
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="spaceDiv"></div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">Ṻ��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <img src="../Image/imgIcon.png" title="���͡���" style="float: left; padding-right: 5px; vertical-align: bottom;" />
                                    <asp:FileUpload ID="fpAttach2" runat="server" Width="200px" /><asp:Button ID="btnAttach2" Text="    Ṻ���" CssClass="btAttachFile"
                                        runat="server" OnClientClick="return ValidateAttachFile(5);"
                                        OnClick="btnAttach2_Click" />
                                    <asp:CheckBox ID="cbDuo2" runat="server" Visible="false" Text=" ����� Duo" />
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">���Ṻ : </span>
                                </div>
                                <div class="divB_Head">
                                    <div class="framImg" style="width: 580px;">
                                        <asp:Repeater ID="rptAttach2" runat="server">
                                            <ItemTemplate>
                                                <div class="showSmallImg">
                                                    <div style="margin: 5px auto; width: 65px; height: 50px;">
                                                        <img src="../Image/btnremove.png" onclick="AttDel('<%# Eval("ItemId") %>',this);" class="btnDelImg" alt="ź�Ҿ���" title="ź�Ҿ���" />
                                                        <%# getImgAttatch(Eval("ItemID"), Eval("Title"), Eval("FileType"), Eval("TypeId")) %>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="spaceDiv"></div>
                </div>
                <div class="spaceDiv"></div>
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <div class="gridViewDiv">
                            <Control:DataGridView ID="GridView3" runat="server" ShowFooter="true" PageSize="50">
                                <Columns>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="3%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <%# Eval("ClassName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�������Թ">
                                        <ItemTemplate>
                                            <%# Eval("BudgetTypeName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="11%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="��������������">
                                        <ItemTemplate>
                                            <%# getdtWithDraw(0, Eval("ItemID"), Eval("TotalAmount2"), Eval("BudgetDetailTypeName").ToString(), Eval("BudgetDetailTypeID")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="17%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ʹ¡��">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("SetMoney"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="7%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ӹǹ ��.">
                                        <ItemTemplate>
                                            <%# getStrAmount(Eval("Amount")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�Ҥ�">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("Price"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="5%" />
                                        <FooterTemplate>
                                            ��� : 
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="����Թ">
                                        <ItemTemplate>
                                            <%# GetAmountAc(Eval("TotalAmount"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                        <FooterTemplate>
                                            <%# GetTotalAmountAc() %>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                    <%--<Control:TemplateField HeaderText="���Թ">
                                        <ItemTemplate>
                                            <%# getdtWithDraw(1, Eval("ItemID"), Eval("TotalAmount2"), "", Eval("BudgetDetailTypeID")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>--%>
                                    <%--<Control:TemplateField HeaderText="�ӹǹ ��.">
                                        <ItemTemplate>
                                            <%# getStrAmount(Eval("Amount2")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                    </Control:TemplateField>--%>
                                    <%--<Control:TemplateField HeaderText="�Ҥҷ����">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("Price2"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="7%" />
                                        <FooterTemplate>
                                            ��� : 
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>--%>
                                    <%--<Control:TemplateField HeaderText="����Թ�����">
                                        <ItemTemplate>
                                            <%# GetAmount2Ac(Eval("TotalAmount2"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                        <FooterTemplate>
                                            <%# GetTotalAmount2Ac() %>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>--%>
                                    <Control:TemplateField HeaderText="�������">
                                        <ItemTemplate>
                                            <%# GetAmount3Ac(Eval("TotalAmount"), Eval("TotalAmount2"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="8%" />
                                        <FooterTemplate>
                                            <%# GetTotalAmount3Ac() %>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </Control:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" />
                            </Control:DataGridView>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
            <asp:View ID="edit2" runat="server">
                <div class="PageManageDiv">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">��� / �ա���֡��: </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:Label ID="lblTerm" runat="server"></asp:Label>
                                    / 
                                    <asp:Label ID="lblStudyYear" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�дѺ��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlClass" runat="server" Width="100" Enabled="false">
                                    </asp:DropDownList>&nbsp;<span class="ColorRed">*</span> <span id="ErrorClass" class="ErrorMsg">��س����͡�дѺ���</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�������Թ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlftYearBudgetType" runat="server" Width="250" AutoPostBack="true" Enabled="false" OnSelectedIndexChanged="ddlftYearBudgetType_SelectedIndexChanged">
                                    </asp:DropDownList><span class="ColorRed">*</span> <span id="ErrorftYearBudgetType" class="ErrorMsg">��س����͡�������Թ</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�������������� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlftYearBudgetTypeDetail" runat="server" Enabled="false" Width="250">
                                    </asp:DropDownList><span class="ColorRed">*</span> <span id="ErrorftYearBudgetTypeDetail" class="ErrorMsg">��س����͡��������������</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ʹ¡�� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:Label ID="lblSetBudget" runat="server"></asp:Label>
                                    �ҷ
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ӹǹ�ѡ���¹����� : </span>
                                </div>
                                <div class="divB_Head">
                                    <div style="width: 114px; float: left;">
                                        <asp:Label ID="txtAmount" runat="server"></asp:Label>
                                        ��
                                    </div>
                                    <div style="width: 300px; float: left;">
                                        <span class="spantxt">�ӹǹ�ѡ���¹����� :</span>
                                        <asp:TextBox ID="txtAmount2" runat="server" onkeyup="SumTotal();" onchange="txtComma(this);" onclick="SelecttxtAll(this);" onblur="txtZero(this,0); SumTotal();" onkeypress="return KeyNumber(event);" CssClass="txtBoxNum" Width="100" Text="0"></asp:TextBox>
                                        ��
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�Ҥҷ���� : </span>
                                </div>
                                <div class="divB_Head">
                                    <div style="width: 183px; float: left;">
                                        <asp:Label ID="txtPrice" runat="server"></asp:Label>
                                        �ҷ
                                    </div>
                                    <div style="width: 300px; float: left;">
                                        <span class="spantxt">�Ҥҷ���� : </span>
                                        <asp:TextBox ID="txtPrice2" runat="server" onkeyup="SumTotal();" onchange="txtComma(this);" onclick="SelecttxtAll(this);" onblur="txtZero(this,0); SumTotal();" onkeypress="return KeyNumber(event);" CssClass="txtBoxNum" Width="100" Text="0"></asp:TextBox>
                                        �ҷ
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�Ҥ��������� : </span>
                                </div>
                                <div class="divB_Head">
                                    <div style="width: 156px; float: left;">
                                        <asp:Label ID="lblTotalAmount" runat="server" Text="0"></asp:Label>
                                        �ҷ
                                    </div>
                                    <div style="width: 300px; float: left;">
                                        <span class="spantxt">�Ҥ��������� : </span>
                                        <asp:Label ID="lblTotalAmount2" runat="server" Text="0"></asp:Label>
                                        �ҷ
                                    </div>
                                </div>
                            </div>
                            <div id="divSubsidy" class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                </div>
                                <div class="divB_Head">
                                    <div class="centerDiv">
                                        <Control:DataGridView ID="GridSubsidy" runat="server" PageSize="50" Width="500" ShowFooter="true">
                                            <Columns>
                                                <Control:TemplateField HeaderText="���">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </Control:TemplateField>
                                                <Control:TemplateField HeaderText="��¡��">
                                                    <ItemTemplate>
                                                        <%# Eval("SubsidyName").ToString() %>
                                                        <input id="hdfSubsidyID<%#Container.DataItemIndex %>" name="hdfSubsidyID<%#Container.DataItemIndex %>"
                                                            type="hidden" value="<%#Eval("SubsidyID") %>" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width="80%" />
                                                    <FooterTemplate>
                                                        <b>���</b>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </Control:TemplateField>
                                                <Control:TemplateField HeaderText="�ӹǹ�Թ">
                                                    <ItemTemplate>
                                                        <input id="txtMoney<%#Container.DataItemIndex %>" name="txtMoney<%#Container.DataItemIndex %>"
                                                            type="text" class="txtBoxNum txt100" value="<%#Eval("Money") %>" onkeyup="SumGridTotal();"
                                                            onchange="txtComma(this);" onkeypress="return KeyNumber(event);"
                                                            onclick="SelecttxtAll(this);" onblur="txtZero(this,0); SumGridTotal();" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                    <FooterTemplate>
                                                        <span id="txtTotalMoney"></span>
                                                        <input id="hdfTotalMoney" name="hdfTotalMoney" type="hidden" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </Control:TemplateField>
                                                <Control:TemplateField HeaderText="˹���">
                                                    <ItemTemplate>
                                                        �ҷ
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    <FooterTemplate>
                                                        <b>�ҷ</b>
                                                    </FooterTemplate>
                                                </Control:TemplateField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Right" />
                                        </Control:DataGridView>
                                    </div>
                                </div>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <asp:Label ID="lblCreate2" runat="server" CssClass="spantxt4"></asp:Label>
                            </div>
                            <div class="centerDiv">
                                <asp:Label ID="lblUpdate2" runat="server" CssClass="spantxt4"></asp:Label>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <asp:Label ID="lblDupicate2" runat="server" ForeColor="Red" Text="�����ū��" Visible="false"></asp:Label>
                                <div class="classButton">
                                    <div class="classBtSave">
                                        <asp:Button ID="btSave2" CssClass="btYes" runat="server" Text="       �ѹ�֡" OnClick="btSave2_Click"
                                            OnClientClick="return Cktxt2(0);" ToolTip="�ѹ�֡��õ�駤�ҹ��" />
                                        <asp:Button ID="btSaveAgain" CssClass="btYesToo" runat="server" Text="       �ѹ�֡��е�駤������"
                                            OnClick="btSaveAgain_Click" OnClientClick="return Cktxt2(0);" ToolTip="�ѹ�֡��е�駤������" />
                                    </div>
                                    <div class="classBtCancel">
                                        <input type="button" class="btNo" value="      ���ѹ�֡" title="���ѹ�֡��õ�駤�ҹ��" onclick="Cancel();" />
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="clear"></div>
                    <div class="inputrowH">
                        <div class="divF_Head">
                            <span class="spantxt">Ṻ��� : </span>
                        </div>
                        <div class="divB_Head">
                            <img src="../Image/imgIcon.png" title="���͡���" style="float: left; padding-right: 5px; vertical-align: bottom;" />
                            <asp:FileUpload ID="fpAttach" runat="server" Width="200px" /><asp:Button ID="btnAttach" Text="    Ṻ���" CssClass="btAttachFile"
                                runat="server" OnClientClick="return ValidateAttachFile(7);"
                                OnClick="btnAttach_Click" />
                            <asp:CheckBox ID="cbDuo" runat="server" Visible="false" Text=" ����� Duo" />
                        </div>
                    </div>
                    <div class="inputrowH">
                        <div class="divF_Head">
                            <span class="spantxt">���Ṻ : </span>
                        </div>
                        <div class="divB_Head">
                            <div class="framImg">
                                <asp:Repeater ID="rptAttach" runat="server">
                                    <ItemTemplate>
                                        <div class="showSmallImg">
                                            <div style="margin: 5px auto; width: 65px; height: 50px;">
                                                <img src="../Image/btnremove.png" onclick="AttDel('<%# Eval("ItemId") %>',this);" class="btnDelImg" alt="ź�Ҿ���" title="ź�Ҿ���" />
                                                <%# getImgAttatch(Eval("ItemID"), Eval("Title"), Eval("FileType"), Eval("TypeId")) %>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
