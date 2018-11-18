<%
'----------------------------------회원 등록 페이지--------------------------------------
'
'순수 HTML 페이지이지만 정규식을 이용하여 입력값을 검증하고
'<span> 태그 속으로 오류 내용을 입력하는 내용에 유의할 것.
'
'----------------------------------------------------------------------------------------

%>
<html>
<head>
<title>ASP 프로그래밍</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script language="javascript">
//입력값 확인을 위한 정규식 검색 함수
function checkValue(theObj,regExp,errSpan, errMsg){
	if (theObj.search(regExp)==-1){ //검증 갓ㅂ이 일치하지 않으면 -1이 나옴
		errSpan.innerHTML = errMsg; //오류 메시지 출력 장소에 오류 메시지 출력하고
		return false;               //false 값을 반환함
	}else{
		return true;                //아무 오류가 없으면 true 값을 반환함
	}
}

//입력글이 한글인지 검색하는 함수
function checkHangul(str){
	if (str.length >= 3){
		for (i=0;i<str.length;i++){	
				strCode = str.charCodeAt(i)
				if ((strCode > 0) && (strCode < 255)){ //0~255 사이값은 영문, 숫자
					errname.innerHTML = "이름은 한글 3-12자로 입력하세요."; 
					return false;
					break;
				}
		}
		return true;
	}else{
		errname.innerHTML = "이름은 한글 3-12자로 입력하세요.";
		return false;
	}
}

//회원 가입 입력 정보를 검사하는 함수
function checkInfo(){
	
	//오류 개수를 저장할 err변수 선언
	var err;
	err = 0;

	//회원 아이디 검사
	(!checkValue(RegMem.uid.value, /^(\w{4,12})$/, erruid, "회원ID는 영문과 숫자 4-12글자로 입력하세요.") ? err+=1 : erruid.innerHTML="");

	//비밀번호 검사
	if(RegMem.pwd1.value == RegMem.pwd2.value){	
		if(!checkValue(RegMem.pwd1.value, /^([1-9a-zA-Z]{4,12})$/, errpwd, "비밀번호는 영문과 숫자 4-12글자로 입력하세요.")){
			err+=1;
		}else{
			errpwd.innerHTML = "";
		};
	}else{
		errpwd.innerHTML = "비밀번호가 정확하지 않습니다.";
		err += 1;
	}

	//이름이 한글인지 확인
	(!checkHangul(RegMem.name.value) ? err+=1 : errname.innerHTML = "");

	//주민등록번호 확인
	(!checkValue(RegMem.ssn1.value + RegMem.ssn2.value, /^\d{13}$/, errssn, "주민번호 : 형식이 일치 하지 않습니다.") ? err+=1 : errssn.innerHTML = "");

	//이메일 형식 확인
	(!checkValue(RegMem.email.value, /^([\._a-zA-Z0-9]+@[\.a-zA-Z0-9]+\.[a-zA-Z]+)$/, erremail, "이메일은 [아이디@도메인] 형태로 입력하세요.") ? err+=1 : erremail.innerHTML = ""); 

	//연락처1 확인
	(!checkValue(RegMem.phone1.value+RegMem.phone2.value+RegMem.phone3.value, /^(0[2-9]\d{0,1})([1-9]\d{2,3})(\d{4})$/, errphone, "연락처는 [(지역번호)국번-번호]의 형태로 정확히 입력하세요.<font>") ? err+=1 : errphone.innerHTML = "");

	//연락처2 확인
	(!checkValue(RegMem.cell2.value + RegMem.cell3.value, /^([0-9]{7,8})$/, errcell, "휴대폰번호는 국번과 번호를 정확히 입력하세요.") ? err+=1 : errcell.innerHTML = "");

	//아이디 중복 확인
	if(RegMem.uniqueID.value == 0){
		errunique.innerHTML = "아이디 중복 확인 하세요.";
		err+=1;
	}else{
		errunique.innerHTML = "";
	};

	//주소 찾기 확인
	if(RegMem.addr1.value.length == 0){
		erraddr.innerHTML = "주소 찾기로 주소를 입력하세요."
		err+=1;	
	}else if(RegMem.addr2.value.length < 2){
		erraddr.innerHTML = "상세 주소를 입력하세요."
		err+=1;
	}else{
		erraddr.innerHTML = "";
	};
	
	//발생된 오류가 없으면 회원 등록
	if(err == 0){
		document.RegMem.submit();
	}else{
		erraddr.innerHTML = "";
		return false();
	};
}

//아이디 중복 확인 페이지를 여는 함수
function checkUnique(){
	if(RegMem.uid.value.length >=4){
		window.open("CheckUnique.asp?uid=" + RegMem.uid.value, "cu", "left=20000,top=20000,toolbar=no,resizable=no,height=200,width=300");
	}
}

//주소 찾기 페이지를 여는 함수
function findAddr(){
	window.open("findAddr.asp","fa", "width=418,height=300,toolbar=no,scrollbars=yes,resizable=no");
	
}
</script>
</head>
<body>
<p align="center">

</p>

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>

<!--회원 가입 폼 시작-->
<h3>회원 가입 페이지<hr noshade></h3>
<form name="RegMem" action="/mem/RegMemProc.asp" method="get" onSubmit="return checkInfo();">
<table width="600" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">아이디</td>
    <td width="100%">
		<input type="text" name="uid" size="12" maxlength="12" class="box" onChange="RegMem.uniqueID.value=0;errunique.innerHTML=''">
		<span id="erruid" style="color:red;"></span>
		<input type="button" value="ID확인" onClick="checkUnique()" class="button">
		<span id="errunique" style="color:red;"></span>
		<input type="hidden" name="uniqueID" value="0">
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">비밀번호</td>
    <td width="100%">
		<input type="password" size="8" maxlength="12" name="pwd1" class="box"> 
		확인 <input type="password" size="8" maxlength="12" name="pwd2" class="box">
		<span id="errpwd" style="color:red;"></span>
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">이&nbsp;&nbsp;&nbsp;&nbsp;름</td>
    <td width="100%">
		<input type="text" size="8" maxlength="12" name="name"  class="box" style=ime-mode:active> 
		<span id="errname" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">주민등록번호</td>
    <td width="100%">
		<input type="text" name="ssn1" size="6" maxlength="6" class="box"> - 
		<input type="text" name="ssn2" size="7" maxlength="7" class="box">
		<span id="errssn" style="color:red;"></span>
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">이메일</td>
    <td width="100%">
		<input type="text" name="email" class="box">
		<span id="erremail" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">주소</td>
    <td width="100%">
		<input type="text" size="50" name="addr1" readonly class="box"> 
		<input type="button" value="주소찾기" onClick="findAddr()" class="button"><br>
		 &nbsp; <input type="text" size="50" name="addr2" class="box">
		<span id="erraddr" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">연락처1</td>
    <td width="100%">
		<input type="text" name="phone1" size="3" maxlength="3" class="box"> - 
		<input type="text" name="phone2" size="4" maxlength="4" class="box"> - 
		<input type="text" name="phone3" maxlength="4" size="4" class="box">
		<span id="errphone" style="color:red;"></span>		
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">연락처2</td>
    <td width="100%">
		<select name="cell1" class="box">
			<option value="010">010</option>
			<option value="011" selected>011</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select> - 
		<input type="text" name="cell2" size="4" maxlength="4" class="box"> - 
		<input type="text" name="cell3" maxlength="4" size="4" class="box"> 
		<span id="errcell" style="color:red;"></span>
	</td>
  </tr>
</table>
<br>
<center>
<input name="확인" type="submit" value="회원가입" class="button">&nbsp;&nbsp;
<input name="가입취소" type="button" value="가입취소" class="button" onClick="location.href='/bottom.asp'">
</center>
</form>
<!--회원 가입 폼 끝-->
    </td>
  </tr>
</table>
</body>
</html>