<%OPTION EXPLICIT%>
<!--#include virtual="/inc/adovbs.inc"-->
<%
'---------------------------��� ȸ�� ��� ����-----------------------------------
'1. �ʿ��� ���� ����
'2. DB�����Ͽ� ȸ�� ����� �����ϰ� ���ڵ�¿� ����� ����
'3. ��ȯ�� �� ���ڵ�� Ȯ��
'4. ȸ�� ����� ���� �� ���� �ݺ� ���
'---------------------------------------------------------------------------------

'1. 
Dim objRs, strConn, strSQL,totalRecords, i

'2.
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "SELECT * FROM Members ORDER BY URegDate DESC"
Set objRS = Server.CreateObject("ADODB.Recordset")
objRs.Open strSQL, strConn, adOpenStatic, adLockOptimistic, adCmdText

'3.
If Not objRs.EOF Then
	objRs.MoveLast
	totalRecords = objRs.RecordCount
	objRs.MoveFirst
	i = totalRecords
End If
%>
<html>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<body>
<table width="768" cellpadding="0" cellspacing="0" border="0" align="center">
  <tr><td>
    <h3>ȸ�� ��� ��Ȳ<hr noshade></h3>
    <table width="700" cellpadding="1" cellspacing="1" border="0" bgcolor="#999999" align="center">
      <tr bgcolor="#fefeee" align="center">
        <td nowrap>����</td>
        <td nowrap>���̵�</td>
        <td nowrap>�̸�</td>
        <td nowrap>�̸���</td>
        <td nowrap>����ó1</td>
        <td nowrap>����ó2</td>
        <td nowrap>ȸ�����</td>
        <td nowrap>��������</td>
      </tr>
<%'4.
If NOT objRs.EOF Then
	Do Until objRs.EOF%>
	  <tr bgcolor="#ffffff" align="center"
		onMouseOver = "this.style.backgroundColor='#fefe99';this.style.cursor='hand';this.style.color='red';this.style.textDecoration='underline'"
		onMouseOut = "this.style.backgroundColor='#ffffff';this.style.color='#000000';this.style.textDecoration='none'"
		onClick = "location.href='/mem/ModifyMemForm.asp?uid=<%=objRs("UID")%>'"
	  >
	    <td nowrap><%=i%></td>
	    <td nowrap><%=objRs("UID")%></td>
	    <td nowrap><%=objRs("UName")%></td>
	    <td nowrap><%=objRs("UEmail")%></td>
	    <td nowrap><%=objRs("UPhone")%></td>
	    <td nowrap><%=objRs("UCellphone")%></td>
	    <td nowrap><%=objRs("UserLevel")%></td>
	    <td nowrap><%=FormatDateTime(objRs("URegDate"),2)%></td>
	  </tr>
<%		i = i - 1 
		objRs.MoveNext
	Loop
  End If%>
</body>
</html>
<%
objRs.Close
Set objRs = Nothing
%>