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
long AccountNumber=Long.parseLong(request.getParameter("acc"));
String Name = request.getParameter("name");
String password=request.getParameter("pssd");
try{
	  Class .forName("oracle.jdbc.driver.OracleDriver");
	  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","empdb","empdb");
	  PreparedStatement ps =con.prepareStatement("update sbi_bank set status='Deactivate' where account_no=? and name=? and password=?");
	  ps.setLong(1, AccountNumber);
	  ps.setString(2, Name);
	  ps.setString(3, password);
	  int i=ps.executeUpdate();
	  out.print(i+" Account Closed");
	  con.close();
}catch(Exception e){
	out.print(e);
}
%>
</body>
</html>