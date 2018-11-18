<%
	option explicit
	
	'-------------------------------- 회원 아이디 유일성 검증하기---------------------------------
	'1. 전달받은 희망 아이디 변수에 저장
	'2. 동일한 회원 ID가 존재하는지 DB에 확인
	'3. 질의 결과를 affected 변수에 저장
	'4. DB 개체 소멸
	'5. 동일한 회원 아이디가 존재하지 않으면 사용가능한 것으로 보고한 후 이 창 닫기
	'-------------------------------------------------------------------------------------------
	
	'1
	Dim uid
	uid = Request("uid")
	
	'2.
	Dim strSQL, objDBConn, objRs, strConn, affected
	Set objDBConn = Server.CreateObject("ADODB.Connection")
	strConn = "Provider=SQLOLEDB.1;Date Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
	strSQL = "Select * From Members Where uid = '" & uid & "'"
	objDBConn.Open strConn
	Set objRs = objDBConn.Execute (strSQL)
	
	'3.
	affected = objRs.EOF
	
	'4.
	objDBConn.Close
	Set objDBConn = Nothing
	
	'5.
	If affected Then
%>
<script>
	// RegMemForm에 있는 uniqueID 히든 폼 값을 1 로 변경하고 이창을 닫음
	opener.document.RegMem.uniqueID.value = "1";
	opener.errunique.innerHTML = "<font color='blue'>사용할 수 있는 ID 입니다.</font>";
	window.close();
</script>
<%ELSE%>
<script>
	opener.errunique.innerHTML = "<font color='red'>같은 ID의 회원이 존재합니다.</font>";
	window.close();
</script>
<%END IF%>