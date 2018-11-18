<%
If Session("uid") = "" Then
	Response.Write "<script>"
	Response.Write "alert('세션 정보가 없습니다. \n회원 로그인 해주세요.');" 
	Response.Write "location.href='/default.asp';"
	Response.Write "</script>"
	Response.End
End If
%>