<%
	Dim objdbconn, strconn, strsql, i, subject

	subject = Request("subject")
	set objdbconn = Server.CreateObject("ADODB.Connection")
	strconn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
				
	
	objdbconn.open strconn
	strsql = "select * from movie_set where subject =" & subject
	
	set objrs = server.createobject("ADODB.Recordset")
	objrs.open strsql, strconn

	
%>
<html>
	<head>
	<script language='javascript'>
	function update(xx)
	{
		if(confirm("���� �Ͻðڽ��ϱ�?"))
		{
			document.location.href=xx;
		}
	}
	function modify(xx)
	{
		if(confirm("���Ÿ� ��� �Ͻðڽ��ϱ�?"))
		{
			document.location.href=xx;
		}
	}
	function no()
	{
		alert('�α����� �̿��� �ּ���');
	}
	</script>
	</head>
	<body>

		<br><br><br><br>
		<center><img src="/img_movie/screen.PNG"></center>
		<br><br><br><br><br><br>
		<table align="Center">
			<tr>
				<%for i = 1 to 70%>
				<%if objrs("check1") = 0 then%>
					<td>
						<%if session("uid") = "" then%>
							<img src="./ox/oo.PNG" width="20" height="20" onclick="no()">
						<%else%>
							<a href="javascript:update('update.asp?num=<%response.write objrs("num")%>&aa=1&subject=<%=subject%>')"><img src="./ox/oo.PNG" width="20" height="20"></a>
						<%end if%>
					</td>
				<%else%>
					<td>
						<%if session("uid") = "" then%>
							<img src="./ox/xx.PNG" width="20" height="20" onclick="no()">
						<%elseif StrComp(objrs("id"), session("uid")) = 0 Then%>
							<a href="javascript:modify('update.asp?num=<%response.write objrs("num")%>&aa=0&subject=<%=subject%>')"><img src="./ox/ss.PNG" width="20" height="20"></a>
						<%else%>
							<img src="./ox/xx.PNG" width="20" height="20">
						<%end if%>
					</td>
				<%end if%>
				
					<%if i mod 10 = 0 then%>
					</tr><tr>
					<%end if%>
					<%objrs.movenext%>
				<%next%>
			</tr>
		</table>
		<br><br><br><br><br><br><center><hr width=900><br></center><br>
		<center>ȸ��Ұ� &nbsp;&nbsp; ä������ &nbsp;&nbsp; ������ &nbsp;&nbsp; ���޹��� &nbsp;&nbsp; �̿���
		&nbsp;&nbsp; ������ &nbsp;&nbsp; ����������޹�ħ  &nbsp;&nbsp; ��������</center><br><br>
		<center>copyright 2014 HOSEO SP. All Rights reserved.</center>
	</body>
</html>