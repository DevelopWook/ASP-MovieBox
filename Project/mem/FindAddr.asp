<%
	option explicit
	
	'-----------------------�����ȣ ã��--------------------------
	'1. ���۵� �ּҸ� ����
	'2. ���۵� �ּҰ� ������ �����ȣ ���̺��� �ּ� ã��
	'3. �˻��� �ּҰ� ������ Recordset ��ü�� GetRows() �޼ҵ带 �̿��Ͽ� ����� �迭�� ����
	'			�� ���ڵ� ���� UBound() �޼ҵ带 �̿��Ͽ� Ȯ��
	'4. ���� Recordset ��ü �Ҹ�
	'5. �ּ� ������ ����� �迭�� ���� ������ �ݺ��Ͽ� �ּ� ���� ���
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
		erraddr.innerHTML = "<font color='red'>�˻���� 2���� �̻� �Է��ϼ���.</font>"
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
	    �ּҴ� ���ǵ�(��), �Ѱ���1(��), �б���(��) ��� ���� �Է�<br>
	    <input type="text" name="addr" class="box" value="<%=addr%>">
	    <input type="submit" value="�˻�" class="button"><br>
	    <span id="erraddr"></span>
    </td>
  </tr>
</table>
<br>
<%If totalRecord > 0 Then%>
<table name="addrList" width="400" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
  <tr align="center" valign="middle"  bgcolor="#fefeee">
    <td width="60">�����ȣ</td>
    <td>�ּ�</td>
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