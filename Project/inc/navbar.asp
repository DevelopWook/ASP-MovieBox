<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <!--�� ����Ʈ Ÿ��Ʋ ASP ���α׷��� �κ� ����-->
    <td width="40%">
		<a href="http://localhost/default.asp" style="text-decoration='none'">
		<span class="title">ASP</span>
		<span style="color: #666666; font-weight: bold; font:����ü;font-size:14px">���α׷���</span>
		</a>
	</td>
	<!--�� ����Ʈ Ÿ��Ʋ ��-->
	<!--��� ���κ� �޴� ����-->
	<td align="right" valign="top" style="font-size:12px; color:#999999; font-weight:lighter; line-height:160%">
		| 
		<%If Session("UserLevel") = "" Then%>
			<a href="/mem/RegMemForm.asp">ȸ������</a> | 
		<%ElseIf Session("UserLevel") = "User" Then%>
			<a href="/mem/ModifyMemForm.asp?uid=<%=Session("uid")%>">������������</a> |
		<%ElseIf Session("UserLevel") = "Admin" Then%>
			<a href="/admin/MemberList.asp">ȸ������</a> |
			<a href="/admin/BrdTypeList.asp">�Խ��ǰ���</a> | 
		<%End If%>
		<a href="/Board/BoardList.asp?boardname=�����Խ���">�����Խ���</a> | 
		<a href="/Board/BoardList.asp?boardname=��������">��������</a> | 
		����Ʈ�� | 
		���κ�ȣ��å | 
		<br>
		<!--��� ���κ� �޴� ��-->
		<!--�α��� ó�� ����-->
		<script language="javascript">
		function checkLogin(){
		  if ((login.uid.value.length < 4) || (login.pwd.value.length < 4)) {
			alert("ȸ�� ������ ��Ȯ�� �Է��ϼ���");
			login.uid.focus;
			return false;
		  }else {
			login.submit;
		   }
		   
		}
		</script>
		<!--�α��� �� ��ġ-->
		<%If Session("uid") = "" Then%>
		<table border="0" cellspacing="0" cellpadding="0">
		  <form name="login" action="/mem/LoginProc.asp" method="post" onSubmit="return checkLogin()">
			<tr><td align="right" style="color:#999999; font-weight:lighter;">
				���̵� : <input type="text" size="12" maxlength="12" class="box" name="uid">&nbsp;&nbsp;
				��й�ȣ : <input type="password" size="8" maxlength="12" class="box" name="pwd">
				<input type="submit" value="�α���" class="button">
			  </td></tr>
		  </form>
		</table>
		<!--�α��� �� ��-->	
		<!--�α����� ȸ��-->
		<%Else%>
		<table border="0" cellspacing="0" cellpadding="0">
			<tr><td align="right" style="color:#999999; font-weight:lighter;">
			<b><%=Session("uid")%></b>�� 
			<%If Session("UserLevel") = "User" Then%>
				�ݰ����ϴ�.
			<%ElseIf Session("UserLevel") = "Admin" Then%>
				<font color="red"><b>�����ڸ��</b></font>�� �����ϼ̽��ϴ�.
			<%End If%>
			
			<input type="button" value="�α׾ƿ�" class="button" style="margin-top:1;margin-bottom:1"       onClick="if(confirm('�α׾ƿ��Ͻðڽ��ϱ�?')){location.href='/mem/LogoutProc.asp'}">
			</td></tr>
		</table>
		<%End If%>
		<!--�α����� ȸ�� ��-->
		<!--�α��� ó�� ��-->	
	</td>
  </tr>
</table>
<!--���� �޴� ����-->
<table width="768" cellspacing="0" cellpadding="0" border="0" align="center">
   <tr align="center" style="font:����;font-size:12px;font-weight:bold;color:#ffffff">
       <td width="300" bgcolor="#ff9900"></td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=ASP�⺻����'">&nbsp;ASP�⺻����&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=ASP��ް���'">&nbsp;ASP��ް���&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=���HTML���α׷���'">���HTML<br>&nbsp;���α׷���&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=��n��ũ'">&nbsp;��&amp;��ũ&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=��������'">&nbsp;��������&nbsp;</td>
	   <td class="sidewall" 
			onMouseOver="this.style.backgroundColor='#999999'" 
			onMouseOut="this.style.backgroundColor='#FF9900'"
			onClick="location.href='/Board/BoardList.asp?boardname=�ڷ��'">&nbsp;�ڷ��&nbsp;</td>
   </tr>
   <tr>
     <td colspan="7" height="3" bgcolor="#999999"></td>
   </tr>
   <tr>
     <td colspan="7" height="2" bgcolor="#CCCCCC"></td>
   </tr>
</table>
<!--���� �޴� ��-->
<br>