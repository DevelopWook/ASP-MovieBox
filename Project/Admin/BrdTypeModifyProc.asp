<%OPTION EXPLICIT%>
<!--#include virtual="/inc/adovbs.inc"-->
<%
'---------------------------�Խ��� ��� ���� ó��---------------------------------
'1. ���۵� ������ ������ ����
'2. DB ���� ��ü �����ϰ� DB�� ����
'3. UPDATE ���ǹ� ����
'4. DB�� ���ǹ� ����
'5. �Խ��� ��� �������� �̵�
'---------------------------------------------------------------------------------
'1. ���۵� ������ ������ ����
Dim TBoardName, TFileUpEnable, TBoardDesc, TReplyEnable, TaddOnEnable, TAccessLevel

TBoardName = Request("TBoardName")
TBoardDesc = Request("TBoardDesc")
TReplyEnable = Request("TReplyEnable")
TAccessLevel = Request("TAccessLevel")

'2. DB ���� ��ü �����ϰ� DB�� ����
Dim objDBConn, strSQL, affected
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open ("Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99")

'3. UPDATE ���ǹ� ����
strSQL = "UPDATE BoardType SET TBoardName = '" & TBoardName & "', " & _
						   "TBoardDesc = '" & TBoardDesc & "', " & _
						   "TReplyEnable = " & TReplyEnable & ", " & _
						   "TAccessLevel = '" & TAccessLevel & "' " & _
							"WHERE TBoardName = '" & TBoardName & "'"

'4. DB�� ���ǹ� ����
objDBConn.Execute strSQL, affected, adExecuteNoRecords
objDBConn.Close
Set objDBConn = Nothing

'5. �Խ��� ��� �������� �̵�
If affected Then
	Response.Write "<script>alert('�Խ��� ��� ������ �Ϸ��߽��ϴ�.');location.href='./BrdTypeList.asp';</script>"
Else
	Response.Write "<script>alert('�Խ��� ��� ������ �����߽��ϴ�.');history.back();</script>"
End If 
%>