<%OPTION EXPLICIT
'--------------------------------ȸ�� ���� ���� ��--------------------------------
'1.���۵� ȸ�� ���̵� Ȯ��
'2.ȸ�� ���̺��� ȸ�� ���̵� �ش��ϴ� ȸ�� ���� ������ ���ڵ�¿� ����
'3.���ڵ�¿� ����� ������ ������ ����
'4.���ڵ�� ��ü �Ҹ�
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
//�ּ� ã�� â�� ���� �Լ�
function findAddr(){
	window.open("findAddr.asp","fa", "width=418,height=300,toolbar=no,scrollbars=yes,resizable=no");
}

//�Է°� Ȯ���� ���� ���Խ� �˻� �Լ�
function checkValue(theObj,regExp,errSpan, errMsg){
	if (theObj.search(regExp)==-1){
		errSpan.innerHTML = errMsg;
		return false;
	}else{
		return true;
	}
}

//�Է°� ���� �Լ�
function checkInfo(){
	//�̸��� ���� Ȯ��
	(!checkValue(RegMem.email.value, /^([_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+)$/, erremail, "�̸����� [���̵�@������] ���·� �Է��ϼ���.") ? err+=1 : errssn.innerHTML = ""); 

	//����ó1 Ȯ��
	(!checkValue(RegMem.phone1.value+RegMem.phone2.value+RegMem.phone3.value, /^(0[2-9]\d{0,1})([1-9]\d{2,3})(\d{4})$/, errphone, "����ó�� [(������ȣ)����-��ȣ]�� ���·� ��Ȯ�� �Է��ϼ���.") ? err+=1 : errphone.innerHTML = "");

	//����ó2 Ȯ��
	(!checkValue(RegMem.cell2.value + RegMem.cell3.value, /^([1-9]{7,8})$/, errcell, "�޴�����ȣ�� ������ ��ȣ�� ��Ȯ�� �Է��ϼ���.") ? err+=1 : errcell.innerHTML = "");

	RegMem.submit();
}
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<table width="768" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><p>&nbsp;</p>

<!--ȸ�� ���� ���� �� ����-->
<h3>ȸ�� ���� ����<hr noshade></h3>
<form name="RegMem" action="ModifyMemProc.asp" method="post" onSubmit="return checkInfo()">
<table width="600" border="0" cellspacing="1" cellpadding="0"  bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">���̵�</td>
    <td width="100%"><input type="text" name="uid"  readonly value="<%=uid%>"></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">��й�ȣ</td>
    <td width="100%"><input type="password" name="pwd1" value="<%=upwd%>"> Ȯ��<input type="password" name="pwd2"  value="<%=upwd%>"></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�̸�</td>
    <td width="100%"><input type="text" name="name" readonly value="<%=uname%>"></td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�ֹε�Ϲ�ȣ</td>
    <td width="100%">
		<input type="text" name="ussn1" size="6" maxlength="6" readonly value="<%=ussn1%>">-
		<input type="text" name="ussn2" size="7" maxlength="7" readonly value="<%=ussn2%>">
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�̸���</td>
    <td width="100%">
		<input type="text" name="email" value="<%=uemail%>">
		<span id="erremail" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�ּ�</td>
    <td width="100%">
		<input type="text" size="50" name="addr1"  value="<%=uaddr%>">
		<input type="button" value="�ּ�ã��" onClick="findAddr()">
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">����ó1</td>
    <td width="100%">
		<input type="text" name="phone1" size="3" maxlength="3" value="<%=phone(0)%>">-
		<input type="text" name="phone2" size="3" maxlength="3" value="<%=phone(1)%>">-
		<input type="text" name="phone3" size="3" maxlength="3" value="<%=phone(2)%>">
		<span id="errphone" style="color:red;"></span>
    </td>
    
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">����ó2</td>
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
<center><input type="submit" onclick="alert('ȸ������ ������ �Ϸ� �Ǿ����ϴ�.');" value="�����Ϸ�">&nbsp;&nbsp;
<%If Session("UserLevel") = "Admin" Then%>
<input type="button" value="�������" OnClick="history.back();">&nbsp;&nbsp;
<%End If%>
<input type="button" value="ȸ��Ż��" onClick="if(confirm('���� ȸ�� Ż���Ͻðڽ��ϱ�?')){location.href='/mem/ToQuitProc.asp?uid=<%=uid%>'}"></center>
</form>
<!--ȸ�� ���� ���� �� ��-->
    </td>
  </tr>
</table>
</body>
</html>