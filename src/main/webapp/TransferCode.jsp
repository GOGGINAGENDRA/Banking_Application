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
	long tacc_no=Long.parseLong(request.getParameter("tacc"));
	double t_amount=Double.parseDouble(request.getParameter("amt"));
	double t_bal=0;
	double bal1=0;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","empdb","empdb");
		
		PreparedStatement ps= con.prepareStatement("select * from sbi_bank where account_no=? and name=? and password=?");
		ps.setLong(1,account_no);
		ps.setString(2,name);
		ps.setString(3,password);
		ResultSet rs= ps.executeQuery();
	    ResultSetMetaData rsmd=rs.getMetaData();
	    int n=rsmd.getColumnCount();
		if(rs.next()){	
			if(rs.getString(7).equals("Active")){
		    	out.print("Account1 Balance before deduction is="+rs.getDouble(4)+"<br>");
		    	if(rs.getDouble(4)>t_amount){
		    		
		      	  //account2
		          long tempaccno=account_no;
		          account_no=tacc_no; 
		      	PreparedStatement ps2=con.prepareStatement("select * from sbi_bank where account_no=?");
		      	ps2.setLong(1,account_no);
		      	ResultSet rs2=ps2.executeQuery();
		      	
		      	 if(rs2.next()){
		      		if(rs.getString(7).equals("Active")){
		          	out.print("Account2 Balance is="+rs2.getDouble(4)+"<br>");
		          	
		          //account1 update
		          	double Amount=rs.getDouble(4)-t_amount;
		          	tacc_no=account_no;
		          	account_no=tempaccno;;
		          	PreparedStatement ps3=con.prepareStatement("update sbi_bank set amount=? where account_no=?");
		         	ps3.setDouble(1,Amount);
		         	ps3.setLong(2,account_no);
		         	int i=ps3.executeUpdate();
		          	
		         	//out.print(i+ "amount debited successfully"+"<br>");
		         	out.print("Account1 Balance after deduction is="+Amount+"<br>");	
		      	   //account2 update
		      	   //double tempamt=Amount;
		      	   Amount=rs2.getDouble(4)+t_amount;
		      	 account_no=tacc_no;
		      	 PreparedStatement ps4=con.prepareStatement("update sbi_bank set amount=? where account_no=?");
		     	ps4.setDouble(1,Amount);
		     	ps4.setLong(2,account_no);
		     	int j=ps4.executeUpdate();
		     	//out.print(j+ "amount credited successfully");
		     	out.print("account2 increase with"+t_amount+"<br>");
		   	    out.print("Inncremented acount2 balance is="+Amount);	
		      	  }
		        	 else{
		        		 out.print("your acount inactive");
		        	 }
		      	 }
		      	else{
		   	      out.print("invalid accountno");
		            }
		      	
		    	}
		     	 else{
		     		 out.print("your acount inactive");
		     	 }
		    	}
		      else{
		        out.print("invalid details");
		            }
			con.close();
		    }
			}
			catch(Exception ex){
				out.print(ex);
				ex.printStackTrace();
				
			}

		%>
</body>
</html>