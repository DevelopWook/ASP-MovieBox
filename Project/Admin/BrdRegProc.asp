<%OPTION EXPLICIT
'--------------------�Խ��� ��� ó�� ������--------------------------------------
'1. ���۵� ���� ������ ����
'2. DB ���� ��ü �����ϰ� DB�� ����
'3. ������ �̸��� �Խ����� �ִ��� Ȯ��
'4. DB�� �Խ��� ����� ���� ���ǹ� �ۼ�
'5. DB�� ���ǹ��� ����
'6. �Խ��� ����� �Ϸ�Ǹ� �Խ��� ��� �������� �̵�
'---------------------------------------------------------------------------------

'1. ���۵� ���� ������ ����
Dim TBoardName, TBoardDesc,TFileUpEnable,  TReplyEnable, TAccessLevel

TBoardName = Request("TBoardName")
TBoardDesc = Request("TBoardDesc")
TReplyEnable = Request("TReplyEnable")
TFileUpEnable = Request("TFileUpEnable")
TAccessLevel = Request("TAccessLevel")

'2. DB ���� ��ü �����ϰ� DB�� ����
Dim objDBConn, strSQL, strConn, affected
Set objDBConn = Server.CreateObject("ADODB.Connection")
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
objDBConn.Open strConn

strSQL = "SELECT * FROM BoardType WHERE TBoardName = '" & TBoardName & "'"
objDBConn.Execute strSQL, affected
'3. ������ �̸��� �Խ����� �ִ��� Ȯ��
If affected <> 0 Then
	Response.Write "<script>alert('�̹� ���� �̸��� �Խ����� �����Ǿ� �ֽ��ϴ�.\n�Խ��� ��Ͽ� �����߽��ϴ�.');history.back();</script>"
	Response.End
End If

'4. DB�� �Խ��� ����� ���� ���ǹ� �ۼ�
strSQL = "INSERT INTO BoardType (TBoardName, TBoardDesc, TReplyEnable, TFileUpEnable,  TAccessLevel) " & _
		 "VALUES ('" & TBoardname & "', '" & _
					   TBoardDesc & "', " & _
					   TReplyEnable & ", " & _
					   TFileUpEnable & ", '" & _
					   TAccessLevel & "')"

'5. DB�� ���ǹ��� ����
objDBConn.Execute strSQL
objDBConn.Close
Set objDBConn = Nothing
	
'6. �Խ��� ����� �Ϸ�Ǹ� �Խ��� ��� �������� �̵�
Response.Redirect "BrdTypeList.asp"
%>