<%OPTION EXPLICIT
'---------------------------�Խù� ���� ó��--------------------------------------
'1. �ǽ� ���ε� ��ü �����ϰ� ���� ó�� �����ϱ�
'2. ���� ���� Ȯ��
'3. ���� ������ ���� ��� ���� ���� �����ϰ� ����� ���� �����ϱ�
'4. ����� ������ DB�� ����
'5. ���� ��ü �Ҹ�
'6. �Խù� �� ���� �������� �̵�
'---------------------------------------------------------------------------------


'2. ���� ���� Ȯ��
Dim BSubject, BContent, existingfile, file, bid, boardname, page, skey, sval
BSubject = Request("BSubject")
BContent = Request("BContent")
existingfile = Request("existingfile")
'file = Request("")
bid = Request("bid")
boardname = Request("boardname")
page = Request("page")
skey = Request("skey")
sval = Request("sval")

'3. ���� ������ ���� ��� ���� ���� �����ϰ� ����� ���� �����ϱ�
If file <> "" Then
	Dim objFSO, filePath, filename
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	filePath = savePoint & "\" & existingFile
	If objFSO.FileExists(filePath) Then
		objFSO.DeleteFile(filePath)
	End If
	filename = objUp.Form("file").save
	filename = Mid(filename, InStrRev(filename, "\")+1)
Else 
	filename = existingfile
End If

'4. ����� ������ DB�� ����
Dim strConn, strSQL, objDBConn
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

strSQL = "UPDATE Board SET	BSubject = '" & BSubject & "', " & _
						   "BContent = '" & BContent & "', " & _
						   "BFileName = '" & filename & "' " & _
	     "WHERE bid = " & bid

Set objDBConn = Server.CreateObject("ADODB.connection")
objDBConn.Open strConn

objDBConn.Execute strSQL

'5. ���� ��ü �Ҹ�
'Set objUp = Nothing
objDBConn.Close
'Set objUp = Nothing

'6. �Խù� �� ���� �������� �̵�
Response.Redirect "/Board/BoardViewDetail.asp?boardname=" & boardname & "&bid=" & bid & "&page=" & page & "&skey=" & skey & "&sval=" & sval
%>