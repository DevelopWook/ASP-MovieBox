<%OPTION Explicit

'-------------------------게시판 기능 상세보기------------------------------------
'1. 전송된 게시판 이름을 변수에 저장
'2. 게시판의 상세 정보를 DB에 질의하고 레코드셋에 저장
'3. 게시판 상세 정보를 변수에 저장
'4. 레코드셋 개체 소멸
'---------------------------------------------------------------------------------

'1. 전송된 게시판 이름을 변수에 저장
Dim BoardName
BoardName = Request("BoardName")

'2. 게시판의 상세 정보를 DB에 질의하고 레코드셋에 저장
Dim objRs, strConn, strSQL

Set objRs = Server.CreateObject("ADODB.Recordset")

strConn = "Provider=SQLOLEDB.1;Data Source=Localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
strSQL = "SELECT * FROM BoardType WHERE TBoardName='" & BoardName & "'"
objRs.Open strSQL, strConn

'3. 게시판 상세 정보를 변수에 저장
Dim TFileUpEnable, TBoardDesc, TReplyEnable, TAccessLevel

TBoardDesc = objRs("TBoardDesc")
TReplyEnable = objRs("TReplyEnable")
TFileUpEnable = objRs("TFileUpEnable")
TAccessLevel = objRs("TAccessLevel")

'4. 레코드셋 개체 소멸
objRs.Close
Set objRs = Nothing
%>
<html>
<head>
<title>ASP 프로그래밍</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script language="javascript">
//입력 정보를 검사하는 함수
function checkInfo(){
	if(ModifyBoard.TBoardName.value.length < 2){
		errName.innerHTML="게시판 이름은 2글자 이상으로 입력하세요.";
		return false;
	}
	ModifyBoard.submit();
}
</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>

<!--게시판 수정 폼 시작-->
		<h3>게시판 기능 상세 보기<hr noshade></h3>
		<form name="ModifyBoard" action="BrdTypeModifyProc.asp" method="get" onSubmit="return checkInfo()">
		<table width="600" border="0" cellspacing="1" cellpadding="0"  bgcolor="#999999" align="center">
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">게시판이름</td>
		    <td width="100%">
				<input type="text" name="TBoardName" size="30" readonly maxlength="30" value="<%=BoardName%>">
				<span id="errName" style="color:red;"></span>
			</td>
		  </tr>
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">답변글</td>
		    <td width="100%"><input name="TReplyEnable" type="radio" value="1" <%If TReplyEnable Then%>checked<%End If%>>가능 
		        <input name="TReplyEnable" type="radio" value="0" <%If TReplyEnable=0 Then%>checked<%End If%>>불가능</td>
		  </tr>
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">접근레벨</td>
		    <td width="100%">
				<input name="TAccessLevel" type="radio" value="Admin" <%If TAccessLevel="Admin" Then%>checked<%End If%>>관리자만 쓰기 가능
		        <input name="TAccessLevel" type="radio" value="User" <%If TAccessLevel="User" Then%>checked<%End If%>>일반회원 이상 쓰기 가능 
		    </td>
		  </tr>
		  <tr bgcolor="#ffffff">
		    <td nowrap bgcolor="#fefeee">상세설명</td>
		    <td width="100%">
				<textarea name="TBoardDesc" cols="60" rows="5" id="TBoardDesc"><%=TBoardDesc%></textarea>
			</td>
		  </tr>
		</table>
		<br>
		<center>
			<input type="submit" value="수정하기" class="button">&nbsp;&nbsp;
			<input type="button" value="목록으로" onClick="history.back();" class="button">&nbsp;&nbsp;
			<input type="button" value="삭제하기" class="button" onClick="if(confirm('이 게시판을 삭제하시겠습니까?')){location.href='/Admin/BrdTypeDelProc.asp?boardname=<%=boardname%>'}">
		</center>
		</form>
<!--게시판 수정 폼 끝-->
    </td>
  </tr>
</table>
</body>
</html>