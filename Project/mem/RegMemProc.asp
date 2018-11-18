<%
	option explicit
	
	'-----------------------------------회원 등록 처리--------------------------------
	'1. 전송된 값 변수에 저장
	'2. DB에 연결
	'3. 질의문 생성
	'4. DB에 질의문 전송
	'5. 개체 소멸
	'6. 회원 등록 완료 페이지로 이동
	'--------------------------------------------------------------------------------
	
	'1
	Dim uid, pwd, name, ssn, email, addr, phone, cell
	
	uid = Request("uid")
	pwd = Request("pwd1")
	name = Request("name")
	ssn = Request("ssn1") & Request("ssn2")
	email = Request("email")
	addr = Request("addr1") & " " & Request("addr2")
	phone = Request("phone1") & "-" & Request("phone2") & "-" & Request("phone3")
	cell = Request("cell1") & "-" & Request("cell2") & "-" & Request("cell3")
	
	'2
	Dim objDBConn, strSQL, strConn, affected
	Set objDBConn = Server.CreateObject("ADODB.Connection")
	strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
	objDBConn.Open strConn
	
	'3
	strSQL = "Insert into Members (uid, upwd, uname, ussn, uemail, uaddr, uphone, ucellphone) " & "Values ('" & uid & "', '" & pwd & "', '" & name & "', '" & ssn & "', '" & email & "', '" & addr & "', '" & phone & "', '" & cell & "')"
	
	'4
	objDBConn.Execute strSQL, affected
	objDBConn.Close
	Set objDBConn = Nothing
	
	'5
	IF affected Then
		Session("uid") = uid
		Session("uname") = name
		
		%><script>alert('회원등록을 환영합니다.');
					location.href='/bottom.asp'</script><%
		'Response.Redirect "/bottom.asp"
	Else
		Response.Write "<script>alert('회원등록에 실패했습니다.'); history.back;</script>"
	End If
	%>