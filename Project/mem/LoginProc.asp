<%
	option explicit
	
	'--------------------------------�α��� ó���ϱ�----------------------------
	'1. ���۵� ȸ�� ID�� ��й�ȣ Ȯ��
	'2. DB�� ȸ�� ������ �������� ����
	'3. ȸ�� ������ �����ϸ� ���� ������ ȸ�� ������ ������ �� ���� �������� �̵�
	'4. ȸ�� ������ ��Ȯ���� ������ ���� �߻� �� �α׿� �������� �̵�
	'5. ���� ��ü �Ҹ�
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
				alert("��й�ȣ�� ��Ȯ�� �Է��ϼ���");
				history.back();
			</script>
	<%END IF
	'4.
	ELSE
		%>
		<script>
			alert("ȸ�����̵� ��Ȯ�� �Է��ϼ���");
			history.back();
		</script>
	<%
	END IF
	
	objRs.Close
	Set objRs = Nothing
%>