<!--#include virtual="/inc/checkLogin.asp"-->
<%
'--------------------------------ȸ�� Ż�� ó��------------------------------------------
' 1. ���۹��� ȸ�� ID�� ������ ����
' 2. ȸ�� ���̺��� ȸ�� ������ ���� �� ��ü �Ҹ�
' 3. ���� �������� �̵�
'----------------------------------------------------------------------------------------
'1.
Dim uid
uid = Request("uid")

'2.
Dim objDBConn, strConn, strSQL
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "DELETE FROM Members WHERE UID = '" & uid & "'"

Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn
objDBConn.Execute strSQL
objDBConn.Close
Set objDBConn = Nothing

'3.
Response.Redirect "/bottom.asp"
%>