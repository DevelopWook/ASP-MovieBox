<%
	option explicit
	
	'-------------------------------- ȸ�� ���̵� ���ϼ� �����ϱ�---------------------------------
	'1. ���޹��� ��� ���̵� ������ ����
	'2. ������ ȸ�� ID�� �����ϴ��� DB�� Ȯ��
	'3. ���� ����� affected ������ ����
	'4. DB ��ü �Ҹ�
	'5. ������ ȸ�� ���̵� �������� ������ ��밡���� ������ ������ �� �� â �ݱ�
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
	// RegMemForm�� �ִ� uniqueID ���� �� ���� 1 �� �����ϰ� ��â�� ����
	opener.document.RegMem.uniqueID.value = "1";
	opener.errunique.innerHTML = "<font color='blue'>����� �� �ִ� ID �Դϴ�.</font>";
	window.close();
</script>
<%ELSE%>
<script>
	opener.errunique.innerHTML = "<font color='red'>���� ID�� ȸ���� �����մϴ�.</font>";
	window.close();
</script>
<%END IF%>