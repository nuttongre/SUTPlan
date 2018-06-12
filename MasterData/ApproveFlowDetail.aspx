<%@ Page Language="C#" MasterPageFile="~/Master/MasterOriginal.master" AutoEventWireup="true"
    CodeFile="ApproveFlowDetail.aspx.cs" Inherits="ApproveFlowDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function AddItem() {
            location.href = "ApproveFlowDetail.aspx?mode=1";
        }
        function EditItem(id) {
            location.href = "ApproveFlowDetail.aspx?mode=2&id=" + id;
        }
        function deleteItem(id) {
            if (confirm('��ͧ���ź��¡�ù�� ���������')) location.href = "ApproveFlowDetail.aspx?mode=3&id=" + id;
        }
        function Cancel() {
            location.href = "ApproveFlowDetail.aspx";
        }
        function Cktxt(m) {
            var ck = 0;
            var ddlApproveStep = $get("<%=ddlApproveStep.ClientID%>");
            var ErrorApproveStep = $get("ErrorApproveStep");
            var ddlUserRole = $get("<%=ddlUserRole.ClientID%>");
            var ErrorUserRole = $get("ErrorUserRole");
            var ddlPosition = $get("<%=ddlPosition.ClientID%>");
            var ErrorApprovePosition = $get("ErrorApprovePosition");
            var ddlApproveFlow = $get("<%=ddlApproveFlow.ClientID%>");
            var ErrorApproveFlow = $get("ErrorApproveFlow");
            var txtSort = $get("<%=txtSort.ClientID%>");
            var ErrorSort = $get("ErrorSort");

            ck += ckTxtNull(m, txtSort, ErrorSort);
            ck += ckDdlNull(m, ddlPosition, ErrorPosition);
            ck += ckDdlNull(m, ddlUserRole, ErrorUserRole);
            ck += ckDdlNull(m, ddlApproveStep, ErrorApproveStep);
            ck += ckDdlNull(m, ddlApproveFlow, ErrorApproveFlow);

            if (ck > 0) {
                return false;
            }
            else {
                return true;
            }
        }
        function deleteImg() {
            if (confirm('��ͧ���ź�Ҿ��� ���������')) {
                return true;
            }
            else {
                return false;
            }
        }
        function ckUpload() {
            var fiUpload = document.getElementById("<%=fiUpload.ClientID%>").value;
            if (fiUpload == "") {
                alert("��س����͡���");
                return;
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
            �ӴѺ��鹵͹���͹��ѵ�
        </div>
        <div class="spaceDiv"></div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="view" runat="server">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="Div1" class="TableSearch">
                            <div class="SearchTable">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">������¡��</span>
                                </div>
                                <div class="spaceDiv"></div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ�ͧ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList ID="ddlSearch" CssClass="ddlSearch" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" Width="330">
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
                                            ID="btSearch" runat="server" OnClick="btSearch_Click" ToolTip="�������ͤ���" />
                                    </div>
                                </div>
                                <%--<div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">�������§ҹ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:Literal ID="linkReport" runat="server"></asp:Literal>
                                    </div>
                                </div>--%>
                                <div class="spaceDiv"></div>
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
                                <asp:Button ID="btAdd" CssClass="btAdd" runat="server" Text="       ���ҧ��¡������" OnClientClick="AddItem();"
                                    ToolTip="���ҧ��¡������" />
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                        <div class="clear"></div>
                        <div class="spaceDiv"></div>
                        <div class="gridViewDiv">
                            <Control:DataGridView ID="GridView1" runat="server" PageSize="30">
                                <Columns>
                                    <Control:BoundField HeaderText="�ӴѺ���" DataField="Sort">
                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                    </Control:BoundField>
                                    <Control:TemplateField HeaderText="��鹵͹">
                                        <ItemTemplate>
                                            <%# checkedit(Eval("ApproveFlowDetailID").ToString(), Eval("ApproveStepName").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="25%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���˹�">
                                        <ItemTemplate>
                                            <%# checkedit(Eval("ApproveFlowDetailID").ToString(), Eval("ApprovePositionName").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="����������ҹ">
                                        <ItemTemplate>
                                            <%# Eval("UserRoleName").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="25%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="����礤��">
                                        <ItemTemplate>
                                            <%# Eval("ckStatus").ToString() %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="EditItem('<%#Eval("ApproveFlowDetailID") %>');">
                                                <img alt="" style="border: 0; cursor: pointer;" title="���" src="../Image/edit.gif" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="ź">
                                        <ItemTemplate>
                                            <a href="javascript:deleteItem('<%#Eval("ApproveFlowDetailID") %>');">
                                                <img alt="" style="border: 0; cursor: pointer;" title="ź" src="../Image/delete.gif" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
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
                <div id="table1" class="PageManageDiv">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ�ͧ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:HiddenField ID="hdfApproveFlowDetailID" runat="server" />
                                    <asp:DropDownList ID="ddlApproveFlow" CssClass="ddl txt300" runat="server" OnSelectedIndexChanged="ddlApproveFlow_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                    <span class="ColorRed">*</span> <span id="ErrorApproveFlow" class="ErrorMsg">��س����͡ Flow ���͹��ѵ�</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">��鹵͹ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList ID="ddlApproveStep" CssClass="ddl txt300" runat="server">
                                    </asp:DropDownList>
                                    <span class="ColorRed">*</span> <span id="ErrorApproveStep" class="ErrorMsg">��س����͡��鹵͹</span>
                                </div>
                            </div>
                            <div class="inputrowH" style="height: auto;">
                                <div class="divF_Head">
                                    <span class="spantxt">���������� :</span>
                                </div>
                                <div class="divB_Head" style="height: auto;">
                                    <asp:DropDownList CssClass="ddl" ID="ddlUserRole" runat="server" Width="300" AutoPostBack="true" OnSelectedIndexChanged="ddlUserRole_OnSelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="ColorRed">*</span> <span id="ErrorUserRole" class="ErrorMsg">��س����͡����������</span>
                                </div>
                            </div>
                            <div class="inputrowH" style="height: auto;">
                                <div class="divF_Head">
                                    <span class="spantxt">���˹� :</span>
                                </div>
                                <div class="divB_Head" style="height: auto;">
                                    <asp:DropDownList CssClass="ddl" ID="ddlPosition" runat="server" Width="300">
                                    </asp:DropDownList>
                                    <span class="ColorRed">*</span> <span id="ErrorPosition" class="ErrorMsg">��س����͡���˹�</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ӹǹ������ҳ�Թ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox ID="txtBudgetLimit" CssClass="txtBoxNum txt100" onkeypress="return KeyNumber(event);" MaxLength="10" runat="server" Text="0"></asp:TextBox>&nbsp;<span
                                        class="ColorRed">*</span> <span id="ErrorBudgetLimit" class="ErrorMsg">��سһ�͹�ӹǹ������ҳ�Թ</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�����ʶҹ� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList ID="ddlckStatus" CssClass="ddl" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ٻ����繵�</span>
                                </div>
                                <div class="divB_Head">
                                    <div style="float: left; width: 100px; height: 75px;">
                                        <div style="float: right;">
                                            <asp:ImageButton ID="ImgBt" ImageUrl="../Image/delete.gif" runat="server" ToolTip="ź�Ҿ���" OnClick="DeleteImg" OnClientClick="return deleteImg();" />
                                        </div>
                                        <div style="float: left; border: dotted 2px gray; float: left; width: 71px; height: 71px; padding: 3px 3px;">
                                            <asp:Image ID="imgPicture" Width="71" Height="71" runat="server" />
                                        </div>
                                    </div>
                                    <div style="float: left; padding-left: 100px;">
                                        <asp:Literal ID="linkReport" runat="server"></asp:Literal>
                                    </div>
                                    <div class="clear"></div>
                                    <div style="float: left; color: gray; margin-left: 90px; font-size: 5px;">��Ҵ����ٻ����й� 70 x 70 pixel</div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="inputrowH">
                        <div class="divF_Head"></div>
                        <div class="divB_Head">
                            <asp:FileUpload ID="fiUpload" runat="server" CssClass="txtBox"></asp:FileUpload>
                            <%--<input id="btnUpload" type="button" class="btUpload" onserverclick="btnUpload_OnClick" onclick="ckUpload();" value="      Upload" runat="server" />--%>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ӴѺ��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox ID="txtSort" CssClass="txtBoxNum txt50" Width="70px" MaxLength="2" runat="server" onkeypress="return KeyNumber(event);"></asp:TextBox>&nbsp;<span
                                        class="ColorRed">*</span> <span id="ErrorSort" class="ErrorMsg">��سһ�͹�ӴѺ���</span>
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
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="centerDiv">
                        <div class="classButton">
                            <div class="classBtSave">
                                <asp:Button ID="btSave" CssClass="btYes" runat="server" Text="       �ѹ�֡" OnClick="btSave_Click"
                                    OnClientClick="return Cktxt(1);" ToolTip="�ѹ�֡��¡�ù��" />
                                <asp:Button ID="btSaveAgain" CssClass="btYesToo" runat="server" Text="       �ѹ�֡������ҧ��¡������"
                                    OnClick="btSaveAgain_Click" OnClientClick="return Cktxt(1);" ToolTip="�ѹ�֡��¡�ù��������ҧ��¡������" />
                            </div>
                            <div class="classBtCancel">
                                <input type="button" class="btNo" value="      ���ѹ�֡" title="���ѹ�֡" onclick="Cancel();" />
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                            <div class="gridViewDiv">
                                <Control:DataGridView ID="GridView2" runat="server" Visible="false">
                                    <Columns>
                                        <Control:BoundField HeaderText="��¡�÷��" DataField="Sort">
                                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                                        </Control:BoundField>
                                        <Control:BoundField HeaderText="���˹�" DataField="ApprovePositionName">
                                            <ItemStyle Width="40%" HorizontalAlign="Left" />
                                        </Control:BoundField>
                                        <Control:BoundField HeaderText="����������" DataField="UserRoleName">
                                            <ItemStyle Width="45%" HorizontalAlign="Left" />
                                        </Control:BoundField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" />
                                </Control:DataGridView>
                            </div>
                            <div class="clear"></div>
                            <div class="spaceDiv"></div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
