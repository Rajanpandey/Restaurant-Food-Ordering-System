<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.rajan.model.OrderDetails"%>
<%@page import="com.rajan.constants.GlobalConstants"%>
<%@page import="com.rajan.model.OrderMaster.OrderStatus"%>
<%@page import="com.rajan.model.OrderMaster.OrderStatus"%>
<%@page import="com.rajan.model.OrderMaster"%>
<%@page import="com.rajan.dao.CookServices"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<OrderDetails> orders = null;
	if(request.getParameter("orderId") != null )
	 orders = new CookServices().getAllItems(Integer.parseInt(request.getParameter("orderId")));
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hotel Ordering System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="container">
		<!-- end of menu -->
		<div id="content_bar">
			<div class="product_box">
				<h1></h1>
			</div>
		</div>
		<div id="header">
			
		</div>
		<!-- end of header -->
		<div id="content_bar">
			<div class="product_box">
				<h1></h1>
			</div>
		</div>
		<div id="content">

			<div id="content_left">
				<jsp:include page="Menu.jsp" />
			</div>
			<!-- end of content left -->


			<div style="width: 100%">
				<h1>View Order Items</h1>
				<table
					style="width: 75%; margin: 20px; padding: 20px; border-style: double; text-align: center;">
					<%
								if (!GlobalConstants.MESSAGE.equals("")
										&& GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%>
					<% if(orders.size() != 0 && orders != null) {%>
					<tr>
						<th>Sr No</th>
						<th>Table No</th>
						<th>Order Id</th>
						<th>Item Name</th>
						<th>Qnt</th>
						<th>Actual Status</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
					<% for(int i=0;i<orders.size();i++)
						{
							OrderDetails om = orders.get(i);
						%>
					<form action="cook?action=updateItemtatus" method="post">
						<tr>
							<td><%=i+1 %></td>
							<td><%=om.getTableNo() %></td>
							<td><%=om.getId() %> <input type="hidden" name="orderId"
								value="<%= om.getId()%>" /> <input type="hidden" name="itemId"
								value="<%=om.getItemId() %>" /></td>
							<td><%=om.getItemName() %></td>
							<td><%=om.getQnt() %></td>
							<td><%=om.getOrderStat().name() %></td>
							<td><select name="status">
									<% for(OrderDetails.OrderStatus os : OrderDetails.OrderStatus.values()){ %>
									<option><%=os.name() %>
									</option>

									<%}%>
							</select></td>
							<td><input type="submit" value="update" /></td>
						</tr>
					</form>
					<%}
						} else {%>
					<tr>
						<td>Their no Orders Available</td>
					</tr>
					<%} %>
				</table>
				<a href="ViewOrder.jsp"> Back </a>

				<div class="cleaner_with_height">&nbsp;</div>

			</div>
			<!-- end of content right -->

			<div class="cleaner_with_height">&nbsp;</div>
		</div>
		<!-- end of content -->

		<div id="footer">
			<a href="HomePage.html">Home</a> | <a href="LoginPage.jsp"> Login
			</a> | <a href="LoginPage.jsp">Table Login </a> | <a href="ContactUs.html">Contact Us</a>
		</div>
		<!-- end of footer -->
	</div>
	<!-- end of container -->
</body>
</html>