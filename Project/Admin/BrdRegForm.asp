<html>
<head>
<title>ASP ���α׷��� : �Խ��� ��� ������</title>
<link rel=StyleSheet HREF=/inc/style.css type=text/css title=style>
<script language="javascript">
//�Է� ������ �˻��ϴ� �Լ� - �Խ��� �̸��� �Է��ϸ� �������� ���õǾ� �����Ƿ� �ٷ� ������
function checkInfo(){
	if(RegBoard.TBoardName.value.length < 2){
		errName.innerHTML="�Խ��� �̸��� 2���� �̻����� �Է��ϼ���.";
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

<!--�Խ��� ��� �� ����-->
<h3>�Խ��� ��� �ϱ�<hr noshade></h3>
<form name="RegBoard" action="BrdRegProc.asp" method="post" onSubmit="return checkInfo()">
<table width="600" border="0" cellspacing="1" cellpadding="0"  bgcolor="#999999" align="center">
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�Խ����̸�</td>
    <td width="100%">
		<input type="text" name="TBoardName" size="30" maxlength="30" value="<%=TBoardName%>" >
		<span id="errName" style="color:red;"></span>
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">��۾���</td>
    <td width="100%"><input name="TReplyEnable" type="radio" value="1" checked>���� 
        <input name="TReplyEnable" type="radio" value="0">�Ұ���</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">���Ͼ��ε�</td>
    <td width="100%">
		<input name="TFileUpEnable" type="radio" value="1"checked>����
		<input name="TFileUpEnable" type="radio" value="0">�Ұ���
	</td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">���ٷ���</td>
    <td width="100%">
		<input name="TAccessLevel" type="radio" value="Admin">�����ڸ� ���� ����
        <input name="TAccessLevel" type="radio" value="User" checked>�Ϲ�ȸ�� �̻� ���� ���� 
    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td nowrap bgcolor="#fefeee">�󼼼���</td>
    <td width="100%">
		<textarea name="TBoardDesc" cols="60" rows="5" id="TBoardDesc"></textarea>
	</td>
  </tr>
</table>
<br>
<center>
	<input type="submit" value="�Խ��ǵ���ϱ�" >&nbsp;&nbsp;
	<input type="button" value="�������" onClick="history.back();">
</center>
</form>
<!--�Խ��� ��� �� ��-->

    </td>
  </tr>
</table>
</body>
</html>