<%
If Session("uid") = "" Then
	Response.Write "<script>"
	Response.Write "alert('���� ������ �����ϴ�. \nȸ�� �α��� ���ּ���.');" 
	Response.Write "location.href='/default.asp';"
	Response.Write "</script>"
	Response.End
End If
%>