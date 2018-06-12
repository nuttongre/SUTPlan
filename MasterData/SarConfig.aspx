<%@ Page Language="C#" MasterPageFile="~/Master/MasterOriginal.master" AutoEventWireup="true"
    CodeFile="SarConfig.aspx.cs" Inherits="SarConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <script type="text/javascript">
        function Cancel() {
            location.href = "SarManage.aspx";
        }
        function Cktxt(m) {
            var ck = 0;
            var txtUpdateLink = $get("<%=txtUpdateLink.ClientID%>");
            var ErrorUpdateLink = $get("ErrorUpdateLink");
            var txtLogSarLink = $get("<%=txtLogSarLink.ClientID%>");
            var ErrorLogSarLink = $get("ErrorLogSarLink");
            var txtForwardMail = $get("<%=txtForwardMail.ClientID%>");
            var ErrorForwardMail = $get("ErrorForwardMail");

            ck += ckTxtNull(m, txtForwardMail, ErrorForwardMail);
            ck += ckTxtNull(m, txtLogSarLink, ErrorLogSarLink);
            ck += ckTxtNull(m, txtUpdateLink, ErrorUpdateLink);

            if (ck > 0) {
                return false;
            }
            else {
                return true;
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
                    ��駤���к�
                </div>
                <div class="spaceDiv"></div>
                <div style="width: 100%;">
                    <div style="float: left; width: 47%; padding-left: 20px;">
                        <div class="SearchTable" style="border: solid 1px black; width: 610px;">
                            <div class="SearchHead">
                                <span class="spantxt2 spansize14">��õ�駤��</span>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�������� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlYearType" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" �ա���֡��" Value="0"></asp:ListItem>
                                        <asp:ListItem Text=" �է�����ҳ" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�ٻẺ��§ҹ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:CheckBox ID="cbReportW" runat="server" Text=" Word" />
                                    <asp:CheckBox ID="cbReportE" runat="server" Text=" Excel" />
                                    <asp:CheckBox ID="cbReportP" runat="server" Text=" PDF" />
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">㺤Ӣ��ç��� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:CheckBoxList ID="cblReportProject" runat="server" RepeatColumns="3" AutoPostBack="true" OnSelectedIndexChanged="cblReportProject_SelectedIndexChanged"></asp:CheckBoxList>
                                    <asp:Label ID="lblReportProject" runat="server" ForeColor="Gray" Font-Size="12px" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">㺤Ӣ͡Ԩ���� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:CheckBoxList ID="cblReportActivity" runat="server" RepeatColumns="3"></asp:CheckBoxList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�͡�ѡɳ��ç���¹ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlIdentity1" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox CssClass="txtBoxL txt300" TextMode="MultiLine" Height="50px" ID="txtIdentity"
                                        runat="server"></asp:TextBox>
                                    <span class="ColorRed"></span>
                                    <span id="ErrorIdentity" class="ErrorMsg">��سһ�͹�͡�ѡɳ��ç���¹</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�ѵ�ѡɳ��ç���¹ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlIdentity2" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox CssClass="txtBoxL txt300" TextMode="MultiLine" Height="50px" ID="txtIdentity2"
                                        runat="server"></asp:TextBox>
                                    <span class="ColorRed"></span>
                                    <span id="ErrorIdentity2" class="ErrorMsg">��سһ�͹�ѵ�ѡɳ��ç���¹</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�Ԩ������ѡ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlMainActivity" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�Դ���ʶҹСԨ���� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <div style="float: left">
                                        <asp:RadioButtonList ID="rbtlActivityStatus" runat="server" RepeatColumns="2">
                                            <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                            <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div style="float: left; padding-left: 20px; padding-top: 4px; width: 500px;">
                                        <asp:Label ID="Label3" runat="server" ForeColor="Gray" Font-Size="12px" Text="�ʴ� % ��÷ӧҹ����СԨ����"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�����Թ�šԨ����Ẻ���ҧ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <div style="float: left">
                                        <asp:RadioButtonList ID="rbtlAcAssessment" runat="server" RepeatColumns="2">
                                            <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                            <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�ʴ�������Ẻ Full Text : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <div style="float: left">
                                        <asp:RadioButtonList ID="rbtlFullText" runat="server" RepeatColumns="2" AutoPostBack="true" OnSelectedIndexChanged="rbtlFullText_SelectedIndexChanged">
                                            <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                            <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div style="float: left; padding-left: 20px; padding-top: 4px; width: 500px;">
                                        <asp:Label ID="lblExFullText" runat="server" ForeColor="Gray" Font-Size="12px" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">Update Link : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:TextBox ID="txtUpdateLink" CssClass="txtBoxL" Width="300" TextMode="MultiLine" Height="50" runat="server"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorUpdateLink" class="ErrorMsg">��سһ�͹ Update Link</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">LogSar Link : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:TextBox ID="txtLogSarLink" CssClass="txtBoxL" Width="300" TextMode="MultiLine" Height="50" runat="server"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorLogSarLink" class="ErrorMsg">��سһ�͹ LogSar Link</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">Forward Mail : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:TextBox ID="txtForwardMail" CssClass="txtBoxL" Width="300" TextMode="MultiLine" Height="50" runat="server"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorForwardMail" class="ErrorMsg">��سһ�͹ Forward Mail</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">���˹觼���Ѻ�Դ�ͺ�Ԩ���� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:TextBox ID="txtPositionResponsible" CssClass="txtBoxL" Width="300" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">���˹����˹�ҧҹ/���������� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:TextBox ID="txtPositionHeadGroupSara" CssClass="txtBoxL" Width="300" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">���˹����˹�ҡ�����ҹ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:TextBox ID="txtPositionHeadGroup" CssClass="txtBoxL" Width="300" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                    </div>
                    <div style="float: right; width: 47%; padding-right: 20px;">
                        <div class="SearchTable" style="border: solid 1px black; width: 610px;">
                            <div class="SearchHead">
                                <span class="spantxt2 spansize14">���������§</span>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">���ط���дѺͧ��� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlStrategies" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�ҵðҹ����֡�Ҫҵ� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlStandardNation" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�ҵðҹ�������з�ǧ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlStandardMinistry" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�ѵ�ػ��ʧ���ԧ���ط�� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlStrategicObjectives" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">�ط���ʵ�� : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlStrategic" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">��Ǫ���Ѵ������ط��ͧ��� KPI : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlCorporateStrategy" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head" style="width: 250px;">
                                    <span class="spantxt">���ط���дѺἹ�ҹ : </span>
                                </div>
                                <div class="divB_Head" style="width: 350px;">
                                    <asp:RadioButtonList ID="rbtlStrategicPlan" runat="server" RepeatColumns="2">
                                        <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" �����ҹ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                    </div>
                    <div id="table1" class="PageManageDiv">
                        <div class="TableSearch" style="width: 500px; margin: 0 auto;">
                            <div class="SearchTable" style="float: left; border: solid 1px black; width: 630px;">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">��Ѻ��اࡳ��</span>
                                </div>
                                <div class="spaceDiv"></div>
                                <div class="inputrowH">
                                    <div class="divF_Head" style="width: 250px;">
                                        <span class="spantxt">��Ѻ��اࡳ�� : </span>
                                    </div>
                                    <div class="divB_Head" style="width: 350px;">
                                        <asp:RadioButtonList ID="rbtlckRate" runat="server" RepeatColumns="2" AutoPostBack="true" OnSelectedIndexChanged="rbtlckRate_SelectedIndexChanged">
                                            <asp:ListItem Text=" ��ҹ" Value="1"></asp:ListItem>
                                            <asp:ListItem Text=" �����ҹ" Value="0" Selected="True"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <asp:Panel ID="PanelRate" runat="server" Enabled="false">
                                    <div class="inputrowH">
                                        <div class="divF_Head" style="width: 250px;">
                                            <span class="spantxt">��Ѻ��اࡳ������ : </span>
                                        </div>
                                        <div class="divB_Head" style="width: 350px;">
                                            <asp:DropDownList CssClass="ddl" ID="ddlYearS" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="inputrowH">
                                        <div class="divF_Head" style="width: 250px;">
                                            <span class="spantxt">���ҧ��ºࡳ���û����Թ : </span>
                                        </div>
                                        <div class="divB_Head" style="width: 350px;">
                                            <asp:RadioButtonList ID="rbtlRate" runat="server">
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div class="spaceDiv"></div>
                                <div class="centerDiv">
                                    <asp:Label ID="lblCreate" runat="server" CssClass="spantxt4"></asp:Label>
                                </div>
                                <div class="centerDiv">
                                    <asp:Label ID="lblUpdate" runat="server" CssClass="spantxt4"></asp:Label>
                                </div>
                                <div class="spaceDiv"></div>
                            </div>
                        </div>
                        <div class="centerDiv">
                            <div class="classButton">
                                <div class="classBtSave">
                                    <asp:Button ID="btSave" CssClass="btYes" runat="server" Text="       �ѹ�֡" OnClientClick="return Cktxt(1);" OnClick="btSave_Click" ToolTip="�ѹ�֡��õ�駤�ҹ��" />
                                </div>
                                <div class="classBtCancel">
                                    <input type="button" class="btNo" value="      �͡" title="�͡�������ѡ" onclick="Cancel();" />
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="spaceDiv"></div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
