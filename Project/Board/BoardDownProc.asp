<%OPTION EXPLICIT
'---------------------------���ε�� ���� �ٿ�ε�--------------------------------
'1. ���� �ٿ�ε� ó���� �ʿ��� ���� ����
'2. ���۵� ���� Ȯ��
'3. �����ޱ� Ƚ�� ������Ʈ
'4. DB ���� ��ü �Ҹ�
'5. ���� �ٿ�ε� ó��
'6. �ǽ� �ٿ�ε� ��ü �Ҹ� �� �����ޱ� â �ݱ�
'---------------------------------------------------------------------------------

'1. ���� �ٿ�ε� ó���� �ʿ��� ���� ����
Dim objDown, strConn, strSQL, objDBConn, objRs, bid, pWebPath, fileName, boardname

'2. ���۵� ���� Ȯ��
bid = Request("bid")
boardname = Request("boardname")
filename = Request("filename")

'3. �����ޱ� Ƚ�� ������Ʈ
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "UPDATE Board SET BDownNo = BDownNo+1 WHERE bid = " & bid
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn
objDBConn.Execute strSQL

'4. DB ���� ��ü �Ҹ�
objDBConn.Close
Set objDBConn = Nothing

'5. ���� �ٿ�ε� ó��
Set objDown = Server.CreateObject("TABS.Download")
objDown.FilePath = server.MapPath("/pds/" & fileName)
objDown.FileName = fileName
objDown.MimeType = "application/x-zip-compressed"  '���� �ٿ�ε带 ���� ���������� �νĸ��ϴ� ����Ÿ�� ����
objDown.TransferFile true

'6. �ǽ� �ٿ�ε� ��ü �Ҹ� �� �����ޱ� â �ݱ�
Set objDown = Nothing
%>