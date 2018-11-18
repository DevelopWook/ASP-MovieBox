<%
	Dim objDBConn, strSQL, affected
	Set objDBConn = Server.CreateObject("ADODB.Connection")
	objDBConn.Open ("Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99")
	strSQL = "CREATE TABLE movie_set (subject int NOT NULL,num int IDENTITY (1, 1) NOT NULL,check1 int NOT NULL,id varchar (50))"
	
	objDBConn.Execute strSQL, affected, adExecuteNoRecords
	
	objDBConn.Close
	Set objDBConn = Nothing
	
	Response.Write "완료"
%>