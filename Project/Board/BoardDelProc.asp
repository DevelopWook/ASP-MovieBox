<%OPTION EXPLICIT%>
<!--#include virtual="/inc/checkLogin.asp"-->
<%
'---------------------�Խù� ���� ó��--------------------------------------------
'1. ������ �ʿ��� ���� ����
'2. ���۵� �Խù� ��ȣ�� �Խ����̸� Ȯ��
'3. DB�� DELETE �� ���� �� DB���� ��ü �Ҹ�
'4. �Խù� ��� �������� �̵�
'---------------------------------------------------------------------------------

'1. ������ �ʿ��� ���� ����
Dim objDBConn, strConn, strSQL, bid, boardname, page, skey,sval

'2. ���۵� �Խù� ��ȣ�� �Խ����̸� Ȯ��
bid = Request("bid")
boardname = Request("boardname")
page = Request("page")
skey = Request("skey")
sval = Request("sval")

'3. DB�� DELETE �� ���� �� DB���� ��ü �Ҹ�
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "DELETE FROM Board WHERE bid = " & bid
Set objDBConn = Server.CreateObject("ADODB.Connection")
objDBConn.Open strConn

'3. DB�� DELETE �� ���� �� DB���� ��ü �Ҹ�
objDBConn.Execute strSQL
Set objDBConn = Nothing

'4. �Խù� ��� �������� �̵� 
Response.Redirect "/Board/BoardList.asp?boardname=" & boardname & "&page=" & page & "&skey=" & skey & "&sval=" & sval
%>