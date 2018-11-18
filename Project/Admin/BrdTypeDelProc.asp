<%OPTION EXPLICIT
'---------------------게시판 삭제 처리--------------------------------------------
'1. 삭제에 필요한 변수 선언
'2. 삭제할 게시판이름 확인
'3. DB에 DELETE 문 전송 후 DB연결 개체 소멸
'4. 게시판 목록 페이지로 이동
'---------------------------------------------------------------------------------

'1. 삭제에 필요한 변수 선언
Dim objDBConn, strConn, strSQL, boardname

'2. 삭제할 게시판이름 확인
boardname = Request("boardname")

'3. DB에 DELETE 문 전송 후 DB연결 개체 소멸
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "DELETE FROM BoardType WHERE TBoardName = '" & boardname & "'"
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'3. DB에 DELETE 문 전송 후 DB연결 개체 소멸
objDBConn.Execute strSQL
Set objDBConn = Nothing

'4. 게시판 목록 페이지로 이동
Response.Redirect "/admin/BrdTypeList.asp"
%>