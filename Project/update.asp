<%
	Dim objdbconn, strconn, strsql, num, id, aa, subject

	id = session("uid")
	num = request.querystring("num")
	aa = request.querystring("aa")
	subject = request.querystring("subject")
	
	set objdbconn = server.createobject("ADODB.Connection")
	strconn = "provider=SQLOLEDB.1;data source=localhost;initial catalog=Movie;user id=sa;Password=cdjsdj99"
	
	objdbconn.open strconn
	if aa = 1 then
		strsql = "update movie_set set check1 = 1, id ='" & id & "' where num = " & num
	else
		strsql = "update movie_set set check1 = 0, id = '' where num = " & num
	end if
	
	objdbconn.execute strsql
	
	objdbconn.close
	set objdbconn = Nothing

%>
<meta http-equiv="refresh" content="0;url=movie_set.asp?subject=<%=subject%>">