<%
	option explicit
	
	'-----------------------우편번호 찾기--------------------------
	'1. 전송된 주소명 저장
	'2. 전송된 주소가 있으면 우편번호 테이블에서 주소 찾기
	'3. 검색된 주소가 있으면 Recordset 개체의 GetRows() 메소드를 이용하여 결과를 배열에 저장
	'			총 레코드 수를 UBound() 메소드를 이용하여 확인
	'4. 사용된 Recordset 개체 소멸
	'5. 주소 정보가 저장된 배열이 끝날 때까지 반복하여 주소 정보 출력
	'--------------------------------------------------------------
	'1. 
	Dim addr
	addr = Request("addr")
	
	'2.
	IF addr <> "" Then
		Dim objRs, strSQL, strConn
		strConn = "Provider=SQLOLEDB.1;Date Source=localhost;Initial Catalog=Movie;User ID=sa;Password=cdjsdj99"
		strSQL = "Select * From zipcode Where DONG Like '%" & addr & "%'"
		Set objRs = Server.CreateObject("ADODB.Recordset")
		objRs.Open strSQL, strConn
		
		'3.
		IF Not objRs.EOF Then
			Dim RsArray, totalRecord
			rsArray = objRs.GetRows()
			totalRecord = UBound(rsArray, 2)
		END IF
		
		'4.
		objRs.Close
		Set objRs = Nothing
	END IF
%>

<html>
<head>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script>
function find(){
	if(findAddr.addr.value.length >= 2){
		erraddr.innerHTML = "";
		findAddr.submit();
	}else{
		erraddr.innerHTML = "<font color='red'>검색어는 2글자 이상 입력하세요.</font>"
		return false;
	}
}

function chooseThis(addr){
	opener.document.RegMem.addr1.value = addr;
	window.close();
}
</script>
</head>
<body>
<form name="findAddr" action="findAddr.asp" method="get" onSubmit="return find();">
<table name="fa" width="400" border="0" cellpadding="0" bgcolor="#eeeeee">
  <tr>
	<td align="center" valign="middle">
	    주소는 여의도(동), 한강로1(가), 압구정(동) 등과 같이 입력<br>
	    <input type="text" name="addr" class="box" value="<%=addr%>">
	    <input type="submit" value="검색" class="button"><br>
	    <span id="erraddr"></span>
    </td>
  </tr>
</table>
<br>
<%If totalRecord > 0 Then%>
<table name="addrList" width="400" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
  <tr align="center" valign="middle"  bgcolor="#fefeee">
    <td width="60">우편번호</td>
    <td>주소</td>
  </tr>
  <%
    '5.  
    Dim addrVal, addrExp, zip, i
    i = 0
    Do While i<=totalRecord
		zip = rsArray(0,i)
		addrVal = rsArray(1,i) & " " & rsArray(2,i) & " " & " " & rsArray(3,i) & " " & rsArray(4,i)
		addrExp = addrVal & " " & rsArray(5,i)
  %>
  <tr bgcolor="#ffffff" 
	  onMouseOver="this.style.backgroundColor='#ffff00';this.style.cursor='hand'" 
	  onMouseOut="this.style.backgroundColor='#ffffff'"
	  onClick="chooseThis('<%="(" & zip & ") " & addrVal%>')">
    <td align="center"><%=zip%></td>
    <td><%=addrExp%></td>
  </tr>
  <%i = i + 1
	Loop%>
</table>
<%End If%>

</form>	

</body>
</html>