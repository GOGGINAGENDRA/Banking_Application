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
	var v2=f.name.value;
	var v3=f.pssd.value;
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
}
</script>
<div align="center">
<fieldset>
<h1 style="color:red">ACCOUNT CLOSING FORM</h1>
<form action="CloseCode.jsp" method="post" name ="f" onsubmit="return check()">
<table>
<tr>
<td>Account_N0 :</td>
<td><input type="text" name="acc"></td>
</tr>
<tr>
<td>Name :</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>Password :</td>
<td><input type="password" name="pssd"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Submit"></td>
</tr>
</table>
</form>
</fieldset>
</div>
</body>
</html>