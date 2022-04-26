<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="model.employee" %>
<%
if (request.getParameter("employeePassword") != null)
{
	if (request.getParameter("employeePassword") != null)
	 {
	 employee itemObj = new employee();
	 String stsMsg = itemObj.insertcustomerdetails(request.getParameter("employeePassword"),
	 request.getParameter("employeeName"),
	 request.getParameter("employeePhone"),
	 request.getParameter("employeeEmail"));
	 session.setAttribute("statusMsg", stsMsg);
	 } 
}

//Delete item----------------------------------
if (request.getParameter("employeeID") != null)
{
	employee itemObj = new employee();
String stsMsg = itemObj.deleteItem(request.getParameter("employeeID"));
session.setAttribute("statusMsg", stsMsg);
}
%>

<html>
<head>
<link rel="stylesheet" href="views/bootstrap.min.css">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="View/bootstrap.min.css">

<title>Employee Management</title>
</head>

<body>

<h1> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;Employee Management</h1>
<form method="post" action="employee.jsp">
<div class="container">
 <div class="row">
 <div class="col">


Name: <input name="employeeName" type="text"  class="form-control"><br>
Address: <input name="employeePhone" type="text"  class="form-control"><br>
 Position: <input name="employeeEmail" type="text"  class="form-control"><br>
  NIC: <input name="employeePassword" type="text"  class="form-control"><br>
 <input name="btnSubmit" type="submit" value="Save"class="btn btn-primary"><br>

 </div>
 </div>
</div>
</form>
<div class="alert alert-success">
 <%
 out.print(session.getAttribute("statusMsg"));
 %>
</div>
<br>
<%
employee itemObj = new employee();
 out.print(itemObj.readItems());
%>

</body>
</html>