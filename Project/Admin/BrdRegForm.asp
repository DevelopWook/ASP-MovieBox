<html>
<head>
<title>ASP 프로그래밍 : 게시판 등록 페이지</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script language="javascript">
//입력 정보를 검사하는 함수 - 게시판 이름만 입력하면 나머지는 선택되어 있으므로 바로 서밋함
function checkInfo(){
	if(RegBoard.TBoardName.value.length < 2){
		errName.innerHTML="게시판 이름은 2글자 이상으로 입력하세요.";
		return false;
	}
	RegBoard.submit();
}


</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<p align="center">
</p>

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>

<!--게시판 등록 폼 시작-->
<h3>게시판 등록 하기<hr noshade></h3>
<form name="RegBoard" action="BrdRegProc.asp" method="post" onSubmit="return checkInfo()">
<table width="600" border="0" cellspacing="1" cellpadding="0"  bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">게시판이름</td>
    <td width="100%">
		<input type="text" name="TBoardName" size="30" maxlength="30" value="<%=TBoardName%>" >
		<span id="errName" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">답글쓰기</td>
    <td width="100%"><input name="TReplyEnable" type="radio" value="1" checked>가능 
        <input name="TReplyEnable" type="radio" value="0">불가능</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">파일업로드</td>
    <td width="100%">
		<input name="TFileUpEnable" type="radio" value="1"checked>가능
		<input name="TFileUpEnable" type="radio" value="0">불가능
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">접근레벨</td>
    <td width="100%">
		<input name="TAccessLevel" type="radio" value="Admin">관리자만 쓰기 가능
        <input name="TAccessLevel" type="radio" value="User" checked>일반회원 이상 쓰기 가능 
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">상세설명</td>
    <td width="100%">
		<textarea name="TBoardDesc" cols="60" rows="5" id="TBoardDesc"></textarea>
	</td>
  </tr>
</table>
<br>
<center>
	<input type="submit" value="게시판등록하기" >&nbsp;&nbsp;
	<input type="button" value="목록으로" onClick="history.back();">
</center>
</form>
<!--게시판 등록 폼 끝-->

    </td>
  </tr>
</table>
</body>
</html>