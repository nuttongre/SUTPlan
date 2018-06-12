<%@ Page Language="C#" MasterPageFile="~/Master/MasterOriginal.master" AutoEventWireup="true"
    CodeFile="ApproveFlow.aspx.cs" Inherits="ApproveFlow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        
        function AddItem() {
            location.href = "ApproveFlow.aspx?mode=1";
        }
        function EditItem(id) {
            location.href = "ApproveFlow.aspx?mode=2&id=" + id;
        }
        function deleteItem(id) {
            if (confirm('��ͧ���ź��¡�ù�� ���������')) location.href = "ApproveFlow.aspx?mode=3&id=" + id;
        }
        function Cancel() {
            location.href = "ApproveFlow.aspx";
        }
        function Cktxt(m) {
            var ck = 0;
            var txtApproveFlow = $get("<%=txtApproveFlow.ClientID%>");
            var ErrorApproveFlow = $get("ErrorApproveFlow");
            var txtCk = $get("<%=txtCk.ClientID%>");
            var ErrorCk = $get("ErrorCk");
            var txtSort = $get("<%=txtSort.ClientID%>");
            var ErrorSort = $get("ErrorSort");

            ck += ckTxtNull(m, txtSort, ErrorSort);
            ck += ckTxtNull(m, txtCk, ErrorCk);
            ck += ckTxtNull(m, txtSide, ErrorSide);

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
                    Flow ���͹��ѵ�
                </div>
                <div class="spaceDiv"></div>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="view" runat="server">
                        <div id="Div1" class="TableSearch">
                            <div class="SearchTable">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">����Flow ���͹��ѵ�</span>
                                </div>
                                <div class="spaceDiv"></div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">�Ӥ��� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:TextBox CssClass="txtSearch" ID="txtSearch" runat="server" Width="322px"></asp:TextBox><asp:Button
                                            CssClass="btSearch" onmouseover="SearchBt(this,'btSearchOver');" onmouseout="SearchBt(this,'btSearch');" ID="btSearch"
                                            runat="server" OnClick="btSearch_Click" ToolTip="�������ͤ���" Text="  " />
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
                                    Text="       ���ҧFlow ���͹��ѵ�����" ToolTip="���ҧFlow ���͹��ѵ�����" />
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                        <div class="clear"></div>
                        <div class="spaceDiv"></div>
                        <div class="gridViewDiv">
                            <Control:DataGridView ID="GridView1" runat="server">
                                <Columns>
                                    <Control:TemplateField HeaderText="�ӴѺ���">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="Flow ���͹��ѵ�">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="EditItem('<%#Eval("ApproveFlowID") %>');">
                                                <%#Eval("ApproveFlowName") %></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="80%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="EditItem('<%#Eval("ApproveFlowID") %>');">
                                                <img style="border: 0; cursor: pointer;" title="���" src="../Image/edit.gif" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="ź">
                                        <ItemTemplate>
                                            <a href="javascript:deleteItem('<%#Eval("ApproveFlowID") %>');">
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
                                    <span class="spantxt">���� Flow ���͹��ѵ� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL" ID="txtApproveFlow" runat="server" Width="600px"></asp:TextBox>
                                    <span class="ColorRed">*</span>
                                    <span id="ErrorApproveFlow" class="ErrorMsg">��سһ�͹���� Flow ���͹��ѵ�</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ��ѡ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddlSearch" ID="ddlMainDept" Width="400px" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlMainDept_SelectedIndexChanged">
                                    </asp:DropDownList>&nbsp;<span
                                        class="ColorRed">*</span> <span id="ErrorMainDept" class="ErrorMsg">��س����͡˹��§ҹ��ѡ</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ�ͧ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddlSearch" ID="ddlMainSubDept" Width="400px" runat="server">
                                    </asp:DropDownList>&nbsp;<span
                                        class="ColorRed">*</span> <span id="ErrorMainSubDept" class="ErrorMsg">��س����͡˹��§ҹ�ͧ</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">����礤�� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxNum" ID="txtCk" runat="server" onkeypress="return KeyNumber(event);" Width="50px"></asp:TextBox>
                                    <span class="ColorRed">*</span>
                                    <span id="ErrorCk" class="ErrorMsg">��سһ�͹����礤��</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�ӴѺ��� : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxNum" ID="txtSort" runat="server" onkeypress="return KeyNumber(event);" Width="50px"></asp:TextBox>
                                    <span class="ColorRed">*</span>
                                    <span id="ErrorSort" class="ErrorMsg">��سһ�͹�ӴѺ���</span>
                                </div>
                            </div>
                            <div class="spaceDiv"></div>
                            <div class="centerDiv">
                                <div class="classButton">
                                    <div class="classBtSave">
                                        <asp:Button ID="btSave" CssClass="btYes" runat="server" Text="       �ѹ�֡"
                                            OnClick="btSave_Click" OnClientClick="return Cktxt();" ToolTip="�ѹ�֡Flow ���͹��ѵԹ��" />
                                    </div>
                                    <div class="classBtCancel">
                                        <input type="button" class="btNo" value="      ���ѹ�֡" title="���ѹ�֡" onclick="Cancel();" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
