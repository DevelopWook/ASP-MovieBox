<%OPTION EXPLICIT
'------------------------�Խù� ��� ó��-----------------------------------------
'1. ���� ���ε� ��ü ���� �� �� �� ����
'2. INSERT �� �ۼ�
'3. ADO ��ü�� �̿��Ͽ� DB�� ���ǹ� ����
'4. �ڷ�� ��� �������� �̵�
'---------------------------------------------------------------------------------

'1. ���� ���ε� ��ü ���� �� �� �� ����
'�ǽ� ���ε� ��ü�� ������ �� ���� ������ ������ ����
Dim objUp, savePoint, BUName, BUserID, BSubject, BContent, filename, BFileName, BBoardNo, BBoardName, BReplyDepth, BReplyNo, BUserIP, skey, sval, page

'���ε�� ������ ����� ������ ���� ��θ� ����
savePoint = Server.MapPath("/PDS")

'�ǽ� ���ε� ��ü ����
Set objUp = Server.CreateObject("Tabs.Upload")

'���� ��η� ���� ó�� ����
objUp.Start savePoint

'���۵� HTML ������ ������ ����

	'������ ���� Ȯ��
	page = 1'objUp.Form("page").value

	'�˻� Ű ����Ȯ��
	skey = objUp.Form("skey").value

	'�˻��� ���� Ȯ��
	sval = objUp.Form("sval").value
	
	'�Խ����̸�
	BBoardName = objUp.Form("BoardName").value
	
	'�̸�
	BUName = objUp.Form("BUName").value
	
	'���̵�
	BUserID = objUp.Form("BUserID").value
	
	'����
	BSubject = objUp.Form("BSubject").value
	
	'����
	BContent = objUp.Form("BContent").value
	
	'�Խ���IP
	BUserIP = Request.ServerVariables("Remote_Host")
	
	'�����̸�
	filename = objUp.Form("file").filename
	
	If filename <> "" Then
		Dim BLocalPath
		BLocalPath = objUp.Form("file").save
		BFileName = Mid(BLocalPath, InStrRev(BLocalPath, "\") + 1)
	End If

Set objUp = Nothing


'2. INSERT �� �ۼ�
'INSERT ���� ������ ���� ����
Dim strSQL

'DB ������ ���� ���� ����
Dim objDBConn, objRs, strConn, affected

'DB ���� ���� ���� ����
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

'Connection ��ü �����ϰ� DB�� ����
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'�Խ��� ��ȣ�� ���ϱ�
strSQL = "SELECT MAX(BBoardNo) From Board WHERE BoardName = '" & BBoardName & "'"

set objRs = objDBConn.Execute (strSQL)

If objRs(0) <> 0 Then
	BBoardNo = Int(objRs(0)) + 1
Else
	BBoardNo = 1
End If

Set objRs = Nothing

'���� ���� ������ �̿��Ͽ� ���ǹ� �ۼ�
strSQL = "INSERT INTO Board (BoardName, BUserID, BUName, BSubject, BContent, BFileName, BUserIP, BBoardNo) " & _
		 "VALUES ('" & BBoardName	& "', '" & _
					   BUserID		& "', '" & _
					   BUName		& "', '" & _
					   BSubject		& "', '" & _
					   BContent		& "', '" & _
					   BFileName	& "', '" & _
					   BUserIP		& "', " & _
					   BBoardNo		& ")"


'3. ADO ��ü�� �̿��Ͽ� DB�� ���ǹ� ����
'���ǹ� ����
objDBConn.Execute strSQL, affected, &H00000080 
'��ȯ�� ���� ��ɾ� ���� ������� ������ adovbs.inc ������ �������� �ʾ� ������� ���� �Է���

'Connection ��ü �Ҹ�
objDBConn.Close
Set objDBConn = Nothing

'4. �ڷ�� ��� �������� �̵�
'��� �������� �̵�
Response.Redirect "BoardList.asp?BoardName=" & BBoardName & "&" & "page="  & page & "&" & "skey="  & skey & "&" & "sval="  & sval
%>