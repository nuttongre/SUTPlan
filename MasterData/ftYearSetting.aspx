<%@ Page Language="C#" MasterPageFile="~/Master/MasterOriginal.master" AutoEventWireup="true"
    CodeFile="ftYearSetting.aspx.cs" Inherits="ftYearSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function AddItem() {
            location.href = "ftYearSetting.aspx?mode=1";
        }
        function AddItem2() {
            location.href = "ftYearSetting.aspx?mode=6&mid=" + Request("mid");
        }
        function EditItem(id) {
            location.href = "ftYearSetting.aspx?mode=7&mid=" + Request("mid") + "&id=" + id;
        }
        function View2(id) {
            location.href = "ftYearSetting.aspx?mode=5&mid=" + id;
        }
        function deleteItem(id) {
            if (confirm('��ͧ���ź��¡�ù�� ���������')) location.href = "ftYearSetting.aspx?mode=3&id=" + id;
        }
        function deleteItem2(id) {
            if (confirm('��ͧ���ź��¡�ù�� ���������')) location.href = "ftYearSetting.aspx?mode=8&mid=" + Request("mid") + "&id=" + id;
        }
        function Cancel() {
            if ((Request("mode") == "1") || (Request("mode") == "2")) {
                location.href = "ftYearSetting.aspx";
            }
            else {
                if ((Request("mode") == "6") || (Request("mode") == "7")) {
                    location.href = "ftYearSetting.aspx?mode=5&mid=" + Request("mid");
                }
                else {
                    location.href = "ftYearSetting.aspx";
                }
            }
        }
        function printRpt(mode, type, id) {
            window.open("../GtReport/Viewer.aspx?rpt=" + mode + "&id=" + id + "&rpttype=" + type);
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
            var txtSetMoney = 0;

            var lblTerm = parseInt($get("<%=lblTerm.ClientID%>").innerHTML);
            if (lblTerm == 2) {
                txtSetMoney = $get("<%=txtSetMoney.ClientID%>").value.replace(/,/g, '');
            }

            var txtAmount = $get("<%=txtAmount.ClientID%>").value.replace(/,/g, '');
            var txtPrice = $get("<%=txtPrice.ClientID%>").value.replace(/,/g, '');
            $get("<%=lblTotalAmount.ClientID%>").innerHTML = (parseFloat(txtSetMoney) + (parseInt(txtAmount) * parseFloat(txtPrice))).comma();
        }
        function SaveSetMoney() {
            if (confirm('�׹�ѹ�͹������ҳ��Ǵ���˹ѧ��ͻշ���ҹ�� �����觺����ҳ��Ǵ��ҡԨ�����չ�� �������?')) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="pageDiv">
                <div class="warningDiv">
                    <asp:Image ID="Img1" runat="server" Visible="false" />
                    <asp:Label ID="MsgHead" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <div class="headTable">
                    ��駤���Թ���¹��� 15 ��
                </div>
                <div class="spaceDiv"></div>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="view" runat="server">
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
                            <div class="btAddDiv">
                                <asp:Button ID="btAdd" CssClass="btAdd" runat="server" OnClientClick="AddItem();"
                                    Text="       ���ҧ��� / ������" ToolTip="���ҧ��� / ������" />
                            </div>
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
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
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
                                    <Control:TemplateField HeaderText="ź">
                                        <ItemTemplate>
                                            <a href="javascript:deleteItem('<%#Eval("MasterID") %>');">
                                                <img style="border: 0; cursor: pointer;" title="ź" src="../Image/delete.gif" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" />
                            </Control:DataGridView>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </asp:View>
                    <asp:View ID="edit" runat="server">
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
                    </asp:View>
                    <asp:View ID="view2" runat="server">
                        <div id="Div2" class="TableSearch">
                            <div class="SearchTable">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">���ҡ�õ�駤���Թ���¹��� 15 ��</span>
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
                                <asp:Button ID="btAdd2" CssClass="btAdd" runat="server" OnClientClick="AddItem2();"
                                    Text="       ��駤���Թ 15 ������" ToolTip="��駤���Թ 15 ������" />&nbsp;&nbsp;&nbsp;
                                <input type="button" class="btNo" value="      ��͹��Ѻ" title="��͹��Ѻ" onclick="Cancel();" />
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                        <div class="clear"></div>
                        <div class="spaceDiv"></div>
                        <div class="gridViewDiv">
                            <Control:DataGridView ID="GridView2" runat="server" ShowFooter="true" PageSize="50">
                                <Columns>
                                    <Control:TemplateField HeaderText="�ӴѺ���">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�дѺ���">
                                        <ItemTemplate>
                                            <%# Eval("ClassName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�������Թ">
                                        <ItemTemplate>
                                            <%# checkedit2(Eval("ItemID").ToString(), Eval("BudgetTypeName").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="��������������">
                                        <ItemTemplate>
                                            <%# Eval("BudgetDetailTypeName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ʹ¡��">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("SetMoney"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�ӹǹ�ѡ���¹">
                                        <ItemTemplate>
                                            <%# getStrAmount(Eval("Amount")) %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="�Ҥ�">
                                        <ItemTemplate>
                                            <%# getStrPrice(Eval("Price"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        <FooterTemplate>
                                            ��� : 
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="����Թ">
                                        <ItemTemplate>
                                            <%# GetAmount(Eval("TotalAmount"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        <FooterTemplate>
                                            <%# GetTotalAmount() %>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="EditItem('<%#Eval("ItemID") %>');">
                                                <img style="border: 0; cursor: pointer;" title="���" src="../Image/edit.gif" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="ź">
                                        <ItemTemplate>
                                            <a href="javascript:deleteItem2('<%#Eval("ItemID") %>');">
                                                <img style="border: 0; cursor: pointer;" title="ź" src="../Image/delete.gif" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" />
                            </Control:DataGridView>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                            <div class="TableSearch">
                                <div class="SearchTable">
                                    <div class="SearchHead">
                                        <span class="spantxt2 spansize14">��ػ�ʹ�Թ��ҡԨ����</span>
                                    </div>
                                    <div class="spaceDiv"></div>
                                    <div class="inputrow" style="display:none;">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�ӹǹ�ѡ���¹��� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 140px; text-align: right;">
                                            <asp:Label ID="lblTotalStudent" runat="server" Font-Bold="true" Text="0"></asp:Label>
                                            ��
                                        </div>
                                    </div>
                                    <div class="inputrow" style="display:none;">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�Ҥ���� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 150px; text-align: right;">
                                            <asp:Label ID="lblTotalPrice" runat="server" Font-Bold="true" Text="0.00"></asp:Label>
                                            �ҷ
                                        </div>
                                    </div>
                                    <div class="inputrow">
                                        <div class="SearchtxtF">
                                            <span class="spantxt">�ʹ������/�չ�� : </span>
                                        </div>
                                        <div class="SearchF" style="width: 150px; text-align: right;">
                                            <asp:Label ID="lblSumTotal" runat="server" Font-Bold="true" Text="0.00"></asp:Label>
                                            �ҷ
                                        </div>
                                    </div>
                                    <div id="divSetMoneyAcType" runat="server">
                                        <div class="inputrow">
                                            <div class="SearchtxtF">
                                                <span class="spantxt">�ʹ¡�� : </span>
                                            </div>
                                            <div class="SearchF" style="width: 150px; text-align: right;">
                                                <asp:TextBox ID="txtSetMoneyAcType" runat="server" AutoPostBack="true" Font-Bold="true" OnTextChanged="txtSetMoneyAcType_TextChanged" onkeyup="SumTotal();" onchange="txtComma(this);" onclick="SelecttxtAll(this);" onblur="txtZero(this,0); SumTotal();" onkeypress="return KeyNumber(event);" CssClass="txtBoxNum" Width="100" Text="0.00"></asp:TextBox>
                                                <asp:Label ID="lblSetMoneyAcType" runat="server" Text="" Font-Bold="true"></asp:Label>
                                                �ҷ 
                                            </div>
                                            <div style="float:left;padding:0px 0px 0px 10px;">
                                                <asp:LinkButton ID="lbtEditSetMoneyAcType" runat="server" OnClick="lbtEditSetMoneyAcType_Click" Visible="false">���</asp:LinkButton>
                                            </div>
                                            <div style="float: left; padding-left: 10px;">
                                                <span style="color: red;">*</span> <asp:Label ID="lblNoteSetMoneyAcType" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="inputrow">
                                            <div class="SearchtxtF">
                                                <span class="spantxt">�ѹ�֡�ʹ¡�� : </span>
                                            </div>
                                            <div class="SearchF" style="padding-left:10px;">
                                                <asp:Button ID="btSaveSetMoneyAcType" CssClass="btYes" runat="server" Text="       �ѹ�֡" OnClick="btSaveSetMoneyAcType_Click"
                                                OnClientClick="return SaveSetMoney();" ToolTip="�ѹ�֡�ʹ¡��" />
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
                                    <div class="spaceDiv"></div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </div>
                    </asp:View>
                    <asp:View ID="edit2" runat="server">
                        <div class="PageManageDiv">
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
                                    <asp:DropDownList CssClass="ddl" ID="ddlClass" runat="server" Width="100" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                                    </asp:DropDownList>&nbsp;<span class="ColorRed">*</span> <span id="ErrorClass" class="ErrorMsg">��س����͡�дѺ���</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�������Թ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlftYearBudgetType" runat="server" Width="250" AutoPostBack="true" OnSelectedIndexChanged="ddlftYearBudgetType_SelectedIndexChanged">
                                    </asp:DropDownList><span class="ColorRed">*</span> <span id="ErrorftYearBudgetType" class="ErrorMsg">��س����͡�������Թ</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�������������� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlftYearBudgetTypeDetail" runat="server" Width="250" AutoPostBack="true" OnSelectedIndexChanged="ddlftYearBudgetTypeDetail_SelectedIndexChanged">
                                    </asp:DropDownList><span class="ColorRed">*</span> <span id="ErrorftYearBudgetTypeDetail" class="ErrorMsg">��س����͡��������������</span>
                                </div>
                            </div>
                            <div id="divSetMoney" class="inputrowH" runat="server" visible="false">
                                <div class="divF_Head">
                                    <span class="spantxt">�ʹ¡�� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox ID="txtSetMoney" runat="server" onkeyup="SumTotal();" onchange="txtComma(this);" onclick="SelecttxtAll(this);" onblur="txtZero(this,0); SumTotal();" onkeypress="return KeyNumber(event);" CssClass="txtBoxNum" Width="100" Text="0"></asp:TextBox>
                                    �ҷ
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ӹǹ�ѡ���¹ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox ID="txtAmount" runat="server" onkeyup="SumTotal();" onchange="txtComma(this);" onclick="SelecttxtAll(this);" onblur="txtZero(this,0); SumTotal();" onkeypress="return KeyNumber(event);" CssClass="txtBoxNum" Width="100" Text="0"></asp:TextBox>
                                    ��
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�Ҥ� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox ID="txtPrice" runat="server" onkeyup="SumTotal();" onchange="txtComma(this);" onclick="SelecttxtAll(this);" onblur="txtZero(this,0); SumTotal();" onkeypress="return KeyNumber(event);" CssClass="txtBoxNum" Width="100" Text="0"></asp:TextBox>
                                    �ҷ
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�Ҥ���� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:Label ID="lblTotalAmount" runat="server" Text="0"></asp:Label>
                                    �ҷ
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
                            <div class="gridViewDiv">
                                <Control:DataGridView ID="GridView4" runat="server" PageSize="50" Visible="false">
                                    <Columns>
                                        <Control:TemplateField HeaderText="�ӴѺ���">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="�дѺ���">
                                            <ItemTemplate>
                                                <%# Eval("ClassName").ToString() %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="�������Թ">
                                            <ItemTemplate>
                                                <%# checkedit2(Eval("ItemID").ToString(), Eval("BudgetTypeName").ToString())%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="��������������">
                                            <ItemTemplate>
                                                <%# Eval("BudgetDetailTypeName").ToString() %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="�ʹ¡��">
                                            <ItemTemplate>
                                                <%# getStrPrice(Eval("SetMoney"))%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="�ӹǹ�ѡ���¹">
                                            <ItemTemplate>
                                                <%# getStrAmount(Eval("Amount")) %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="�Ҥ�">
                                            <ItemTemplate>
                                                <%# getStrPrice(Eval("Price"))%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="����Թ">
                                            <ItemTemplate>
                                                <%# getStrPrice(Eval("TotalAmount"))%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="���">
                                            <ItemTemplate>
                                                <a href="javascript:;" onclick="EditItem('<%#Eval("ItemID") %>');">
                                                    <img style="border: 0; cursor: pointer;" title="���" src="../Image/edit.gif" /></a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        </Control:TemplateField>
                                        <Control:TemplateField HeaderText="ź">
                                            <ItemTemplate>
                                                <a href="javascript:deleteItem('<%#Eval("MasterID") %>');">
                                                    <img style="border: 0; cursor: pointer;" title="ź" src="../Image/delete.gif" /></a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        </Control:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" />
                                </Control:DataGridView>
                                <div class="clear"></div>
                                <div class="spaceDiv"></div>
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
