<%OPTION EXPLICIT
'----------------------------�Խù� ��� ����-------------------------------------
'1. DB ���α׷��� ���� ��� ���� adovbs.inc ����
'2. �Խ����̸��� ������, �˻� ���� ���� Ȯ��
'3. DB ���Ǹ� ���� �Խ��� ���� Ȯ��(������ �۾��� ����, ���� ���ε� ���� ����)
'4. �Խ��� �̸�, �˻� ������ ���Ե� �Խù� ������ ���ǹ� strSQL ����
'5. �� ������ �� ���ڵ��, �� ���� �� �������� ����
'6. Recordset.PageSize �Ӽ��� ���� �� DB�� �����ϰ� ����� ���ڵ�¿� ����
'7. ���� ������ �� �Է��ϰ� ����¡ ó���� �ʿ��� �� ������ ��, �� ���ڵ� ��, 
'   �� ���� ��, ���� ���� ����/�� ������ Ȯ��
'8. ���� �������� �ʿ��� �Խù� ����� �ݺ� ���
'9. ���� ���� �� ������ �ݺ� ���
'10.����� ���� ���ڵ�� ��ü �Ҹ�
'---------------------------------------------------------------------------------

'1. DB ���α׷��� ���� ��� ���� adovbs.inc ����%>
<!--#include virtual="/inc/adovbs.inc"-->
<%

'2. �Խ����̸��� ������, �˻� ���� ���� Ȯ��
Dim page, skey, sval, boardname, BBoardNo

boardname = "�����Խ���"'Request("BoardName")
skey = Request("skey")
sval = Request("sval")
page = Request("page")
BBoardNo = Request("BBoardNo")
If page = "" Then
	page = 1
End If

'3. DB ���Ǹ� ���� �Խ��� ���� Ȯ��(������ �۾��� ����, ���� ���ε� ���� ����)
Dim objRs, strConn, strSQL, TFileUpEnable, TAccessLevel
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
Set objRS = Server.CreateObject("ADODB.Recordset")
strSQL = "SELECT TFileUpEnable, TAccessLevel From BoardType WHERE TBoardName = '" & boardname & "'"
objRs.Open strSQL, strConn

'�Խ��� ���� Ȯ�� - �Խ����� ������ �۾� ����
If Not(objRs.BOF) Then
	TFileUpEnable = objRs(0)
	TAccessLevel = objRs(1)
End If
	objRs.Close
	
'�Խù� ��� ����¡�� �ʿ��� ���� ����
Dim totalRecords, totalPages, rowsPerPage, startPage, endPage, p, i, sector,totalsector, pagesPerSector

'4. �Խ��� �̸�, �˻� ������ ���Ե� �Խù� ������ ���ǹ� strSQL ����
strSQL = "SELECT * FROM Board WHERE BoardName = '" & boardname & "' "
If ((skey <> "") And (sval <> "")) Then
	strSQL = strSQL & "AND " & skey & " LIKE '%" & sval & "%' "
End If
strSQL = strSQL & "ORDER BY BBoardNo DESC, BReplyNo ASC"

'5. �� ������ �� ���ڵ��, �� ���� �� �������� ����
rowsPerPage = 10
pagesPerSector = 10

'6. Recordset.PageSize �Ӽ��� ���� �� DB�� �����ϰ� ����� ���ڵ�¿� ����
objRs.PageSize = rowsPerPage
'�Խù� ����� �˻��ϴ� ���ǹ��� DB�� �����ϰ� ����� objRs ��ü�� ����
objRs.Open strSQL, strConn, adOpenStatic, adLockOptimistic, adCmdText

'7. ���� ������ �� �Է��ϰ� ����¡ ó���� �ʿ��� �� ������ ��, �� ���ڵ� ��, 
If Not objRs.EOF Then
	objRs.MoveLast
	totalRecords = objRs.RecordCount
	objRs.MoveFirst

	objRs.AbsolutePage = page

End If

'�� ������ �� Ȯ��
totalPages = objRs.PageCount

'���� ���� Ȯ��
sector = page / pagesPerSector

If (sector > int(sector)) Then
	sector = Int(sector) + 1
End If

'�� ���� �� Ȯ��
totalsector = totalPages / pagesPerSector
If totalsector > Int(totalsector) Then
	totalsector = Int(totalsector) + 1
End If

'�ش� ������ ����/�� ������ Ȯ��
startPage = ((sector-1) * rowsPerPage) + 1
endPage = (sector * rowsPerPage)
If endPage > totalPages Then
	endPage = totalPages
End If

%>
<html>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<body>

<table width="768" cellpadding="0" cellspacing="0" border="0" align="center">
  <tr><td>
    <h3><%=boardName%><hr noshade></h3>
    <table width="768" cellpadding="0" cellspacing="0" border="0" align="center">
      <tr>
        <td><%=page%>/<%=totalPages%> ������</td>
        <td align="right">
		  <%If TAccessLevel <> "" Then%>
			<%If Session("UserLevel") = TAccessLevel Or Session("UserLevel") = "Admin" Then%>
			<a href="BoardPostForm.asp?boardname=<%=boardname%>">���۾���</a>
			<%End If%>
		  <%Else
				Response.Write "�Խ����� �������� �ʽ��ϴ�."
			End If%>
		</td>
      </tr>
    </table>
    
    <table width="768" cellpadding="1" cellspacing="1" border="0" bgcolor="#999999" align="center">
      <tr bgcolor="#fefeee" align="center">
        <td nowrap>��ȣ</td>
        <td nowrap>����</td>
        <td nowrap>�ۼ���</td>
        <td nowrap>��ȸ��</td>
        <td nowrap>�ۼ���</td>
      </tr>
<%
'8. ���� �������� �ʿ��� �Խù� ����� �ݺ� ���
If NOT objRs.EOF Then
	i = 1
	Do Until (objRs.EOF Or i > rowsPerPage)
		Dim space,j
		space = ""
		For j = 1 To CInt(objRs("BReplyDepth"))
			space = space & "&nbsp;&nbsp;"
		Next%>
	  <tr bgcolor="#ffffff" align="center"
		onMouseOver = "this.style.backgroundColor='#fefe99';this.style.cursor='hand';this.style.color='red';"
		onMouseOut = "this.style.backgroundColor='#ffffff';this.style.color='#000000';"
		<%If Session("uid") <> "" Then%>
		  onClick = "location.href='/Board/BoardViewDetail.asp?bid=<%=objRs("bid")%>&boardname=<%=boardname%>&page=<%=page%>&BBoardNo=<%=BBoardNo%>'"
		<%End If%>
	  >
	    <td nowrap><%If objRs("BReplyDepth") = 0 Then Response.Write objRs("BBoardNo") End If%></td>
	    <td nowrap align="left">
			<%If objRs("BReplyDepth") > 0 Then Response.Write space & "[re]" End If%>
			<%=objRs("BSubject")%>
		</td>
	    <td nowrap><%=objRs("BUName") & "(" & objRs("BUserID") & ")"%></td>
	    <td nowrap><%=objRs("BReadNo")%></td>
	    <td nowrap><%=FormatDateTime(objRs("BRegDate"),2)%></td>
	  </tr>
<%		i = i + 1 
		objRs.MoveNext
	Loop
  End If%>
</table>
<br>
<center>
<table width="768" cellpadding="0" cellspacing="0" border="0" align="0">
  <tr>
    <td width="20%"></td>
    <td width="50%">
		<%'9. ����¡ ó��
		  If (sector > 1) Then%>
			<a href="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=startPage-10%>">[����10������]</a>
		<%End If%>

		<%For p = startPage To endPage
			If Int(page) <> Int(p) Then%>
				<a href="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=p%>">[<%=p%>]</a> 
		  <%Else%>
				<b>[<%=p%>]</b> 
		<%  End If
		  Next%>

		<%If (sector < totalSector) Then%>
			<a href="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=startPage+10%>">[����10������]</a> 
		<%End If%>
	</td>
	<td width="30%" align="right" cellpadding="0" nowrap>
	  <form name="search" action="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=page%>" method="post">
	  <table width="200" cellpadding="0" cellspacing="1" border="0" bgcolor="#999999">
	    <tr><td bgcolor="#fefeee" nowrap>
	      <select name="skey">
	        <option value="BSubject">����</option>
	        <option value="BContent">����</option>
	        <option value="BUName">�̸�</option>
	        <option value="BUserID">���̵�</option>
	      </select> 
	      <input type="text" name="sval" class="box"> 
	      <input type="button" class="button" value="�˻�" onClick="search.submit();">
	    </td></tr>
	  </table>
	  </form>
	</td>
</center>  
</body>
</html>
<%
'10. ����� ���� ���ڵ�� ��ü �Ҹ�
objRs.Close
Set objRs = Nothing
%>