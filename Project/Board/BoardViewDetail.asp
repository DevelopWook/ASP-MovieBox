<%OPTION EXPLICIT
'-------------------------게시물 상세 보기----------------------------------------
'1. 전송된 정보 변수에 저장
'2. 조회수 업데이트를 위해 DB에 UPDATE 질의문 전송
'3. 게시물 상세 정보를 얻기 위해 DB에 질의하고 결과를 레코드셋에 저장
'---------------------------------------------------------------------------------

'1. 전송된 정보 변수에 저장
Dim  bid, BoardName, page, skey, sval, BBoardNo

BoardName = Request("BoardName")
page = Request("page")
skey = Request("skey")
sval = Request("sval")
bid = Request("bid")
BBoardNo = Request("BBoardNo")

'2. 조회수 업데이트를 위해 DB에 UPDATE 질의문 전송
Dim objRs, objDBConn, strConn, strSql

Set objDBConn = Server.CreateObject("ADODB.Connection")

strConn = "Provider=SQLOLEDB.1;Data Source=Localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
objDBConn.Open strConn

strSQL = "UPDATE Board SET BReadNo = BReadNo + 1 WHERE BID = " & bid

objDBConn.Execute strSQL

'3. 게시물 상세 정보를 얻기 위해 DB에 질의하고 결과를 레코드셋에 저장
strSQL = "SELECT * FROM Board WHERE bid='" & bid & "'"

Set objRs = objDBConn.Execute (strSQL)
%>
<html>
<head>
<title>ASP 프로그래밍</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<p align="center">
</p>

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>
		<h3>게시물 상세 보기<hr noshade></h3>
<table width="600" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#999999">
  <tr bgcolor="#ffffff">
    <td align="center" bgcolor="#fefeee">제목</td>
    <td colspan="3"><b><%=objRs("BSubject")%></b></td>
  </tr>
  <tr bgcolor="#ffffff" align="center">
    <td width="25%" nowrap bgcolor="#fefeee">작성자(ID)</td>
    <td width="25%" nowrap><%=objRs("BUName") & "(" & objRs("BUserID") & ")"%></td>
    <td width="25%" nowrap bgcolor="#fefeee">작성일</td>
    <td width="25%" nowrap><%=FormatDateTime(objRs("BRegDate"),2) & " " & FormatDateTime(objRs("BRegDate"),4)%></td>
  </tr>
  <tr bgcolor="#ffffff" align="center">
    <td bgcolor="#fefeee">첨부파일</td>
    <td>
		<%If objRs("BFileName") <> "" Then%>
		  <a href="#" onClick="window.open('/Board/BoardDownProc.asp?boardname=<%=boardname%>&bid=<%=bid%>&filename=<%=objRs("BFileName")%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>','','left=200,top=100,width=200,height=100')"><%=objRs("BFileName")%></a>
		<%End If%>
	</td>
    <td bgcolor="#fefeee">
		조회수
		<%If objRs("BFileName") <> "" Then%>(다운로드)<%End If%>
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
  <input type="button" value="답글달기" onClick="location.href='/Board/BoardReplyForm.asp?boardname=<%=boardname%>&bid=<%=bid%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>&BBoardNo=<%=BBoardNo%>'">&nbsp;&nbsp;
  <input type="button" value="목록으로" onClick="location.href='/Board/BoardList.asp?boardname=<%=boardname%>&bid=<%=bid%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>&BBoardNo=<%=BBoardNo%>'">&nbsp;&nbsp;
  <%If ((objRs("BUserID") = Session("uid")) Or (Session("UserLevel") = "Admin")) Then%>
	<input type="button" value="수정하기" onClick="location.href='/Board/BoardModifyForm.asp?bid=<%=bid%>&boardname=<%=boardname%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>';">&nbsp;&nbsp;
	<input type="button" value="삭제하기" onClick="if(confirm('글을 삭제하시겠습니까?')){location.href='/Board/BoardDelProc.asp?bid=<%=bid%>&boardname=<%=Boardname%>&page=<%=page%>&skey=<%=skey%>&sval=<%=sval%>&BBoardNo=<%=BBoardNo%>';}">
  <%End If%>
</center>
</body>
</html>

<%

Set objRs = Nothing
objDBConn.Close
Set objDBConn = Nothing
%>