<%OPTION EXPLICIT
<!-- #include virtual="/inc/adovbs.inc" -->
'------------------------�Խù� ��� ó��-----------------------------------------
'1. ���� ���ε� ��ü ���� �� �� �� ����
'2. INSERT �� �ۼ�
'3. ADO ��ü�� �̿��Ͽ� DB�� ���ǹ� ����
'4. �ڷ�� ��� �������� �̵�
'---------------------------------------------------------------------------------

'���۵� HTML ������ ������ ����
Dim BUName, BUserID, BSubject, BContent, filename, BFileName, BBoardNo, BBoardName, BUserIP, BReplyDepth, BReplyNo, skey, sval, page

	'������ ���� Ȯ��
	page = Request("page")

	'�˻� Ű ����Ȯ��
	skey = Request("skey")

	'�˻��� ���� Ȯ��
	sval = Request("sval")
	
	'��� ���� ���� Ȯ��
	BReplyNo = Request("BReplyNo")
	
	'��� ���� ���� Ȯ��
	BReplyDepth = 1'Request("BReplyDepth")
	
	'�Խ��� ��ȣ ���� Ȯ��
	BBoardNo = Request("BBoardNo")
	
	'�Խ����̸�
	BBoardName = Request("BBoardName")
	
	'�̸�
	BUName = Request("BUName")
	
	'���̵�
	BUserID = Request("BUserID")
	
	'����
	BSubject = Request("BSubject")
	
	'����
	BContent = Request("BContent")
	
	'�Խ���IP
	BUserIP = Request.ServerVariables("Remote_Host")
	
	'�����̸�
	'filename = objUp.Form("file").filename
	
	'If filename <> "" Then
	'	Dim BLocalPath
	'	BLocalPath = objUp.Form("file").save
	'	BFileName = Mid(BLocalPath, InStrRev(BLocalPath, "\") + 1)
	'End If

'Set objUp = Nothing


'2. INSERT �� �ۼ�
'DB ������ ���� ���� ����
Dim objDBConn, objRs, strConn, strSQL, affected

'DB ���� ���� ���� ����
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

'Connection ��ü �����ϰ� DB�� ����
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'���� �亯 �Խù� ������ ������Ʈ
strSQL = "UPDATE Board SET BReplyNo = BReplyNo + 1 WHERE BBoardNo = " & BBoardNo & " AND BReplyNo > " & BReplyNo
					  
objDBConn.Execute strSQL


'������ ����� �亯 ���̿� �亯�۹�ȣ ����
BReplyNo = BReplyNo + 1
BReplyDepth = BReplyDepth + 1

'���۹��� ������ �̿��Ͽ� ���ǹ� �ۼ�
strSQL = "INSERT INTO Board (BoardName, BUserID, BUName, BSubject, BContent, BFileName, BUserIP, BBoardNo, BReplyDepth, BReplyNo) " & _
		 "VALUES ('�����Խ���', '" & _
					   BUserID		& "', '" & _
					   BUName		& "', '" & _
					   BSubject		& "', '" & _
					   BContent		& "', '" & _
					   BFileName	& "', '" & _
					   BUserIP		& "', " & _
					   BBoardNo		& ", " & _
					   BReplyDepth	& ", " & _
					   BReplyNo		& ")"


'3. ADO ��ü�� �̿��Ͽ� DB�� ���ǹ� ����
'DB�� ����� ����ϴ� INSERT ���ǹ� ����
objDBConn.Execute strSQL, affected', &H00000080 
'��ȯ�� ���� ��ɾ� ���� ������� ������ adovbs.inc ������ �������� �ʾ� ������� ���� �Է���

'Connection ��ü �Ҹ�
objDBConn.Close
Set objDBConn = Nothing

'4. �ڷ�� ��� �������� �̵�
'��� �������� �̵�
Response.Redirect "BoardList.asp?BoardName=" & BBoardName & "&" & "page="  & page & "&" & "skey="  & skey & "&" & "sval="  & sval
%>