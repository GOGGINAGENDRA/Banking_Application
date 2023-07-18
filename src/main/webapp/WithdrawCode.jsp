<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<% 
	long account_no=Long.parseLong(request.getParameter("acc"));
	String name=request.getParameter("uname");
	String password=request.getParameter("psw");
	double w_amnt=Double.parseDouble(request.getParameter("amt"));
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
			if(bal>w_amnt){
		 	double amount=bal-w_amnt;
			PreparedStatement ps1 = con.prepareStatement("update sbi_bank set amount=? where account_no=?");		
			ps1.setDouble(1,amount);
			ps1.setLong(2,account_no);
			ps1.executeUpdate();
			out.print("<h3>hello "+name+", </h3><br>");
			out.print("your existing balance: "+ bal+" <br>");
			out.print("Withdraw amount:"+w_amnt+" <br>");
			out.print("after withdraw:"+amount+" <br>");
			}
			else
			{
				out.print("Withdraw amount greatere than Balance amnt");
			}
		}
		else
			out.print("account doesnt exist");
			
	}catch(Exception e){
		out.print(e);
	}
%>
</body>
</html>