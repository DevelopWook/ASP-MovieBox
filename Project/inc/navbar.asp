<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <!--웹 사이트 타이틀 ASP 프로그래밍 부분 시작-->
    <td width="40%">
		<a href="http://localhost/default.asp" style="text-decoration='none'">
		<span class="title">ASP</span>
		<span style="color: #666666; font-weight: bold; font:굴림체;font-size:14px">프로그래밍</span>
		</a>
	</td>
	<!--웹 사이트 타이틀 끝-->
	<!--상단 개인별 메뉴 시작-->
	<td align="right" valign="top" style="font-size:12px; color:#999999; font-weight:lighter; line-height:160%">
		| 
		<%If Session("UserLevel") = "" Then%>
			<a href="/mem/RegMemForm.asp">회원가입</a> | 
		<%ElseIf Session("UserLevel") = "User" Then%>
			<a href="/mem/ModifyMemForm.asp?uid=<%=Session("uid")%>">개인정보변경</a> |
		<%ElseIf Session("UserLevel") = "Admin" Then%>
			<a href="/admin/MemberList.asp">회원관리</a> |
			<a href="/admin/BrdTypeList.asp">게시판관리</a> | 
		<%End If%>
		<a href="/Board/BoardList.asp?boardname=자유게시판">자유게시판</a> | 
		<a href="/Board/BoardList.asp?boardname=공지사항">공지사항</a> | 
		사이트맵 | 
		개인보호정책 | 
		<br>
		<!--상단 개인별 메뉴 끝-->
		<!--로그인 처리 시작-->
		<script language="javascript">
		function checkLogin(){
		  if ((login.uid.value.length < 4) || (login.pwd.value.length < 4)) {
			alert("회원 정보를 정확히 입력하세요");
			login.uid.focus;
			return false;
		  }else {
			login.submit;
		   }
		   
		}
		</script>
		<!--로그인 폼 위치-->
		<%If Session("uid") = "" Then%>
		<table border="0" cellspacing="0" cellpadding="0">
		  <form name="login" action="/mem/LoginProc.asp" method="post" onSubmit="return checkLogin()">
			<tr><td align="right" style="color:#999999; font-weight:lighter;">
				아이디 : <input type="text" size="12" maxlength="12" class="box" name="uid">&nbsp;&nbsp;
				비밀번호 : <input type="password" size="8" maxlength="12" class="box" name="pwd">
				<input type="submit" value="로그인" class="button">
			  </td></tr>
		  </form>
		</table>
		<!--로그인 폼 끝-->	
		<!--로그인한 회원-->
		<%Else%>
		<table border="0" cellspacing="0" cellpadding="0">
			<tr><td align="right" style="color:#999999; font-weight:lighter;">
			<b><%=Session("uid")%></b>님 
			<%If Session("UserLevel") = "User" Then%>
				반갑습니다.
			<%ElseIf Session("UserLevel") = "Admin" Then%>
				<font color="red"><b>관리자모드</b></font>로 접속하셨습니다.
			<%End If%>
			
			<input type="button" value="로그아웃" class="button" style="margin-top:1;margin-bottom:1"       onClick="if(confirm('로그아웃하시겠습니까?')){location.href='/mem/LogoutProc.asp'}">
			</td></tr>
		</table>
		<%End If%>
		<!--로그인한 회원 끝-->
		<!--로그인 처리 끝-->	
	</td>
  </tr>
</table>
<!--메인 메뉴 시작-->
<table width="768" cellspacing="0" cellpadding="0" border="0" align="center">
   <tr align="center" style="font:굴림;font-size:12px;font-weight:bold;color:#ffffff">
       <td width="300" bgcolor="#ff9900"></td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=ASP기본강좌'">&nbsp;ASP기본강좌&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=ASP고급강좌'">&nbsp;ASP고급강좌&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=고급HTML프로그래밍'">고급HTML<br>&nbsp;프로그래밍&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=팁n테크'">&nbsp;팁&amp;테크&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=질의응답'">&nbsp;질의응답&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=자료실'">&nbsp;자료실&nbsp;</td>
   </tr>
   <tr>
     <td colspan="7" height="3" bgcolor="#999999"></td>
   </tr>
   <tr>
     <td colspan="7" height="2" bgcolor="#CCCCCC"></td>
   </tr>
</table>
<!--메인 메뉴 끝-->
<br>