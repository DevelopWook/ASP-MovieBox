<%OPTION EXPLICIT%>
<!--#include virtual="/inc/adovbs.inc"-->
<%
'--------------------------�Խ��� ��� ����---------------------------------------
'1. �Խ��� ��� ó���� �ʿ��� ���� ����
'2. DB�� �Խ��� ����� �����Ͽ� ���ڵ�¿� ����
'3. �� �Խ��� ���ڸ� ���� i�� ����
'4. �Խ��� ����� ���� ������ �ݺ� ���
'---------------------------------------------------------------------------------

'1. �Խ��� ��� ó���� �ʿ��� ���� ���� 
Dim objRs, strConn, strSQL,totalRecords, i

'2. DB�� �Խ��� ����� �����Ͽ� ���ڵ�¿� ����
strSQL = "SELECT * FROM BoardType ORDER BY TRegDate DESC"
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
Set objRS = Server.CreateObject("ADODB.Recordset")
objRs.Open strSQL, strConn, adOpenStatic, adLockOptimistic, adCmdText

'3. �� �Խ��� ���ڸ� ���� i�� ����
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
    <h3>�Խ��� ��� ��Ȳ<hr noshade></h3>
    <a href="/Admin/BrdRegForm.asp">�Խ��� �����ϱ�</a>
    <table width="768" cellpadding="1" cellspacing="1" border="0" bgcolor="#999999" align="center">
      <tr bgcolor="#fefeee" align="center">
        <td nowrap>��ȣ</td>
        <td nowrap>�Խ��Ǹ�</td>
        <td nowrap>�亯�ۿ���</td>
        <td nowrap>���Ͼ��ε�</td>
        <td nowrap>���ٱ���</td>
        <td nowrap>�Խ��ǻ�����</td>
      </tr>
<%
'4. �Խ��� ����� ���� ������ �ݺ� ���
If NOT objRs.EOF Then
	Do Until objRs.EOF%>
	  <tr bgcolor="#ffffff" align="center"
		onMouseOver = "this.style.backgroundColor='#fefe99';this.style.cursor='hand';this.style.color='red';"
		onMouseOut = "this.style.backgroundColor='#ffffff';this.style.color='#000000';"
		onClick = "location.href='/Admin/BrdTypeDetail.asp?BoardName=<%=objRs("TBoardName")%>'"
	  >
	    <td nowrap><%=i%></td>
	    <td nowrap><%=objRs("TBoardName")%></td>
	    <td nowrap><%=objRs("TReplyEnable")%></td>
	    <td nowrap><%=objRs("TFileUpEnable")%></td>
	    <td nowrap><%=objRs("TAccessLevel")%></td>
		<td nowrap><%=FormatDateTime(objRs("TRegDate"),2)%></td>
	  </tr>
<%		i = i - 1 
		objRs.MoveNext
	Loop
  End If%>
</body>
</html>
<%
'Recordset ��ü �Ҹ�
objRs.Close
Set objRs = Nothing
%>