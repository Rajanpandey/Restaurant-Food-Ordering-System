<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.rajan.model.Login"%>
<%@page import="com.rajan.model.BillDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rajan.dao.UserService"%>
<%@page import="com.rajan.constants.GlobalConstants"%>
<%
	UserService uService = new UserService();
	Login login = (Login) session.getAttribute(GlobalConstants.USER);
	ArrayList<BillDetails> bDetails = uService.getBill(Integer.parseInt(login.getUserName()));
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hotel Ordering System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="templatemo_container">
		<!-- end of menu -->
		<div id="templatemo_content_bar">
			<div class="templatemo_product_box">
				<h1></h1>
			</div>
		</div>
		<div id="templatemo_header">
			
		</div>
		<!-- end of header -->
		<div id="templatemo_content_bar">
			<div class="templatemo_product_box">
				<h1></h1>
			</div>
		</div>
		<div id="templatemo_content">

			<div id="templatemo_content_left">
				<jsp:include page="Menu.jsp" />
			</div>
			<!-- end of content left -->

			<div id="templatemo_content_right">	
			<% if(bDetails != null && !bDetails.isEmpty()) {%>			
					<table
						style="width: 90%; margin: 20px; padding: 20px; border-style: double">
						<%
								if (!GlobalConstants.MESSAGE.equals("")
										&& GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%>
						<tr>
							<th>Sr No</th>
							<th>Order Name</th>
							<th>Item Name</th>
							<th>Item Cost</th>
							<th>Item Qnt</th>
							<th>Order Qnt</th>
							<th>Amt</th>
						</tr>
						<% double total = 0; %>
						<%for(int i=0; i < bDetails.size(); i++)
						{
							BillDetails bd = bDetails.get(i);
						%>
						<tr>
							<td><%=i+1 %></td>
							<td><%=bd.getOrderName() %></td>
							<td><%=bd.getItemName() %></td>
							<td><%=bd.getItemCost() %></td>
							<td><%=bd.getItemQnt() %></td>
							<td><%=bd.getOrderQnt() %></td>
							<td> <%=Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt() %>
							<% total = (Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt()) + total; %>
							</td>
						</tr>
						<%}%>
						<tr>
							<td style="text-align: center;"> Total </td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td > <%=total %></td>
						</tr>						
					</table>
					<%}%>
										
				<div class="cleaner_with_height">&nbsp;</div>

			</div>
			<!-- end of content right -->

			<div class="cleaner_with_height">&nbsp;</div>
		</div>
		<!-- end of content -->

		<div id="templatemo_footer">
			<a href="HomePage.html">Home</a> | <a href="LoginPage.jsp"> Login
			</a> | <a href="LoginPage.jsp">Table Login </a> | <a href="ContactUs.html">Contact Us</a>
		</div>
		<!-- end of footer -->
	</div>
	<!-- end of container -->
</body>
</html>