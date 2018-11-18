<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/styles.css">
    <!-- 위에 파란색 -->
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="/script.js"></script>
   <title>영화 예매사이트</title>
   <script>
		var win=null
		function openWin(src)
		{
			if(src == "/mem/LoginForm.asp")
				win=window.open(""+src+"", "win", "top=200 left=450 width=350 height=150 ");
			else
				win=window.open(""+src+"", "win", "top=150 left=250 width=800 height=400 ");
		}
		function no()
		{
			alert('내부 공사중입니다');
		}
   </script>
</head>
	<body>
					
					
					
					
	<%if session("uid") = "" then %>
		<table align=center width="1000" >
			<tr>
				<td>
					<div id='cssmenu'>
						<ul>
							<li><img src="img_movie/logo.PNG"></li>
							<li><a href="/bottom.asp" target=bottom><span style="font-size:180%; font-family:"굴림체";>Home</span></a></li>
							<li><a href='/movie_1page.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Movie</span></a></li>
							<li><a href='/movie_reserve.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Reservation</span></a></li>
							<li><a href='/Board/BoardList.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Board</span></a></li>
							<li><a href='#'><span style="font-size:180%; font-family:"굴림체"; onclick="no()">Event</span></a></li>
							<li><a href='#' onclick="openWin('/mem/LoginForm.asp')"><span style="font-size:180%; font-family:"굴림체";>Login</span></a></li>
							<li><a href='/mem/RegMemForm.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Join</span></a></li>
						</ul>
					</div>
				</td>
			</tr>
		</table>
	<%elseif session("uid") = "admin" then%>
		<table align=center width="1100" >
			<tr>
				<td>
					<div id='cssmenu'>
						<ul>
							<li><img src="img_movie/logo.PNG"></li>
							<li><a href="/bottom.asp" target=bottom><span style="font-size:180%; font-family:"굴림체";>Home</span></a></li>
							<li><a href='movie_1page.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Movie</span></a></li>
							<li><a href='movie_reserve.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Reservation</span></a></li>
							<li><a href='/Admin/BrdTypeList.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Board</span></a></li>
							<li><a href='#'><span style="font-size:180%; font-family:"굴림체"; onclick="no()">Event</span></a></li>
							<li><a href='/Admin/MemberList.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>MemberList</span></a></li>
							<li><a href='/mem/LogoutProc.asp' onclick="parent.bottom.location='/bottom.asp'"><span style="font-size:180%; font-family:"굴림체";>Logout</span></a></li>
						</ul>	
					</div>
				</td>
			</tr>
		</table>
	<%else%>
		<table align=center width="950" >
			<tr>
				<td>
					<div id='cssmenu'>
						<ul>
							<li><img src="img_movie/logo.PNG"></li>
							<li><a href="/bottom.asp" target=bottom><span style="font-size:180%; font-family:"굴림체";>Home</span></a></li>
							<li><a href='/movie_1page.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Movie</span></a></li>
							<li><a href='/movie_reserve.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Reservation</span></a></li>
							<li><a href='/Board/BoardList.asp' target=bottom><span style="font-size:180%; font-family:"굴림체";>Board</span></a></li>
							<li><a href='#'><span style="font-size:180%; font-family:"굴림체"; onclick="no()">Event</span></a></li>
							<li><a href='/mem/LogoutProc.asp' onclick="parent.bottom.location='/bottom.asp'"><span style="font-size:180%; font-family:"굴림체";>Logout</span></a></li>
						</ul>
				</td>
			</tr>
		</table>
		<%end if%>
	</body>
</html>