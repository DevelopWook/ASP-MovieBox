<%OPTION EXPLICIT%>
<!--#include virtual="/inc/adovbs.inc"-->
<%
'----------------------------------ȸ�� ���� ���� ó��-----------------------------------
'1. ���۵� �� ������ ����
'2. DB�� ����
'3. ���ǹ� ����
'4. DB�� ���ǹ� ����
'5. ��ü �Ҹ�
'6. ȸ�� ���� ���� �Ϸ� �������� �̵�
'----------------------------------------------------------------------------------------

'1
Dim uid,upwd,uname,ussn,uemail,uaddr,uphone, ucellphone

uid = Session("uid")
upwd = Request("pwd1")
uname = Request("name")
uemail = Request("email")
uaddr = Request("addr1") & " " & Request("addr2")
uphone = Request("phone1") & "-" & Request("phone2") & "-" & Request("phone3")
ucellphone = Request("cell1") & "-" & Request("cell2") & "-" & Request("cell3")

'2
Dim objDBConn, strSQL, affected
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open ("Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99")

'3
strSQL = "UPDATE Members SET upwd = '" & upwd & "', " & _
						   "uemail = '" & uemail & "', " & _
						   "uaddr = '" & uaddr & "', " & _
						   "uphone = '" & uphone & "' ," & _
						   "ucellphone = '" & ucellphone & "' " & _
	     "WHERE uid = '" & uid & "'"

'4
objDBConn.Execute strSQL, affected, adExecuteNoRecords

'5
If affected Then
	objDBConn.Close
	Set objDBConn = Nothing
	Response.Redirect "/bottom.asp"
Else 
	objDBConn.Close
	Set objDBConn = Nothing
	Response.Write "<script>alert('ȸ�� ���� ������ �����߽��ϴ�.');history.back;</script>"
End If 
%>