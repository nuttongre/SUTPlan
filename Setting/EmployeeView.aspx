<%@ Page Language="C#" MasterPageFile="../Master/MasterOriginal.master" AutoEventWireup="true"
    CodeFile="EmployeeView.aspx.cs" Inherits="EmployeeView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function AddItem() {
            location.href = "EmployeeView.aspx?mode=1";
        }
        function EditItem(id) {
            location.href = "EmployeeView.aspx?mode=2&id=" + id;
        }
        function deleteItem(id) {
            if (confirm('��ͧ���ź��¡�ù�� ���������')) location.href = "EmployeeView.aspx?mode=3&id=" + id;
        }
        function Cancel() {
            location.href = "EmployeeView.aspx";
        }
        function printRpt(mode, type) {
            var DeptID = $get("<%=ddlSearchDept.ClientID%>").value;
            var SubDeptID = $get("<%=ddlSearchMainSubDept.ClientID%>").value;
            var MainDeptID = $get("<%=ddlSearchMainDept.ClientID%>").value;
            var RoleID = $get("<%=ddlSearch.ClientID%>").value;
            window.open("../GtReport/Viewer.aspx?rpt=" + mode + "&deptid=" + DeptID + "&subdepid=" + SubDeptID + "&maindeptID=" + MainDeptID + "&roleid=" + RoleID + "&rpttype=" + type);
        }

        function HideItem(id, status) {

            var str = "�Դ";
            if (status == 1) {
                str = "�Դ";
            }
            if (confirm('��ͧ���' + str + '�����ҹ�������¹�� ���������')) location.href = "EmployeeView.aspx?mode=5&id=" + id + "&sts=" + status;
        }
        function resetItem(id) {
            if (confirm('��ͧ��� Reset Password ��¡�ù�� ���������')) location.href = "EmployeeView.aspx?mode=4&id=" + id;
        }
        function Cktxt(m) {
            var ck = 0;
            var txtUserName = $get("<%=txtUserName.ClientID%>");
            var ErrorUserName = $get("ErrorUserName");
            var txtName = $get("<%=txtName.ClientID%>");
            var ErrorName = $get("ErrorName");
            var txtEmail = $get("<%=txtEmail.ClientID%>");
            var ErrorEmail = $get("ErrorEmail");
            var txtTel = $get("<%=txtTel.ClientID%>");
            var ErrorTel = $get("ErrorTel");
            var ddlSchool = $get("<%=ddlSchool.ClientID%>");
            var ErrorSchool = $get("ErrorSchool");
            var ddlDept = $get("<%=ddlDept.ClientID%>");
            var ErrorDepartment = $get("ErrorDepartment");
            var ddlUserRole = $get("<%=ddlUserRole.ClientID%>");
            var ErrorUserRole = $get("ErrorUserRole");
            var txtPwd = $get("<%=txtPwd.ClientID%>");
            var txtConfirmPwd = $get("<%=txtConfirmPwd.ClientID%>");
            var ddlPosition = $get("<%=ddlPosition.ClientID%>");
            var ErrorPosition = $get("ErrorPosition");

            if (Request("mode") == "1") {

                if ($get("<%=txtPwd.ClientID%>").value != $get("<%=txtConfirmPwd.ClientID%>").value) {
                    $get("ErrorPasswordAndConfirm").style.display = "block";
                    ck += 1;
                }
                else {
                    $get("ErrorPasswordAndConfirm").style.display = "none";
                }
            }
            ck += ckDdlNull(m, ddlPosition, ErrorPosition);
            ck += ckDdlNull(m, ddlUserRole, ErrorUserRole);
            ck += ckDdlNull(m, ddlDept, ErrorDepartment);
            ck += ckDdlNull(m, ddlSchool, ErrorSchool);
            //ck += ckTxtNull(m, txtTel, ErrorTel);
            //ck += ckTxtNull(m, txtEmail, ErrorEmail);
            ck += ckTxtNull(m, txtName, ErrorName);
            ck += ckTxtNull(m, txtUserName, ErrorUserName);

            if (ck > 0) {
                return false;
            }
            else {
                return true;
            }
        }
        function ImgWait() {
            if ($get("<%=txtUserName.ClientID%>").value != "") {
                $get("ImgWait").style.display = "block";
                setTimeout("$get('ImgWait').style.display = 'none'", 500)
                setTimeout("$get('<%=lblErrorUserName.ClientID%>').style.display = 'block'", 500);
            }
            else {
                $get("<%=lblErrorUserName.ClientID%>").style.display = "none";
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
        <div class="warningDiv">
            <asp:Image ID="Img1" runat="server" Visible="false" />
            <asp:Label ID="MsgHead" runat="server" Text="" Visible="false"></asp:Label>
        </div>
        <div class="headTable">
            �����ҹ�к�
        </div>
        <div class="spaceDiv"></div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="view" runat="server">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="Div1" class="TableSearch">
                            <div class="SearchTable">
                                <div class="SearchHead">
                                    <span class="spantxt2 spansize14">���Ҽ����ҹ�к�</span>
                                </div>
                                <div class="spaceDiv"></div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">���������� : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList ID="ddlSearch" CssClass="ddlSearch" Width="350" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ��ѡ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchMainDept" Width="350px" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSearchMainDept_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ�ͧ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList CssClass="ddlSearch" ID="ddlSearchMainSubDept" Width="350px" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSearchMainSubDept_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">˹��§ҹ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <asp:DropDownList ID="ddlSearchDept" CssClass="ddlSearch" Width="350" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSearchDept_SelectedIndexChanged">
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
                                            ID="btSearch" runat="server" OnClick="btSearch_Click" ToolTip="�������ͤ���" Text=" " />
                                    </div>
                                </div>
                                <div class="inputrow">
                                    <div class="SearchtxtF">
                                        <span class="spantxt">�������§ҹ : </span>
                                    </div>
                                    <div class="SearchF">
                                        <a href="javascript:;" onclick="printRpt(28,'w');">
                                            <img style="border: 0; cursor: pointer; vertical-align: top;" width="50px;" height="50px;" title="���¡����§ҹ Ẻ�͡��� Word" src="../Image/icon/WordIcon.png" /></a>
                                        <a href="javascript:;" onclick="printRpt(28,'p');">
                                            <img style="border: 0; cursor: pointer; vertical-align: top;" width="45px;" height="45px;" title="���¡����§ҹ Ẻ�͡��� PDF" src="../Image/icon/PdfIcon.png" /></a>
                                    </div>
                                </div>
                                <div class="clear"></div>
                                <div class="spaceDiv"></div>
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
                                <asp:Button ID="btAdd" CssClass="btAdd" runat="server" OnClientClick="AddItem();" Text="       ���������ҹ�к�����"
                                    ToolTip="���������ҹ�к�����" />
                            </div>
                            <div style="float: right; padding-right: 20px;">
                                <div style="float: right">
                                    |&nbsp;<a id="spnDownLoadFile" runat="server" title="Download File Excel �鹩�Ѻ" href="../Doc/ImportEmpData.xls"><img src="../Image/dwnExcel.png" style="border: none; width: 25px; height: 24px;" />
                                        Download</a>&nbsp;|&nbsp;<a id="spnImportExcel" href="InputUsers.aspx" runat="server" title="����Ң����ż�����к��ҡ Excel"><img src="../Image/excelicon.png" style="border: none; width: 25px; height: 24px;" />
                                            ����Ң����ż����</a>&nbsp;|
                                </div>
                            </div>
                            <div class="spaceDiv"></div>
                        </div>
                        <div class="clear"></div>
                        <div class="spaceDiv"></div>
                        <div class="gridViewDiv">
                            <Control:DataGridView ID="GridView1" runat="server" PageSize="50">
                                <Columns>
                                    <Control:TemplateField HeaderText="�ӴѺ���">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:BoundField DataField="UserName" HeaderText="UserName">
                                        <ItemStyle Width="10%" HorizontalAlign="Left" />
                                    </Control:BoundField>
                                    <Control:TemplateField HeaderText="����">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="EditItem('<%#Eval("EmpID") %>');">
                                                <%#Eval("EmpName") %></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </Control:TemplateField>
                                    <Control:BoundField DataField="DeptName" HeaderText="˹��§ҹ" SortExpression="DeptName">
                                        <ItemStyle Width="25%" HorizontalAlign="Left" />
                                    </Control:BoundField>
                                    <Control:BoundField DataField="UserRoleName" HeaderText="����������" SortExpression="DeptName">
                                        <ItemStyle Width="20%" HorizontalAlign="Left" />
                                    </Control:BoundField>
                                    <Control:TemplateField HeaderText="���">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="EditItem('<%#Eval("EmpID") %>');">
                                                <img style="border: 0; cursor: pointer;" title="���" src="../Image/edit.gif" /></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="ʶҹ�">
                                        <ItemTemplate>
                                            <%# linkHide(Eval("EmpID").ToString(), Convert.ToBoolean(Eval("HideFlag")))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="ź">
                                        <ItemTemplate>
                                            <%# linkDel(Eval("EmpID").ToString())%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </Control:TemplateField>
                                    <Control:TemplateField HeaderText="Reset Pwd">
                                        <ItemTemplate>
                                            <a href="javascript:resetItem('<%#Eval("EmpID") %>');">
                                                <img style="border: 0; cursor: pointer;" title="Reset Password" src="../Image/reset.gif" /></a>
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
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div id="table1" class="PageManageDiv">
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">���ͼ���� :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:HiddenField ID="hdfEmpID" runat="server" />
                                    <asp:TextBox CssClass="txtBoxL txt150" ID="txtUserName" runat="server" MaxLength="20"></asp:TextBox><img id="ImgWait" alt="" src="../Image/waitiCon.gif" style="display: none; float: left;" />
                                    <span class="ColorRed">*</span> <span id="ErrorUserName" class="ErrorMsg">��سһ�͹���ͼ����</span>
                                    <asp:Label ID="lblErrorUserName" runat="server" Visible="false"></asp:Label>
                                    <asp:Button ID="btCkEmp" runat="server" CssClass="btNone" OnClick="btCkEmp_Click" />
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">���� - ���ʡ�� :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL txt200" ID="txtName" runat="server" MaxLength="100"></asp:TextBox>
                                    <span class="ColorRed">*</span> <span id="ErrorName" class="ErrorMsg">��سһ�͹ ����-���ʡ��</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">E-mail :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL txt200" ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                                    <span class="ColorRed"></span><span id="ErrorEmail" class="ErrorMsg">��سһ�͹ E-mail</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�������Ѿ�� :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:TextBox CssClass="txtBoxL txt100" ID="txtTel" runat="server" MaxLength="50"></asp:TextBox>
                                    <span class="ColorRed"></span><span id="ErrorTel" class="ErrorMsg">��سһ�͹�������Ѿ��</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">�Է�����/�ٹ�������¹ :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlSchool" runat="server" Width="300">
                                    </asp:DropDownList>
                                    <span class="ColorRed">*</span> <span id="ErrorSchool" class="ErrorMsg">��س����͡�Է�����/�ٹ�������¹</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ��ѡ : </span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddlSearch" ID="ddlMainDept" Width="300px" runat="server"
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
                                    <asp:DropDownList CssClass="ddlSearch" ID="ddlMainSubDept" Width="300px" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlMainSubDept_SelectedIndexChanged">
                                    </asp:DropDownList>&nbsp;<span
                                        class="ColorRed">*</span> <span id="ErrorMainSubDept" class="ErrorMsg">��س����͡˹��§ҹ�ͧ</span>
                                </div>
                            </div>
                            <div class="inputrowH">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ :</span>
                                </div>
                                <div class="divB_Head">
                                    <asp:DropDownList CssClass="ddl" ID="ddlDept" runat="server" Width="300" AutoPostBack="true" OnSelectedIndexChanged="ddlDept_OnSelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="ColorRed">*</span> <span id="ErrorDepartment" class="ErrorMsg">��س����͡˹��§ҹ</span>
                                </div>
                            </div>
                            <div class="inputrowH" style="height: auto;">
                                <div class="divF_Head">
                                    <span class="spantxt">˹��§ҹ���� (�����) :</span>
                                </div>
                                <div class="divB_Head" style="height: auto;">
                                    <asp:CheckBoxList ID="cblDept" runat="server"></asp:CheckBoxList>
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
                            <div id="tblEditPwd" style="float: left; width: 100%;" runat="server">
                                <div class="inputrowH">
                                    <div class="divF_Head">
                                        <span class="spantxt">���ʼ�ҹ :</span>
                                    </div>
                                    <div class="divB_Head">
                                        <asp:TextBox CssClass="txtBoxL txt150" ID="txtPwd" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                                        <span>**** �������к� �к��� Default �繤���� password</span>
                                    </div>
                                </div>
                                <div class="inputrowH">
                                    <div class="divF_Head">
                                        <span class="spantxt">�׹�ѹ���ʼ�ҹ :</span>
                                    </div>
                                    <div class="divB_Head">
                                        <asp:TextBox CssClass="txtBoxL txt150" ID="txtConfirmPwd" runat="server" TextMode="Password"
                                            MaxLength="20"></asp:TextBox>
                                        <span id="ErrorPasswordAndConfirm" class="ErrorMsg">�׹�ѹ���ʼ�ҹ���١��ͧ</span>
                                    </div>
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
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="inputrowH">
                    <div class="divF_Head"></div>
                    <div class="divB_Head">
                        <asp:FileUpload ID="fiUpload" runat="server" CssClass="txtBox"></asp:FileUpload>
                        <input id="btnUpload" type="button" class="btUpload" onserverclick="btnUpload_OnClick" onclick="ckUpload();" value="      Upload" runat="server" />
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
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
                    <asp:Label ID="lblRoleDuplicate" runat="server" ForeColor="Red" Text="*** ����������ҹ�����е��˹觧ҹ���������§ 1 ����ҹ�� ***" Visible="false"></asp:Label>
                    <div class="classButton">
                        <div class="classBtSave">
                            <asp:Button ID="btSave" CssClass="btYes" runat="server" Text="       �ѹ�֡"
                                OnClick="btSave_Click" OnClientClick="return Cktxt(1);" ToolTip="�ѹ�֡�����ҹ�к����" />
                        </div>
                        <div class="classBtCancel">
                            <input type="button" class="btNo" value="      ���ѹ�֡" title="���ѹ�֡�����ҹ�к����" onclick="Cancel();" />
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="spaceDiv"></div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
