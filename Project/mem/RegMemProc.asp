<%
	option explicit
	
	'-----------------------------------ȸ�� ��� ó��--------------------------------
	'1. ���۵� �� ������ ����
	'2. DB�� ����
	'3. ���ǹ� ����
	'4. DB�� ���ǹ� ����
	'5. ��ü �Ҹ�
	'6. ȸ�� ��� �Ϸ� �������� �̵�
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
		
		%><script>alert('ȸ������� ȯ���մϴ�.');
					location.href='/bottom.asp'</script><%
		'Response.Redirect "/bottom.asp"
	Else
		Response.Write "<script>alert('ȸ����Ͽ� �����߽��ϴ�.'); history.back;</script>"
	End If
	%>