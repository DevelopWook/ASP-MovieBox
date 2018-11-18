<%OPTION EXPLICIT
'--------------------------------회원 정보 수정 폼--------------------------------
'1.전송된 회원 아이디 확인
'2.회원 테이블에서 회원 아이디에 해당하는 회원 정보 질의후 레코드셋에 저장
'3.레코드셋에 저장된 정보를 변수에 저장
'4.레코드셋 개체 소멸
'---------------------------------------------------------------------------------

'1.
Dim uid
uid = Request("uid")

'2.
Dim objRs, strConn, strSql
Set objRs = Server.CreateObject("ADODB.Recordset")

strConn = "Provider=SQLOLEDB.1;Data Source=Localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "SELECT * FROM Members WHERE uid='" & uid & "'"
objRs.Open strSQL, strConn

'3.
Dim upwd, uname, ussn1, ussn2, uemail, uaddr, phone, cell
upwd = objRs("upwd")
uname = objRs("uname")
ussn1 = Left(objRs("ussn"),6)
ussn2 = Right(objRs("ussn"),7)
uemail = objRs("uemail")
uaddr = objRs("uaddr")
phone = split(objRs("uphone"),"-")
cell = split(objRs("ucellphone"), "-")

'4.
objRs.Close
Set objRs = Nothing
%>
<html>
<head>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script>
//주소 찾기 창을 여는 함수
function findAddr(){
	window.open("findAddr.asp","fa", "width=418,height=300,toolbar=no,scrollbars=yes,resizable=no");
}

//입력값 확인을 위한 정규식 검색 함수
function checkValue(theObj,regExp,errSpan, errMsg){
	if (theObj.search(regExp)==-1){
		errSpan.innerHTML = errMsg;
		return false;
	}else{
		return true;
	}
}

//입력갑 검증 함수
function checkInfo(){
	//이메일 형식 확인
	(!checkValue(RegMem.email.value, /^([_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+)$/, erremail, "이메일은 [아이디@도메인] 형태로 입력하세요.") ? err+=1 : errssn.innerHTML = ""); 

	//연락처1 확인
	(!checkValue(RegMem.phone1.value+RegMem.phone2.value+RegMem.phone3.value, /^(0[2-9]\d{0,1})([1-9]\d{2,3})(\d{4})$/, errphone, "연락처는 [(지역번호)국번-번호]의 형태로 정확히 입력하세요.") ? err+=1 : errphone.innerHTML = "");

	//연락처2 확인
	(!checkValue(RegMem.cell2.value + RegMem.cell3.value, /^([1-9]{7,8})$/, errcell, "휴대폰번호는 국번과 번호를 정확히 입력하세요.") ? err+=1 : errcell.innerHTML = "");

	RegMem.submit();
}
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>

<!--회원 정보 수정 폼 시작-->
<h3>회원 정보 수정<hr noshade></h3>
<form name="RegMem" action="ModifyMemProc.asp" method="post" onSubmit="return checkInfo()">
<table width="600" border="0" cellspacing="1" cellpadding="0"  bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">아이디</td>
    <td width="100%"><input type="text" name="uid"  readonly value="<%=uid%>"></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">비밀번호</td>
    <td width="100%"><input type="password" name="pwd1" value="<%=upwd%>"> 확인<input type="password" name="pwd2"  value="<%=upwd%>"></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">이름</td>
    <td width="100%"><input type="text" name="name" readonly value="<%=uname%>"></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">주민등록번호</td>
    <td width="100%">
		<input type="text" name="ussn1" size="6" maxlength="6" readonly value="<%=ussn1%>">-
		<input type="text" name="ussn2" size="7" maxlength="7" readonly value="<%=ussn2%>">
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">이메일</td>
    <td width="100%">
		<input type="text" name="email" value="<%=uemail%>">
		<span id="erremail" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">주소</td>
    <td width="100%">
		<input type="text" size="50" name="addr1"  value="<%=uaddr%>">
		<input type="button" value="주소찾기" onClick="findAddr()">
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">연락처1</td>
    <td width="100%">
		<input type="text" name="phone1" size="3" maxlength="3" value="<%=phone(0)%>">-
		<input type="text" name="phone2" size="3" maxlength="3" value="<%=phone(1)%>">-
		<input type="text" name="phone3" size="3" maxlength="3" value="<%=phone(2)%>">
		<span id="errphone" style="color:red;"></span>
    </td>
    
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">연락처2</td>
    <td width="100%">
		<select name="cell1">
			<option value="010" <%If cell(0)="010" Then%>selected<%End If%>>010</option>
			<option value="011" <%If cell(0)="011" Then%>selected<%End If%>>011</option>
			<option value="017" <%If cell(0)="016" Then%>selected<%End If%>>017</option>			
			<option value="017" <%If cell(0)="017" Then%>selected<%End If%>>017</option>
			<option value="018" <%If cell(0)="018" Then%>selected<%End If%>>018</option>
			<option value="019" <%If cell(0)="019" Then%>selected<%End If%>>019</option>
		</select>-
		<input type="text" name="cell2" size="4" maxlength="4" value="<%=cell(1)%>">-
		<input type="text" name="cell3" maxlength="4" size="4" value="<%=cell(2)%>">
		<span id="errcell" style="color:red;"></span>
	</td>
  </tr>
</table>
<br>
<center><input type="submit" onclick="alert('회원정보 수정이 완료 되었습니다.');" value="수정완료">&nbsp;&nbsp;
<%If Session("UserLevel") = "Admin" Then%>
<input type="button" value="목록으로" OnClick="history.back();">&nbsp;&nbsp;
<%End If%>
<input type="button" value="회원탈퇴" onClick="if(confirm('정말 회원 탈퇴하시겠습니까?')){location.href='/mem/ToQuitProc.asp?uid=<%=uid%>'}"></center>
</form>
<!--회원 정보 수정 폼 끝-->
    </td>
  </tr>
</table>
</body>
</html>