<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@include file="DBConnection.jsp"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! int k=0; %>
<%
try
{
	Connection con=getConnection();
	PreparedStatement ps=con.prepareStatement("insert into usm2(id,name,age,city) values(seq_usm1.nextval,?,?,?)");
	PrintWriter pw=response.getWriter();
	response.setContentType("text/html");
	ps.setString(1, request.getParameter("name"));
	ps.setInt(2, Integer.parseInt(request.getParameter("age")));
	ps.setString(3, request.getParameter("city"));
	k=ps.executeUpdate();
	if(k==1){
		 //request.setAttribute("alertMsg", "data add sucess");
		 pw.println("<b>Sucessfully Add User...</b>");
		 RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
		 rd.include(request, response);
		// response.sendRedirect("dashboard.jsp");
		 //out.println("Successfully add user");
	 }else{
		 pw.println("<b>Not Updated.....</b>");
		 RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
		 rd.include(request, response);
	 }
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>