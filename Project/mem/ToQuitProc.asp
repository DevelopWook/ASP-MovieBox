<!--#include virtual="/inc/checkLogin.asp"-->
<%
'--------------------------------회원 탈퇴 처리------------------------------------------
' 1. 전송받은 회원 ID를 변수에 저장
' 2. 회원 테이블에서 회원 정보를 삭제 후 개체 소멸
' 3. 메인 페이지로 이동
'----------------------------------------------------------------------------------------
'1.
Dim uid
uid = Request("uid")

'2.
Dim objDBConn, strConn, strSQL
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "DELETE FROM Members WHERE UID = '" & uid & "'"

Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn
objDBConn.Execute strSQL
objDBConn.Close
Set objDBConn = Nothing

'3.
Response.Redirect "/bottom.asp"
%>