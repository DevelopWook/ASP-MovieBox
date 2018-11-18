<%OPTION EXPLICIT
'---------------------------------------------------------------------------------
'1. 전송된 정보 확인
'2. 게시판 권한 확인을 위해 BoardType 테이블에 질의
'3. 반환된 자료를 파일업로드 확인 변수와 접근 레벨 확인 변수에 저장
'4. 개체 소멸
'---------------------------------------------------------------------------------

'1. 전송된 정보 확인
Dim BoardName, page, skey, sval

BoardName = Request("BoardName")
page = Request("page")
skey = Request("skey")
sval = Request("sval")

'2. 게시판 권한 확인을 위해 BoardType 테이블에 질의
Dim strSQL, strConn, objRs, TReplyEnable, TFileUpEnable, TAccessLevel
strConn = "Provider=SQLOLEDB.1;Data Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"

strSQL = "SELECT TFileUpEnable, TAccessLevel FROM BoardType WHERE TBoardName = '" & BoardName & "'"

Set objRs = Server.CreateObject("ADODB.Recordset")
objRs.Open strSQL, strConn

'3. 반환된 자료를 파일업로드 확인 변수와 접근 레벨 확인 변수에 저장
TFileUpEnable = objRs(0)
TAccessLevel = objRs(1)

'4. 개체 소멸
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
	var err
	err = 0
	if(!postForm.BSubject.value){errSubject.innerHTML = "제목을 입력하세요";err+=1};
	if(!postForm.BContent.value){errContent.innerHTML = "내용을 입력하세요";err+=1};
	
	if(err==0){
		RegBoard.submit();
	}else{
		return false;
	}
}


</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<p align="center">
</p>

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>

<!--새글 등록 폼 시작-->
<h3>새글 쓰기<hr noshade></h3>
<form name="postForm" action="./BoardPostProc2.asp" method="get" enctype="multipart/form-data" onSubmit="return checkInfo()">
<table width="600" border="0" cellspacing="1" cellpadding="0"  bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">작성자ID</td>
    <td width="100%">
		<input name="BUserID" type="text" id="BUserID" value="<%=Session("uid")%>" readonly>
		</span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">이름</td>
    <td width="100%">
       <input name="BUName" type="text" id="BUName" value="<%=Session("uname")%>" readonly>
    </span>
    </span></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">제목</td>
    <td width="100%"><span id="errName" style="color:red">
    <input name="BSubject" type="text" id="BSubject" size="70"><br>
    <span id="errSubject" style="color:red;font-weight:bold"></span>
    </span>
		</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">내용</td>
    <td width="100%">
      <textarea name="BContent" cols="70" rows="15" id="BContent"></textarea><br>
      <span id="errContent" style="color:red;font-weight:bold"></span>
    </td>
  </tr>
  <%If TFileUpEnable Then%>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">첨부파일</td>
    <td width="100%">
    <input type="file" name="file" size="50">
    </span>
	</td>
  </tr>
  <%End If%>
</table>
<br>
<center>
    <input type="hidden" name="boardname" value="<%=boardname%>">
    <input type="hidden" name="page" value="<%=page%>">
    <input type="hidden" name="skey" value="<%=skey%>">
    <input type="hidden" name="sval" value="<%=sval%>">
	<input type="submit" value="새글등록">&nbsp;&nbsp;
	<input type="button" value="목록으로" onClick="history.back();">
</center>
</form>
<!--새글 등록 폼 끝-->

    </td>
  </tr>
</table>
</body>
</html>