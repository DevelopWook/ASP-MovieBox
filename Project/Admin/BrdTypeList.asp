<%OPTION EXPLICIT%>
<!--#include virtual="/inc/adovbs.inc"-->
<%
'--------------------------게시판 목록 보기---------------------------------------
'1. 게시판 목록 처리에 필요한 변수 선언
'2. DB에 게시판 목록을 질의하여 레코드셋에 저장
'3. 총 게시판 숫자를 변수 i에 저장
'4. 게시판 목록이 끝날 때까지 반복 출력
'---------------------------------------------------------------------------------

'1. 게시판 목록 처리에 필요한 변수 선언 
Dim objRs, strConn, strSQL,totalRecords, i

'2. DB에 게시판 목록을 질의하여 레코드셋에 저장
strSQL = "SELECT * FROM BoardType ORDER BY TRegDate DESC"
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
Set objRS = Server.CreateObject("ADODB.Recordset")
objRs.Open strSQL, strConn, adOpenStatic, adLockOptimistic, adCmdText

'3. 총 게시판 숫자를 변수 i에 저장
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
    <h3>게시판 등록 현황<hr noshade></h3>
    <a href="/Admin/BrdRegForm.asp">게시판 생성하기</a>
    <table width="768" cellpadding="1" cellspacing="1" border="0" bgcolor="#999999" align="center">
      <tr bgcolor="#fefeee" align="center">
        <td nowrap>번호</td>
        <td nowrap>게시판명</td>
        <td nowrap>답변글여부</td>
        <td nowrap>파일업로드</td>
        <td nowrap>접근권한</td>
        <td nowrap>게시판생성일</td>
      </tr>
<%
'4. 게시판 목록이 끝날 때까지 반복 출력
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
'Recordset 개체 소멸
objRs.Close
Set objRs = Nothing
%>