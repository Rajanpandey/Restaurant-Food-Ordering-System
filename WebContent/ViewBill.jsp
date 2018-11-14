<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Date"%>
<%@page import="com.rajan.model.Login"%>
<%@page import="com.rajan.model.BillDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rajan.dao.UserService"%>
<%@page import="com.rajan.constants.GlobalConstants"%>
<%
	UserService uService = new UserService();
	Login login = (Login) session.getAttribute(GlobalConstants.USER);
	ArrayList<BillDetails> bDetails = uService.getBill(Integer.parseInt(login.getUserName()));
	
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader ("Expires", "0"); 
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>View Bill</title>
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="assets/mycss/navbar.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="sidenav">
    <a href="UserHome.jsp"> <%=new Date() %></a>
    <hr color="white" />
	<a href="ViewCategory.jsp"> Place Order </a>
	<a href="OrderStatus.jsp"> View Order Status </a>
	<a href="ViewBill.jsp"> View Bill </a>
	<a href="LoginPage.jsp"> Log Out </a>
</div>

<div class="main">
  <div class="container">
    <div class="row">
      <div class="col-12">  
              
        <br/>  
        <h1>View Bill</h1>  
        <br/>
        
        <% 
        if(bDetails!=null && !bDetails.isEmpty()){
        %>			
			<table class="table table-striped table-hover">
        <%
		    if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
		        out.write("<h3>" + GlobalConstants.MESSAGE + " </h3>");
			    GlobalConstants.MESSAGE = "";
		    }
		%>
			<tr>
				<th>Serial Number</th>
				<th>Order Name</th>
				<th>Item Name</th>
				<th>Item Cost</th>
				<th>Item Quantity</th>
				<th>Order Quantity</th>
				<th>Amount</th>
			</tr>
		<% 
		    double total=0; 
		    for(int i=0; i<bDetails.size(); i++){
		    	BillDetails bd = bDetails.get(i);
		%>
				<tr>
					<td><%=i+1 %></td>
					<td><%=bd.getOrderName() %></td>
					<td> <%=bd.getItemName() %></td>
					<td> <%=bd.getItemCost() %></td>
					<td><%=bd.getItemQnt() %></td>
					<td><%=bd.getOrderQnt() %></td>
					<td> <%=Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt() %> 
					 <% total = (Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt()) + total; %>
					</td>
				</tr>
		<%
			}
		%>
			<tr>						
				<td  style="text-align: center;"> <b>Total</b> </td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><b><%=total %></b></td>							
			</tr>							
		  </table>
		<%
		}
		%>   			
      </div>
    </div>
  </div>
</div>
</body>
</html>