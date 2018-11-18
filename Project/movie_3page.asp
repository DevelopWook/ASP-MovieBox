<html>
	<head>
		<meta charset='utf-8'>
		<link href="css/bootstrap-ko.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.css" rel="stylesheet">
		<title>영화</title>
		<script language=javascript>
			function open_wolves()
			{
				win=window.open("movie_wolves_info.asp", "", "width=950 height=600 left=225 top=50");
			}
			function open_lovers()
			{
				win=window.open("movie_lovers_info.asp", "", "width=950 height=600 left=225 top=50");
			}
			function open_other()
			{
				win=window.open("movie_other_info.asp", "", "width=950 height=600 left=225 top=50");
			}
			function open_pa()
			{
				win=window.open("movie_pa_info.asp", "", "width=950 height=600 left=225 top=50");
			}
			function open_pury()
			{
				win=window.open("movie_pury_info.asp", "", "width=950 height=600 left=225 top=50");
			}
			function open_rosie()
			{
				win=window.open("movie_rosie_info.asp", "", "width=950 height=600 left=225 top=50");
			}
		</script>
	</head>
	<body leftmargin=170 rightmargin=200>
	<br><br><br><br><br>
		<center>
			<table cellspacing=20>
				<tr>
					<td>
						<img src="img_movie/wolves.jpg"><br><br>
						<center><img src="img_movie/sang.jpg" onmouseover="this.src='img_movie/sang2.PNG'" onmouseout="this.src='img_movie/sang.jpg'"
									onclick="open_wolves()" style="cursor:hand" > &nbsp;
						<a href='movie_reserve.asp#wol' target=bottom>
						<img src="img_movie/yae.PNG" onmouseover="this.src='img_movie/yae2.PNG'" onmouseout="this.src='img_movie/yae.PNG'"></a></center>
					</td>
					<td>
						<img src="img_movie/rosie.jpg"><br><br>
						<center><img src="img_movie/sang.jpg" onmouseover="this.src='img_movie/sang2.PNG'" onmouseout="this.src='img_movie/sang.jpg'"
									onclick="open_rosie()" style="cursor:hand"> &nbsp;
						<a href='movie_reserve.asp#love' target=bottom>
						<img src="img_movie/yae.PNG" onmouseover="this.src='img_movie/yae2.PNG'" onmouseout="this.src='img_movie/yae.PNG'"></a></center>
					</td>
					<td>
						<img src="img_movie/other.jpg"><br><br>
						<center><img src="img_movie/sang.jpg" onmouseover="this.src='img_movie/sang2.PNG'" onmouseout="this.src='img_movie/sang.jpg'"
									onclick="open_other()" style="cursor:hand"> &nbsp;
						<a href='movie_reserve.asp#other' target=bottom>
						<img src="img_movie/yae.PNG" onmouseover="this.src='img_movie/yae2.PNG'" onmouseout="this.src='img_movie/yae.PNG'"></a></center>
					</td>
				</tr>
				<tr>
					<td>
						<img src="img_movie/pa.jpg"><br><br>
						<center><img src="img_movie/sang.jpg" onmouseover="this.src='img_movie/sang2.PNG'" onmouseout="this.src='img_movie/sang.jpg'"
									onclick="open_pa()" style="cursor:hand"> &nbsp;
						<a href="movie_reserve.asp#pa" target=bottom>
						<img src="img_movie/yae.PNG" onmouseover="this.src='img_movie/yae2.PNG'" onmouseout="this.src='img_movie/yae.PNG'"></a></center>
					</td>
					<td>
						<img src="img_movie/pury.jpg"><br><br>
						<center><img src="img_movie/sang.jpg" onmouseover="this.src='img_movie/sang2.PNG'" onmouseout="this.src='img_movie/sang.jpg'"
									onclick="open_pury()" style="cursor:hand"> &nbsp;
						<a href='movie_reserve.asp#pury' target=bottom>
						<img src="img_movie/yae.PNG" onmouseover="this.src='img_movie/yae2.PNG'" onmouseout="this.src='img_movie/yae.PNG'"></a></center>
					</td>
					<td>
						<img src="img_movie/lovers.jpg"><br><br>
						<center><img src="img_movie/sang.jpg" onmouseover="this.src='img_movie/sang2.PNG'" onmouseout="this.src='img_movie/sang.jpg'"
									onclick="open_lovers()" style="cursor:hand"> &nbsp;
						<a href='movie_reserve.asp#lovers' target=bottom>
						<img src="img_movie/yae.PNG" onmouseover="this.src='img_movie/yae2.PNG'" onmouseout="this.src='img_movie/yae.PNG'"></a></center>
					</td>
				</tr>
			</table>
		<br><br><br>
		<div class="pagination">
		  <ul>
			<li><a href="/movie_2page.asp" target=bottom>Prev</a></li>
			<li><a href="/movie_1page.asp" target=bottom>1</a></li>
			<li><a href="/movie_2page.asp" target=bottom>2</a></li>
			<li class="active"><a href="#">3</a></li>
			<li class="disabled"><a href="#">Next</a></li>
		  </ul>
		</div>
		</center><br><br>
		<br><hr width=1000><br><br>
		<center>회사소개 &nbsp;&nbsp; 채용정보 &nbsp;&nbsp; 광고문의 &nbsp;&nbsp; 제휴문의 &nbsp;&nbsp; 이용약관
		&nbsp;&nbsp; 편성기준 &nbsp;&nbsp; 개인정보취급방침  &nbsp;&nbsp; 법적고지</center><br><br>
		<center>copyright 2014 HOSEO SP. All Rights reserved.</center>
	</body>
</html>