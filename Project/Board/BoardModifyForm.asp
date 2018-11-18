<%OPTION EXPLICIT
'---------------------------게시물 수정하기--------------------------------------
'1. 게시물 정보를 가져오기 위한 변수 선언
'2. 게시판 이름과 게시물 ID 확인
'3. DB에 게시물 정보를 질의하고 결과를 레코드셋에 저장
'4. 게시물 정보 출력 및 수정 폼 게시 후 레코드셋 개체 소멸
'---------------------------------------------------------------------------------

'1. 게시물 정보를 가져오기 위한 변수 선언
Dim objRs, strConn, strSql, bid, BoardName

'2. 게시판 이름과 게시물 ID 확인
BoardName = Request("BoardName")
BID = Request("Bid")

'3. DB에 게시물 정보를 질의하고 결과를 레코드셋에 저장
strSQL = "SELECT * FROM Board WHERE bid='" & bid & "'"
strConn = "Provider=SQLOLEDB.1;Data Source=Localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
Set objRs = Server.CreateObject("ADODB.Recordset")
objRs.Open strSQL, strConn



%>
<html>
<head>
<title>ASP 프로그래밍</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<p align="center">
</p>
<form name="adjBoard" action="BoardModifyProc.asp" method="get" enctype="multipart/form-data" onSubmit="return checkInfo()">
<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>
		<h3>게시물 수정하기<hr noshade></h3>
<table width="600" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#999999">
  <tr bgcolor="#ffffff" align="center">
    <td width="25%" nowrap bgcolor="#fefeee">작성자(ID)</td>
    <td width="25%" nowrap><%=objRs("BUName") & "(" & objRs("BUserID") & ")"%></td>
    <td width="25%" nowrap bgcolor="#fefeee">작성일</td>
    <td width="25%" nowrap><%=FormatDateTime(objRs("BRegDate"),2) & " " & FormatDateTime(objRs("BRegDate"),4)%></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td align="center" bgcolor="#fefeee">제목</td>
    <td colspan="3">
		<input type="text" name="BSubject" value="<%=objRs("BSubject")%>" size="60">
	</td>
  </tr>
  <tr bgcolor="#ffffff" height="100">
	<td align="center" bgcolor="#fefeee">내용</td>
    <td colspan="3">
		<textarea name="BContent" cols="60" rows="10"><%=objRs("BContent")%></textarea>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td bgcolor="#fefeee">첨부파일</td>
    <td colspan="3">
		현재 등록된 파일 : <b><%=objRs("BFileName")%></b><br>
		<input type="file" name="file" size="50">
	</td>
  </tr>  
</table>
<br>
<center>
  <input type="hidden" name="existingfile" value="<%=objRs("BFileName")%>">
  <input type="hidden" name="bid" value="<%=bid%>" >
  <input type="hidden" name="boardname" value="<%=boardname%>" >
  <input type="submit" value="수정하기">&nbsp;&nbsp;
  <input type="button" value="목록으로" onClick="location.href='BoardList.asp?boardname=<%=boardname%>'">&nbsp;&nbsp;
</center>
</form>
</body>
</html>

<%
'4. 게시물 정보 출력 및 수정 폼 게시 후 레코드셋 개체 소멸
objRs.Close
Set objRs = Nothing
%>