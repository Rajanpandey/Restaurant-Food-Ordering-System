<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.rajan.constants.GlobalConstants"%>
<%@page import="com.rajan.model.OrderMaster.OrderStatus"%>
<%@page import="com.rajan.model.OrderMaster.OrderStatus"%>
<%@page import="com.rajan.model.OrderMaster"%>
<%@page import="com.rajan.dao.CookServices"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<OrderMaster> orders = new CookServices().getAllOrders();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="refresh" content="4" />
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

			<div id="content_right">
				<div style="width: 70%">
					<h1>View Orders</h1>
					<table width="100%" style="text-align: center;">
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
							<th>Name</th>
							<th>Actual Status</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
						<% for(int i=0;i<orders.size();i++)
						{
							OrderMaster om = orders.get(i);
						%>
						<form action="cook?action=updateOStatus" method="post">
							<tr>
								<td><%=i+1 %> <input type="hidden" name="orderId"
									value="<%= om.getId()%>" /></td>
								<td><%=om.getTableNo() %></td>
								<td><a href="ViewOrderedItems.jsp?orderId=<%=om.getId() %>"><%=om.getOrderName() %>
								</a></td>
								<td><%=om.getOrderStat().name() %></td>
								<td><select name="status">
										<% for(OrderStatus os : OrderStatus.values()){ %>
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

				</div>
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