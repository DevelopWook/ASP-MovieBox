<%
'----------------------------------ȸ�� ��� ������--------------------------------------
'
'���� HTML ������������ ���Խ��� �̿��Ͽ� �Է°��� �����ϰ�
'<span> �±� ������ ���� ������ �Է��ϴ� ���뿡 ������ ��.
'
'----------------------------------------------------------------------------------------

%>
<html>
<head>
<title>ASP ���α׷���</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script language="javascript">
//�Է°� Ȯ���� ���� ���Խ� �˻� �Լ�
function checkValue(theObj,regExp,errSpan, errMsg){
	if (theObj.search(regExp)==-1){ //���� ������ ��ġ���� ������ -1�� ����
		errSpan.innerHTML = errMsg; //���� �޽��� ��� ��ҿ� ���� �޽��� ����ϰ�
		return false;               //false ���� ��ȯ��
	}else{
		return true;                //�ƹ� ������ ������ true ���� ��ȯ��
	}
}

//�Է±��� �ѱ����� �˻��ϴ� �Լ�
function checkHangul(str){
	if (str.length >= 3){
		for (i=0;i<str.length;i++){	
				strCode = str.charCodeAt(i)
				if ((strCode > 0) && (strCode < 255)){ //0~255 ���̰��� ����, ����
					errname.innerHTML = "�̸��� �ѱ� 3-12�ڷ� �Է��ϼ���."; 
					return false;
					break;
				}
		}
		return true;
	}else{
		errname.innerHTML = "�̸��� �ѱ� 3-12�ڷ� �Է��ϼ���.";
		return false;
	}
}

//ȸ�� ���� �Է� ������ �˻��ϴ� �Լ�
function checkInfo(){
	
	//���� ������ ������ err���� ����
	var err;
	err = 0;

	//ȸ�� ���̵� �˻�
	(!checkValue(RegMem.uid.value, /^(\w{4,12})$/, erruid, "ȸ��ID�� ������ ���� 4-12���ڷ� �Է��ϼ���.") ? err+=1 : erruid.innerHTML="");

	//��й�ȣ �˻�
	if(RegMem.pwd1.value == RegMem.pwd2.value){	
		if(!checkValue(RegMem.pwd1.value, /^([1-9a-zA-Z]{4,12})$/, errpwd, "��й�ȣ�� ������ ���� 4-12���ڷ� �Է��ϼ���.")){
			err+=1;
		}else{
			errpwd.innerHTML = "";
		};
	}else{
		errpwd.innerHTML = "��й�ȣ�� ��Ȯ���� �ʽ��ϴ�.";
		err += 1;
	}

	//�̸��� �ѱ����� Ȯ��
	(!checkHangul(RegMem.name.value) ? err+=1 : errname.innerHTML = "");

	//�ֹε�Ϲ�ȣ Ȯ��
	(!checkValue(RegMem.ssn1.value + RegMem.ssn2.value, /^\d{13}$/, errssn, "�ֹι�ȣ : ������ ��ġ ���� �ʽ��ϴ�.") ? err+=1 : errssn.innerHTML = "");

	//�̸��� ���� Ȯ��
	(!checkValue(RegMem.email.value, /^([\._a-zA-Z0-9]+@[\.a-zA-Z0-9]+\.[a-zA-Z]+)$/, erremail, "�̸����� [���̵�@������] ���·� �Է��ϼ���.") ? err+=1 : erremail.innerHTML = ""); 

	//����ó1 Ȯ��
	(!checkValue(RegMem.phone1.value+RegMem.phone2.value+RegMem.phone3.value, /^(0[2-9]\d{0,1})([1-9]\d{2,3})(\d{4})$/, errphone, "����ó�� [(������ȣ)����-��ȣ]�� ���·� ��Ȯ�� �Է��ϼ���.<font>") ? err+=1 : errphone.innerHTML = "");

	//����ó2 Ȯ��
	(!checkValue(RegMem.cell2.value + RegMem.cell3.value, /^([0-9]{7,8})$/, errcell, "�޴�����ȣ�� ������ ��ȣ�� ��Ȯ�� �Է��ϼ���.") ? err+=1 : errcell.innerHTML = "");

	//���̵� �ߺ� Ȯ��
	if(RegMem.uniqueID.value == 0){
		errunique.innerHTML = "���̵� �ߺ� Ȯ�� �ϼ���.";
		err+=1;
	}else{
		errunique.innerHTML = "";
	};

	//�ּ� ã�� Ȯ��
	if(RegMem.addr1.value.length == 0){
		erraddr.innerHTML = "�ּ� ã��� �ּҸ� �Է��ϼ���."
		err+=1;	
	}else if(RegMem.addr2.value.length < 2){
		erraddr.innerHTML = "�� �ּҸ� �Է��ϼ���."
		err+=1;
	}else{
		erraddr.innerHTML = "";
	};
	
	//�߻��� ������ ������ ȸ�� ���
	if(err == 0){
		document.RegMem.submit();
	}else{
		erraddr.innerHTML = "";
		return false();
	};
}

//���̵� �ߺ� Ȯ�� �������� ���� �Լ�
function checkUnique(){
	if(RegMem.uid.value.length >=4){
		window.open("CheckUnique.asp?uid=" + RegMem.uid.value, "cu", "left=20000,top=20000,toolbar=no,resizable=no,height=200,width=300");
	}
}

//�ּ� ã�� �������� ���� �Լ�
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

<!--ȸ�� ���� �� ����-->
<h3>ȸ�� ���� ������<hr noshade></h3>
<form name="RegMem" action="/mem/RegMemProc.asp" method="get" onSubmit="return checkInfo();">
<table width="600" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">���̵�</td>
    <td width="100%">
		<input type="text" name="uid" size="12" maxlength="12" class="box" onChange="RegMem.uniqueID.value=0;errunique.innerHTML=''">
		<span id="erruid" style="color:red;"></span>
		<input type="button" value="IDȮ��" onClick="checkUnique()" class="button">
		<span id="errunique" style="color:red;"></span>
		<input type="hidden" name="uniqueID" value="0">
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">��й�ȣ</td>
    <td width="100%">
		<input type="password" size="8" maxlength="12" name="pwd1" class="box"> 
		Ȯ�� <input type="password" size="8" maxlength="12" name="pwd2" class="box">
		<span id="errpwd" style="color:red;"></span>
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td width="100%">
		<input type="text" size="8" maxlength="12" name="name"  class="box" style=ime-mode:active> 
		<span id="errname" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">�ֹε�Ϲ�ȣ</td>
    <td width="100%">
		<input type="text" name="ssn1" size="6" maxlength="6" class="box"> - 
		<input type="text" name="ssn2" size="7" maxlength="7" class="box">
		<span id="errssn" style="color:red;"></span>
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">�̸���</td>
    <td width="100%">
		<input type="text" name="email" class="box">
		<span id="erremail" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">�ּ�</td>
    <td width="100%">
		<input type="text" size="50" name="addr1" readonly class="box"> 
		<input type="button" value="�ּ�ã��" onClick="findAddr()" class="button"><br>
		 &nbsp; <input type="text" size="50" name="addr2" class="box">
		<span id="erraddr" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">����ó1</td>
    <td width="100%">
		<input type="text" name="phone1" size="3" maxlength="3" class="box"> - 
		<input type="text" name="phone2" size="4" maxlength="4" class="box"> - 
		<input type="text" name="phone3" maxlength="4" size="4" class="box">
		<span id="errphone" style="color:red;"></span>		
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee" align="center">����ó2</td>
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
<input name="Ȯ��" type="submit" value="ȸ������" class="button">&nbsp;&nbsp;
<input name="�������" type="button" value="�������" class="button" onClick="location.href='/bottom.asp'">
</center>
</form>
<!--ȸ�� ���� �� ��-->
    </td>
  </tr>
</table>
</body>
</html>