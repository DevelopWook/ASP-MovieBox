<%OPTION EXPLICIT
'-------------------------�Խù� �� ����----------------------------------------
'1. ���۵� ���� ������ ����
'2. ��ȸ�� ������Ʈ�� ���� DB�� UPDATE ���ǹ� ����
'3. �Խù� �� ������ ��� ���� DB�� �����ϰ� ����� ���ڵ�¿� ����
'---------------------------------------------------------------------------------

'1. ���۵� ���� ������ ����
Dim  bid, BoardName, page, skey, sval, BBoardNo

BoardName = Request("BoardName")
page = Request("page")
skey = Request("skey")
sval = Request("sval")
bid = Request("bid")
BBoardNo = Request("BBoardNo")

'2. ��ȸ�� ������Ʈ�� ���� DB�� UPDATE ���ǹ� ����
Dim objRs, objDBConn, strConn, strSql

Set objDBConn = Server.CreateObject("ADODB.Connection")

strConn = "Provider=SQLOLEDB.1;Data Source=Localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
objDBConn.Open strConn

strSQL = "UPDATE Board SET BReadNo = BReadNo + 1 WHERE BID = " & bid

objDBConn.Execute strSQL

'3. �Խù� �� ������ ��� ���� DB�� �����ϰ� ����� ���ڵ�¿� ����
strSQL = "SELECT * FROM Board WHERE bid='" & bid & "'"

Set objRs = objDBConn.Execute (strSQL)
%>
<html>
<head>
<title>ASP ���α׷���</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<p align="center">
</p>

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>
		<h3>�Խù� �� ����<hr noshade></h3>
<table width="600" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#999999">
  <tr bgcolor="#ffffff">
    <td align="center" bgcolor="#fefeee">����</td>
    <td colspan="3"><b><%=objRs("BSubject")%></b></td>
  </tr>
  <tr bgcolor="#ffffff" align="center">
    <td width="25%" nowrap bgcolor="#fefeee">�ۼ���(ID)</td>
    <td width="25%" nowrap><%=objRs("BUName") & "(" & objRs("BUserID") & ")"%></td>
    <td width="25%" nowrap bgcolor="#fefeee">�ۼ���</td>
    <td width="25%" nowrap><%=FormatDateTime(objRs("BRegDate"),2) & " " & FormatDateTime(objRs("BRegDate"),4)%></td>
  </tr>
  <tr bgcolor="#ffffff" align="center">
    <td bgcolor="#fefeee">÷������</td>
    <td>
		<%If objRs("BFileName") <> "" Then%>
		  <a href="#" onClick="window.open('/Board/BoardDownProc.asp?boardname=<%=boardname%>&bid=<%=bid%>&filename=<%=objRs("BFileName")%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>','','left=200,top=100,width=200,height=100')"><%=objRs("BFileName")%></a>
		<%End If%>
	</td>
    <td bgcolor="#fefeee">
		��ȸ��
		<%If objRs("BFileName") <> "" Then%>(�ٿ�ε�)<%End If%>
	</td>
    <td>
		<%=objRs("BReadNo")%>
		<%If objRs("BFileName") <> "" Then Response.Write "(" & objRs("BDownNo") & ")" End If%>
    </td>
  </tr>
  <tr bgcolor="#ffffff" height="100">
    <td colspan="4">
		<%=Replace(objRs("BContent"), chr(10), "<br>")%>
	</td>
  </tr>
</table>
<br>
<center>
  <input type="button" value="��۴ޱ�" onClick="location.href='/Board/BoardReplyForm.asp?boardname=<%=boardname%>&bid=<%=bid%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>&BBoardNo=<%=BBoardNo%>'">&nbsp;&nbsp;
  <input type="button" value="�������" onClick="location.href='/Board/BoardList.asp?boardname=<%=boardname%>&bid=<%=bid%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>&BBoardNo=<%=BBoardNo%>'">&nbsp;&nbsp;
  <%If ((objRs("BUserID") = Session("uid")) Or (Session("UserLevel") = "Admin")) Then%>
	<input type="button" value="�����ϱ�" onClick="location.href='/Board/BoardModifyForm.asp?bid=<%=bid%>&boardname=<%=boardname%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>';">&nbsp;&nbsp;
	<input type="button" value="�����ϱ�" onClick="if(confirm('���� �����Ͻðڽ��ϱ�?')){location.href='/Board/BoardDelProc.asp?bid=<%=bid%>&boardname=<%=Boardname%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>&BBoardNo=<%=BBoardNo%>';}">
  <%End If%>
</center>
</body>
</html>

<%

Set objRs = Nothing
objDBConn.Close
Set objDBConn = Nothing
%>