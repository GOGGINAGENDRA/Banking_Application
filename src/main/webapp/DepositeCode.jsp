<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
header {
    background: #bfbfbf;
	text-align:center;
	 font-family: cursive, sans-serif;
}
.bar{

background-color:#bfbfbf;
 font-family: cursive, sans-serif;
border-style: none;
}

header h1 {
    display: inline;
}
a {
    line-height: 1em;
    display: inline-block;
    text-decoration: none;
    padding: 10px;
    margin: 1px;
    margin-right: 50px;
     
}
#leftbox {
				text-align: center;
                float:left; 
                background:#bfbfbf;
                width:15%;
                height:400px;
                margin:10px;
            }
            #middlebox{
                  border:1px solid gray;
            	letter-spacing: 0.1em;
            	text-align: center;
                float:left; 
                width:60%;
                height:500px;
                margin:10px;
                border-radius: 5px;
  				background-color: #f2f2f2;
  				padding: 20px;
            }
            #rightbox{
            	text-align: center;
                float:right;
                background:#bfbfbf;
                width:15%;
                height:400px;
                margin:10px;
            }
</style>
<body>

<header>
<img src="logo.png" alt="jacket" width="70" height="70">
<h1>RDFC BANK</h1>
<h3>BANKING SERVICES</h3>
</header>

<div class="bar" style="">
<a href="HomePage.jsp">&nbsp;Home</a>
<a href="NewAccountPage.jsp">New_Account</a>
<a href="balance.jsp">Balance</a>
<a href="DepositeCode.jsp">Deposit</a>
<a href="">withdraw</a>
<a href="">Transfer</a>
<a href="">Close A/C</a>
<a href="">AboutUs</a>
</div>


<div id="container">
<div  id="leftbox" ><h3>Services</h3></div>
<div id="middlebox">
<% 
	long account_no=Long.parseLong(request.getParameter("acc"));
	String name=request.getParameter("uname");
	String password=request.getParameter("psw");
	double damount=Double.parseDouble(request.getParameter("amt"));
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","empdb","empdb");
		
		PreparedStatement ps= con.prepareStatement("select * from sbi_bank where account_no=? and name=? and password=?");
		ps.setLong(1,account_no);
		ps.setString(2,name);
		ps.setString(3,password);
		ResultSet rs= ps.executeQuery();
	
		if(rs.next()){
			
			double bal= Double.parseDouble(rs.getString(4));
			double amount=bal+damount;
			PreparedStatement ps1 = con.prepareStatement("update sbi_bank set amount=? where account_no=?");		
			ps1.setDouble(1,amount);
			ps1.setLong(2,account_no);
			ps1.executeUpdate();
			out.print("<h3>hello "+name+", </h3><br>");
			out.print("your existing balance: "+ bal+" <br>");
			out.print("deposit amount:"+damount+" <br>");
			out.print("after deposit:"+amount+" <br>");
		}
		else
			out.print("account doesnt exist");
			
	}catch(Exception e){
		out.print(e);
	}
%>

</div>
<div  id="rightbox" ><h2>Welcome!!</h2>
<img alt="office" src="myping.jpeg" width="200px" height="200px">
</div>
</div>
</body>
</html>