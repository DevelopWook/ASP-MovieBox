<%OPTION EXPLICIT
'---------------------------�Խù� �����ϱ�--------------------------------------
'1. �Խù� ������ �������� ���� ���� ����
'2. �Խ��� �̸��� �Խù� ID Ȯ��
'3. DB�� �Խù� ������ �����ϰ� ����� ���ڵ�¿� ����
'4. �Խù� ���� ��� �� ���� �� �Խ� �� ���ڵ�� ��ü �Ҹ�
'---------------------------------------------------------------------------------

'1. �Խù� ������ �������� ���� ���� ����
Dim objRs, strConn, strSql, bid, BoardName

'2. �Խ��� �̸��� �Խù� ID Ȯ��
BoardName = Request("BoardName")
BID = Request("Bid")

'3. DB�� �Խù� ������ �����ϰ� ����� ���ڵ�¿� ����
strSQL = "SELECT * FROM Board WHERE bid='" & bid & "'"
strConn = "Provider=SQLOLEDB.1;Data Source=Localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
Set objRs = Server.CreateObject("ADODB.Recordset")
objRs.Open strSQL, strConn



%>
<html>
<head>
<title>ASP ���α׷���</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<p align="center">
</p>
<form name="adjBoard" action="BoardModifyProc.asp" method="get" enctype="multipart/form-data" onSubmit="return checkInfo()">
<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>
		<h3>�Խù� �����ϱ�<hr noshade></h3>
<table width="600" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#999999">
  <tr bgcolor="#ffffff" align="center">
    <td width="25%" nowrap bgcolor="#fefeee">�ۼ���(ID)</td>
    <td width="25%" nowrap><%=objRs("BUName") & "(" & objRs("BUserID") & ")"%></td>
    <td width="25%" nowrap bgcolor="#fefeee">�ۼ���</td>
    <td width="25%" nowrap><%=FormatDateTime(objRs("BRegDate"),2) & " " & FormatDateTime(objRs("BRegDate"),4)%></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td align="center" bgcolor="#fefeee">����</td>
    <td colspan="3">
		<input type="text" name="BSubject" value="<%=objRs("BSubject")%>" size="60">
	</td>
  </tr>
  <tr bgcolor="#ffffff" height="100">
	<td align="center" bgcolor="#fefeee">����</td>
    <td colspan="3">
		<textarea name="BContent" cols="60" rows="10"><%=objRs("BContent")%></textarea>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td bgcolor="#fefeee">÷������</td>
    <td colspan="3">
		���� ��ϵ� ���� : <b><%=objRs("BFileName")%></b><br>
		<input type="file" name="file" size="50">
	</td>
  </tr>  
</table>
<br>
<center>
  <input type="hidden" name="existingfile" value="<%=objRs("BFileName")%>">
  <input type="hidden" name="bid" value="<%=bid%>" >
  <input type="hidden" name="boardname" value="<%=boardname%>" >
  <input type="submit" value="�����ϱ�">&nbsp;&nbsp;
  <input type="button" value="�������" onClick="location.href='BoardList.asp?boardname=<%=boardname%>'">&nbsp;&nbsp;
</center>
</form>
</body>
</html>

<%
'4. �Խù� ���� ��� �� ���� �� �Խ� �� ���ڵ�� ��ü �Ҹ�
objRs.Close
Set objRs = Nothing
%>