<%OPTION EXPLICIT
'---------------------------------------------------------------------------------
'1. ���۵� �Խ����̸�,������,�˻�,�亯�� ���� ���� Ȯ��
'2. ���� ���ε� ���� ���� Ȯ���� ���� DB�� �����Ͽ� ���ڵ�¿� ��� ����
'3. Recordset ��ü �Ҹ�
'4. ���� ���ڵ�� ��ü �Ҹ�
'---------------------------------------------------------------------------------

'1. ���۵� �Խ����̸�,������,�˻�,�亯�� ���� ���� Ȯ��
Dim BoardName, bid, page, skey, sval, TReplyEnable, TFileUpEnable, BSubject, BContent, BBoardNo, BReplyDepth, BReplyNo
BoardName = Request("BoardName")
bid = Request("bid")
page = Request("page")
skey = Request("skey")
sval = Request("sval")
BSubject = Request("BSubject")
BContent = Request("BContent")
BBoardNo = Request("BBoardNo")
BReplyDepth = Request("BReplyDepth")
BReplyNo = Request("BReplyNo")


'2. ���� ���ε� ���� ���� Ȯ��
Dim strSQL, strConn, objRs

strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

strSQL = "SELECT * FROM BoardType WHERE TBoardName = '" & BoardName & "'"

Set objRs = Server.CreateObject("ADODB.Recordset")
objRs.Open strSQL, strConn

TFileUpEnable = objRs("TFileUpEnable")

'3. Recordset ��ü �Ҹ�
objRs.Close
Set objRs = Nothing
%>
<html>
<head>
<title>ASP ���α׷���</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script language="javascript">
//�Է� ������ �˻��ϴ� �Լ�
function checkInfo(){
	var err
	err = 0
	if(!replyForm.BSubject.value){errSubject.innerHTML = "������ �Է��ϼ���";err+=1};
	if(!replyForm.BContent.value){errContent.innerHTML = "������ �Է��ϼ���";err+=1};
	
	if(err==0){
		replyForm.submit();
	}else{
		return false;
	}
}
</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<p align="center">
</p>

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>

<!--��� ��� �� ����-->
<h3>��� ����<hr noshade></h3>
<form name="replyForm" action="BoardReplyProc.asp" method="get" enctype="multipart/form-data" onSubmit="return checkInfo()">
<table width="600" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�ۼ���ID</td>
    <td width="100%">
		<input name="BUserID" type="text" id="BUserID" value="<%=Session("uid")%>" readonly>
		</span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�̸�</td>
    <td width="100%">
       <input name="BUName" type="text" id="BUName" value="<%=Session("uname")%>" readonly>
    </span>
    </span></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">����</td>
    <td width="100%"><span id="errName" style="color:red">
    [re]<input name="BSubject" type="text" id="BSubject" size="70" value="<%=BSubject%>"><br>
    <span id="errSubject" style="color:red;font-weight:bold"></span>
    </span>
		</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">����</td>
    <td width="100%">
      <textarea name="BContent" cols="70" rows="15" id="BContent"><%=BContent%></textarea><br>
      <span id="errContent" style="color:red;font-weight:bold"></span>
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">÷������</td>
    <td width="100%"><span id="errName" style="color:red">
    <input type="file" name="file" size="50">
    </span>
	</td>
  </tr>
</table>
<br>
<center>
    <input type="hidden" name="boardname" value="<%=boardname%>">
    <input type="hidden" name="page" value="<%=page%>">
    <input type="hidden" name="skey" value="<%=skey%>">
    <input type="hidden" name="sval" value="<%=sval%>">
    <input type="hidden" name="BBoardNo" value="<%=BBoardNo%>">
    <input type="hidden" name="BReplyDepth" value="<%=BReplyDepth%>">
    <input type="hidden" name="BReplyNo" value="<%=BReplyNo%>">
	<input type="submit" value="��۵��" >&nbsp;&nbsp;
	<input type="button" value="�������" onClick="history.back();" >
</center>
</form>
<!--��� ��� �� ��-->

    </td>
  </tr>
</table>
</body>
</html>