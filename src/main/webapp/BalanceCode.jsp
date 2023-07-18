<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	long account_no=Long.parseLong(request.getParameter("acc"));
	String name = request.getParameter("uname");
	String password = request.getParameter("psw");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "empdb", "empdb");
		PreparedStatement ps = con.prepareStatement("select * from sbi_bank where account_no=? and name=? and password=?");
		ps.setLong(1, account_no);
		ps.setString(2, name);
		ps.setString(3, password);
		ResultSet rs = ps.executeQuery();
	    ResultSetMetaData rsmd = rs.getMetaData();
		out.print("<table border='1' cellpadding='10px'>");
		int n = rsmd.getColumnCount();
		out.print("<tr>");
		for (int i = 1; i <= n; i++) {
			if (i ==3) {
		continue;
			}
			out.print("<td size=3>" + "<br>" + rsmd.getColumnName(i));

		}

		out.print("<tr>");

		if(rs.next()) {
			for (int j = 1; j <=n; j++) {

		if (j == 3) {
			continue;
		}
		out.print("<td><br>" + rs.getString(j));
			}
		}
		out.print("<tr>");
		out.print("<table>");
		con.close();
	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>