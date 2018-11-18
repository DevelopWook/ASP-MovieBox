<%OPTION EXPLICIT
'----------------------------게시물 목록 보기-------------------------------------
'1. DB 프로그래밍 관련 상수 모음 adovbs.inc 삽입
'2. 게시판이름과 페이지, 검색 관련 정보 확인
'3. DB 질의를 통한 게시판 권한 확인(관리자 글쓰기 전용, 파일 업로드 가능 여부)
'4. 게시판 이름, 검색 조건이 포함된 게시물 열람용 질의문 strSQL 생성
'5. 한 페이지 당 레코드수, 한 영역 당 페이지수 지정
'6. Recordset.PageSize 속성값 지정 후 DB에 질의하고 결과를 레코드셋에 저장
'7. 현재 페이지 값 입력하고 페이징 처리에 필요한 총 페이지 수, 총 레코드 수, 
'   총 영역 수, 현재 영역 시작/끝 페이지 확인
'8. 현재 페이지에 필요한 게시물 목록을 반복 출력
'9. 현재 영역 내 페이지 반복 출력
'10.사용이 끝난 레코드셋 개체 소멸
'---------------------------------------------------------------------------------

'1. DB 프로그래밍 관련 상수 모음 adovbs.inc 삽입%>
<!--#include virtual="/inc/adovbs.inc"-->
<%

'2. 게시판이름과 페이지, 검색 관련 정보 확인
Dim page, skey, sval, boardname, BBoardNo

boardname = "자유게시판"'Request("BoardName")
skey = Request("skey")
sval = Request("sval")
page = Request("page")
BBoardNo = Request("BBoardNo")
If page = "" Then
	page = 1
End If

'3. DB 질의를 통한 게시판 권한 확인(관리자 글쓰기 전용, 파일 업로드 가능 여부)
Dim objRs, strConn, strSQL, TFileUpEnable, TAccessLevel
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
Set objRS = Server.CreateObject("ADODB.Recordset")
strSQL = "SELECT TFileUpEnable, TAccessLevel From BoardType WHERE TBoardName = '" & boardname & "'"
objRs.Open strSQL, strConn

'게시판 종류 확인 - 게시판이 없으면 작업 안함
If Not(objRs.BOF) Then
	TFileUpEnable = objRs(0)
	TAccessLevel = objRs(1)
End If
	objRs.Close
	
'게시물 목록 페이징에 필요한 변수 선언
Dim totalRecords, totalPages, rowsPerPage, startPage, endPage, p, i, sector,totalsector, pagesPerSector

'4. 게시판 이름, 검색 조건이 포함된 게시물 열람용 질의문 strSQL 생성
strSQL = "SELECT * FROM Board WHERE BoardName = '" & boardname & "' "
If ((skey <> "") And (sval <> "")) Then
	strSQL = strSQL & "AND " & skey & " LIKE '%" & sval & "%' "
End If
strSQL = strSQL & "ORDER BY BBoardNo DESC, BReplyNo ASC"

'5. 한 페이지 당 레코드수, 한 영역 당 페이지수 지정
rowsPerPage = 10
pagesPerSector = 10

'6. Recordset.PageSize 속성값 지정 후 DB에 질의하고 결과를 레코드셋에 저장
objRs.PageSize = rowsPerPage
'게시물 목록을 검색하는 질의문을 DB에 질의하고 결과를 objRs 개체에 저장
objRs.Open strSQL, strConn, adOpenStatic, adLockOptimistic, adCmdText

'7. 현재 페이지 값 입력하고 페이징 처리에 필요한 총 페이지 수, 총 레코드 수, 
If Not objRs.EOF Then
	objRs.MoveLast
	totalRecords = objRs.RecordCount
	objRs.MoveFirst

	objRs.AbsolutePage = page

End If

'총 페이지 수 확인
totalPages = objRs.PageCount

'현재 영역 확인
sector = page / pagesPerSector

If (sector > int(sector)) Then
	sector = Int(sector) + 1
End If

'총 영역 수 확인
totalsector = totalPages / pagesPerSector
If totalsector > Int(totalsector) Then
	totalsector = Int(totalsector) + 1
End If

'해당 영역의 시작/끝 페이지 확인
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
        <td><%=page%>/<%=totalPages%> 페이지</td>
        <td align="right">
		  <%If TAccessLevel <> "" Then%>
			<%If Session("UserLevel") = TAccessLevel Or Session("UserLevel") = "Admin" Then%>
			<a href="BoardPostForm.asp?boardname=<%=boardname%>">새글쓰기</a>
			<%End If%>
		  <%Else
				Response.Write "게시판이 존재하지 않습니다."
			End If%>
		</td>
      </tr>
    </table>
    
    <table width="768" cellpadding="1" cellspacing="1" border="0" bgcolor="#999999" align="center">
      <tr bgcolor="#fefeee" align="center">
        <td nowrap>번호</td>
        <td nowrap>제목</td>
        <td nowrap>작성자</td>
        <td nowrap>조회수</td>
        <td nowrap>작성일</td>
      </tr>
<%
'8. 현재 페이지에 필요한 게시물 목록을 반복 출력
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
		<%'9. 페이징 처리
		  If (sector > 1) Then%>
			<a href="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=startPage-10%>">[이전10페이지]</a>
		<%End If%>

		<%For p = startPage To endPage
			If Int(page) <> Int(p) Then%>
				<a href="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=p%>">[<%=p%>]</a> 
		  <%Else%>
				<b>[<%=p%>]</b> 
		<%  End If
		  Next%>

		<%If (sector < totalSector) Then%>
			<a href="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=startPage+10%>">[다음10페이지]</a> 
		<%End If%>
	</td>
	<td width="30%" align="right" cellpadding="0" nowrap>
	  <form name="search" action="/Board/BoardList.asp?boardname=<%=boardname%>&page=<%=page%>" method="post">
	  <table width="200" cellpadding="0" cellspacing="1" border="0" bgcolor="#999999">
	    <tr><td bgcolor="#fefeee" nowrap>
	      <select name="skey">
	        <option value="BSubject">제목</option>
	        <option value="BContent">내용</option>
	        <option value="BUName">이름</option>
	        <option value="BUserID">아이디</option>
	      </select> 
	      <input type="text" name="sval" class="box"> 
	      <input type="button" class="button" value="검색" onClick="search.submit();">
	    </td></tr>
	  </table>
	  </form>
	</td>
</center>  
</body>
</html>
<%
'10. 사용이 끝난 레코드셋 개체 소멸
objRs.Close
Set objRs = Nothing
%>