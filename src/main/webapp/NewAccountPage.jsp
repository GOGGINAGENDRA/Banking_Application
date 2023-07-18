<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
fieldset{width:98%;}
</style>
</head>
<body>
<div align="center">
<fieldset style="background-color:blue">
<h1 style="color:white" >SBI BANK</h1>
<h2 style="color:pink">EXTRORDINARY SERVICE..</h2></fieldset>
<fieldset style="background-color:gray">
<table style="height:40px"  cellspacing="30%">
<tr>
<td>
<a href="">HOME</a>
</td>
<td>
<a href="NewAccountPage.jsp">NEW_ACCOUNT</a>
</td>
<td>
<a href="balance.jsp">BALANCE</a>
</td>
<td>
<a href="Deposite.jsp">DEPOSIT</a>
</td>
<td>
<a href="Withdraw.jsp">WITHDRAW</a>
</td>
<td>
<a href="Transfer.jsp">TRANSFER</a>
</td>
<td>
<a href="Close.jsp">CLOSE_A/C</a>
</td>
<td>
<a href="">ABOUT_US</a>
</td>
</tr>
</table>
</fieldset>
</div>
<script type="text/javascript">

function check(){
	var v1=f.acc.value;
	var v2=f.uname.value;
	var v3=f.psw.value;
	var v4=f.cnfpsw.value;
	var v5=f.amt.value;
	var v6=f.addr.value;
	var v7=f.mno.value;
	var v8=f.sts.value;
	
	if(v1==""){
		alert("please enter your account number");
		return false;
	}
	if(v2==""){
		alert("please enter your name");
		return false;
	}
	if(v3==""){
		alert("please enter your password");
		return false;
	}
	if(v4==""){
		alert("please enter your confirm password");
		return false;
	}
	if(v3!=v4){
		alert("please enter password and cnfpasswod must be same");
		return false;
	}
	if(v5==""){
		alert("please enter your amount");
		return false;
	}
	if(v6==""){
		alert("please enter your address");
		return false;
	}
	if(v7==""){
		alert("please enter your mobile_no");
		return false;
	}
	if(v8==""){
		alert("please enter your status");
		return false;
	}
}
</script>
<div align="center">
<fieldset>
<h1 style="color:red">OPEN ACCOUNT FORM</h1>
<form action="NewAccountPageCode.jsp" method="post" name="f" onsubmit="return check()">
<table>
<tr>
<td>Account_Number :</td>
<td><input type="text" name="acc"></td>
</tr>
<tr>
<td>Name :</td>
<td><input type="text" name="uname"></td>
</tr>
<tr>
<td>Password :</td>
<td><input type="password" name="psw"></td>
</tr>
<tr>
<td>Confirm_Password :</td>
<td><input type="password" name="cnfpsw"></td>
</tr>
<tr>
<td>Amount :</td>
<td><input type="text" name="amt"></td>
</tr>
<tr>
<td>Address :</td>
<td><input type="text" name="addr"></td>
</tr>
<tr>
<td>Mobile No :</td>
<td><input type="text" name="mno"></td>
</tr>
<td>Status :</td>
<td><input type="text" name="sts"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Submit">
    <input type="reset" value="Clear"></td>
</tr>
</table>
</form>
</fieldset>
</div>
</body>
</html>