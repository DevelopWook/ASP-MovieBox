<%OPTION Explicit

'-------------------------�Խ��� ��� �󼼺���------------------------------------
'1. ���۵� �Խ��� �̸��� ������ ����
'2. �Խ����� �� ������ DB�� �����ϰ� ���ڵ�¿� ����
'3. �Խ��� �� ������ ������ ����
'4. ���ڵ�� ��ü �Ҹ�
'---------------------------------------------------------------------------------

'1. ���۵� �Խ��� �̸��� ������ ����
Dim BoardName
BoardName = Request("BoardName")

'2. �Խ����� �� ������ DB�� �����ϰ� ���ڵ�¿� ����
Dim objRs, strConn, strSQL

Set objRs = Server.CreateObject("ADODB.Recordset")

strConn = "Provider=SQLOLEDB.1;Data Source=Localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "SELECT * FROM BoardType WHERE TBoardName='" & BoardName & "'"
objRs.Open strSQL, strConn

'3. �Խ��� �� ������ ������ ����
Dim TFileUpEnable, TBoardDesc, TReplyEnable, TAccessLevel

TBoardDesc = objRs("TBoardDesc")
TReplyEnable = objRs("TReplyEnable")
TFileUpEnable = objRs("TFileUpEnable")
TAccessLevel = objRs("TAccessLevel")

'4. ���ڵ�� ��ü �Ҹ�
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
	if(ModifyBoard.TBoardName.value.length < 2){
		errName.innerHTML="�Խ��� �̸��� 2���� �̻����� �Է��ϼ���.";
		return false;
	}
	ModifyBoard.submit();
}
</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>

<!--�Խ��� ���� �� ����-->
		<h3>�Խ��� ��� �� ����<hr noshade></h3>
		<form name="ModifyBoard" action="BrdTypeModifyProc.asp" method="get" onSubmit="return checkInfo()">
		<table width="600" border="0" cellspacing="1" cellpadding="0"  bgcolor="#999999" align="center">
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">�Խ����̸�</td>
		    <td width="100%">
				<input type="text" name="TBoardName" size="30" readonly maxlength="30" value="<%=BoardName%>">
				<span id="errName" style="color:red;"></span>
			</td>
		  </tr>
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">�亯��</td>
		    <td width="100%"><input name="TReplyEnable" type="radio" value="1" <%If TReplyEnable Then%>checked<%End If%>>���� 
		        <input name="TReplyEnable" type="radio" value="0" <%If TReplyEnable=0 Then%>checked<%End If%>>�Ұ���</td>
		  </tr>
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">���ٷ���</td>
		    <td width="100%">
				<input name="TAccessLevel" type="radio" value="Admin" <%If TAccessLevel="Admin" Then%>checked<%End If%>>�����ڸ� ���� ����
		        <input name="TAccessLevel" type="radio" value="User" <%If TAccessLevel="User" Then%>checked<%End If%>>�Ϲ�ȸ�� �̻� ���� ���� 
		    </td>
		  </tr>
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">�󼼼���</td>
		    <td width="100%">
				<textarea name="TBoardDesc" cols="60" rows="5" id="TBoardDesc"><%=TBoardDesc%></textarea>
			</td>
		  </tr>
		</table>
		<br>
		<center>
			<input type="submit" value="�����ϱ�" class="button">&nbsp;&nbsp;
			<input type="button" value="�������" onClick="history.back();" class="button">&nbsp;&nbsp;
			<input type="button" value="�����ϱ�" class="button" onClick="if(confirm('�� �Խ����� �����Ͻðڽ��ϱ�?')){location.href='/Admin/BrdTypeDelProc.asp?boardname=<%=boardname%>'}">
		</center>
		</form>
<!--�Խ��� ���� �� ��-->
    </td>
  </tr>
</table>
</body>
</html>