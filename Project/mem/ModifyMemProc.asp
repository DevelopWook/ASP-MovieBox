<%OPTION EXPLICIT%>
<!--#include virtual="/inc/adovbs.inc"-->
<%
'----------------------------------회원 정보 수정 처리-----------------------------------
'1. 전송된 값 변수에 저장
'2. DB에 연결
'3. 질의문 생성
'4. DB에 질의문 전송
'5. 개체 소멸
'6. 회원 정보 수정 완료 페이지로 이동
'----------------------------------------------------------------------------------------

'1
Dim uid,upwd,uname,ussn,uemail,uaddr,uphone, ucellphone

uid = Session("uid")
upwd = Request("pwd1")
uname = Request("name")
uemail = Request("email")
uaddr = Request("addr1") & " " & Request("addr2")
uphone = Request("phone1") & "-" & Request("phone2") & "-" & Request("phone3")
ucellphone = Request("cell1") & "-" & Request("cell2") & "-" & Request("cell3")

'2
Dim objDBConn, strSQL, affected
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open ("Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99")

'3
strSQL = "UPDATE Members SET upwd = '" & upwd & "', " & _
						   "uemail = '" & uemail & "', " & _
						   "uaddr = '" & uaddr & "', " & _
						   "uphone = '" & uphone & "' ," & _
						   "ucellphone = '" & ucellphone & "' " & _
	     "WHERE uid = '" & uid & "'"

'4
objDBConn.Execute strSQL, affected, adExecuteNoRecords

'5
If affected Then
	objDBConn.Close
	Set objDBConn = Nothing
	Response.Redirect "/bottom.asp"
Else 
	objDBConn.Close
	Set objDBConn = Nothing
	Response.Write "<script>alert('회원 정보 수정에 실패했습니다.');history.back;</script>"
End If 
%>