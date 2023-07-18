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
  long Acno=Long.parseLong(request.getParameter("acc"));
  String name=request.getParameter("uname");
  String pssd=request.getParameter("psw");
  String cnfpssd=request.getParameter("cnfpsw");
  double Amnt=Double.parseDouble(request.getParameter("amt"));
  String addr=request.getParameter("addr");
  long mno=Long.parseLong(request.getParameter("mno"));
  String status=request.getParameter("sts");
  try{
	  Class .forName("oracle.jdbc.driver.OracleDriver");
	  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","empdb","empdb");
	  PreparedStatement ps =con.prepareStatement("insert into sbi_bank values(?,?,?,?,?,?,?)");
	  ps.setLong(1, Acno);
	  ps.setString(2, name);
	  ps.setString(3, pssd);
	  ps.setDouble(4, Amnt);
	  ps.setString(5, addr);
	  ps.setLong(6, mno);
	  ps.setString(7, status);
	  int i=ps.executeUpdate();
	  out.print(i+" Query Executed");
	  con.close();
  }catch(Exception e){
	out.print(e);
  } 
  %>
</body>
</html>