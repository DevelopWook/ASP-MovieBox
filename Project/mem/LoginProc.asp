<%
	option explicit
	
	'--------------------------------로그인 처리하기----------------------------
	'1. 전송된 회원 ID와 비밀번호 확인
	'2. DB에 회원 정보가 유요한지 질의
	'3. 회원 정보가 유요하면 세션 변수에 회원 정보를 저장한 후 메인 페이지로 이동
	'4. 회원 정보가 정확하지 않으면 오류 발생 후 로그엔 피이지로 이동
	'5. 사용된 개체 소멸
	'--------------------------------------------------------------------------
	
	'1
	Dim uid, upwd
	uid = Request("uid")
	upwd = Request("pwd")
	
	'2
	Dim strConn, strSQL, objRs
	strConn = "Provider=SQLOLEDB.1;Date Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
	strSQL = "Select * From Members Where uid = '" & uid & "'"
	
	Set objRs = Server.CreateObject("ADODB.Recordset")
	objRs.Open strSQL, strConn
	
	'3.
	IF NOT objRs.EOF Then
		IF upwd=objRs("upwd") Then
			Session("uid") = uid
			Session("uname") = objRs("uname")
			Session("UserLevel") = objRs("UserLevel")
			
			%><script>
				window.opener.top.location="/index.asp";
				self.close()
			</script><%'Response.Redirect "/bottom.asp"
		ELSE%>
			<script>
				alert("비밀번호를 정확히 입력하세요");
				history.back();
			</script>
	<%END IF
	'4.
	ELSE
		%>
		<script>
			alert("회원아이디를 정확히 입력하세요");
			history.back();
		</script>
	<%
	END IF
	
	objRs.Close
	Set objRs = Nothing
%>