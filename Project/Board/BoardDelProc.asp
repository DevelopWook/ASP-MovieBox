<%OPTION EXPLICIT%>
<!--#include virtual="/inc/checkLogin.asp"-->
<%
'---------------------게시물 삭제 처리--------------------------------------------
'1. 삭제에 필요한 변수 선언
'2. 전송된 게시물 번호와 게시판이름 확인
'3. DB에 DELETE 문 전송 후 DB연결 개체 소멸
'4. 게시물 목록 페이지로 이동
'---------------------------------------------------------------------------------

'1. 삭제에 필요한 변수 선언
Dim objDBConn, strConn, strSQL, bid, boardname, page, skey,sval

'2. 전송된 게시물 번호와 게시판이름 확인
bid = Request("bid")
boardname = Request("boardname")
page = Request("page")
skey = Request("skey")
sval = Request("sval")

'3. DB에 DELETE 문 전송 후 DB연결 개체 소멸
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "DELETE FROM Board WHERE bid = " & bid
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'3. DB에 DELETE 문 전송 후 DB연결 개체 소멸
objDBConn.Execute strSQL
Set objDBConn = Nothing

'4. 게시물 목록 페이지로 이동 
Response.Redirect "/Board/BoardList.asp?boardname=" & boardname & "&page=" & page & "&skey=" & skey & "&sval=" & sval
%>