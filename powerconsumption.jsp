<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="model.powerconsumptionj" %>
<%


if (request.getParameter("customerPassword") != null)
{
	if (request.getParameter("customerPassword") != null)
	 {
	 employee itemObj = new employee();
	 String stsMsg = itemObj.insertcustomerdetails(request.getParameter("customerPassword"),
	 request.getParameter("customerName"),
	 request.getParameter("customerPhone"),
	 request.getParameter("customerEmail"));
	 session.setAttribute("statusMsg", stsMsg);
	 } 
}

//Delete item----------------------------------
if (request.getParameter("customerID") != null)
{
	employee itemObj = new employee();
String stsMsg = itemObj.deleteItem(request.getParameter("customerID"));
session.setAttribute("statusMsg", stsMsg);
%>

<html>
<head>
<link rel="stylesheet" href="views/bootstrap.min.css">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="View/bootstrap.min.css">

<title>Power Management</title>
</head>

<body>

<h1> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;Power Management</h1>
<form method="post" action="powerconsumption.jsp">
<div class="container">
 <div class="row">
 <div class="col">


Units: <input name="customerName" type="text"  class="form-control"><br>
 Date From: <input name="customerPhone" type="text"  class="form-control"><br>
 Date To: <input name="customerEmail" type="text"  class="form-control"><br>
  Customer ID: <input name="customerPassword" type="text"  class="form-control"><br>
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