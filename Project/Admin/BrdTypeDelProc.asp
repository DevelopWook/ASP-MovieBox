<%OPTION EXPLICIT
'---------------------�Խ��� ���� ó��--------------------------------------------
'1. ������ �ʿ��� ���� ����
'2. ������ �Խ����̸� Ȯ��
'3. DB�� DELETE �� ���� �� DB���� ��ü �Ҹ�
'4. �Խ��� ��� �������� �̵�
'---------------------------------------------------------------------------------

'1. ������ �ʿ��� ���� ����
Dim objDBConn, strConn, strSQL, boardname

'2. ������ �Խ����̸� Ȯ��
boardname = Request("boardname")

'3. DB�� DELETE �� ���� �� DB���� ��ü �Ҹ�
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "DELETE FROM BoardType WHERE TBoardName = '" & boardname & "'"
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'3. DB�� DELETE �� ���� �� DB���� ��ü �Ҹ�
objDBConn.Execute strSQL
Set objDBConn = Nothing

'4. �Խ��� ��� �������� �̵�
Response.Redirect "/admin/BrdTypeList.asp"
%>