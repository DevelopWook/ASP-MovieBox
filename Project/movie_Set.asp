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
		if(confirm("예매 하시겠습니까?"))
		{
			document.location.href=xx;
		}
	}
	function modify(xx)
	{
		if(confirm("예매를 취소 하시겠습니까?"))
		{
			document.location.href=xx;
		}
	}
	function no()
	{
		alert('로그인후 이용해 주세요');
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
		<center>회사소개 &nbsp;&nbsp; 채용정보 &nbsp;&nbsp; 광고문의 &nbsp;&nbsp; 제휴문의 &nbsp;&nbsp; 이용약관
		&nbsp;&nbsp; 편성기준 &nbsp;&nbsp; 개인정보취급방침  &nbsp;&nbsp; 법적고지</center><br><br>
		<center>copyright 2014 HOSEO SP. All Rights reserved.</center>
	</body>
</html>