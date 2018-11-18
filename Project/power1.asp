<%
	Dim objDBConn, strSQL,affected,i 
	Set objDBConn = Server.CreateObject("ADODB.Connection")
	objDBConn.Open ("Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99")



		strSQL = "Insert Into movie_set(subject, check1) values(28,0)"
		For i=1 to 70
			objDBConn.Execute strSQL, affected, adExecuteNoRecords
			'objDBConn.Execute strSQL
		NEXT

	
	
	objDBConn.Close
	Set objDBConn = Nothing
	
	Response.Write "¿Ï·á"
%>