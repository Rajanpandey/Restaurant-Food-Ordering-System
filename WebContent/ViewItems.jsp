<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.rajan.model.Login"%>
<%@page import="com.rajan.model.OrderMaster"%>
<%@page import="com.rajan.model.Item"%>
<%@page import="com.rajan.model.Category"%>
<%@page import="com.rajan.dao.UserService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rajan.constants.GlobalConstants"%>
<%
	ArrayList<Item> cats = null;
Login login = (Login) session.getAttribute(GlobalConstants.USER); 
	if (request.getParameter("catId") != null)
		cats = new UserService().getAllItems(Integer.parseInt(request
				.getParameter("catId")));
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
				<form action="cook?action=makeOrder" method="post">
					<table
						style="width: 70%; margin: 20px; padding: 20px; border-style: double">
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
							<th>Name</th>
							<th>Qnt</th>
							<th>Cost</th>
							<th>Order Qnt</th>
							<th>Action</th>
						</tr>
						<%
								if (cats != null && cats.size() != 0) {
									for (int i = 0; i < cats.size(); i++) {
										Item cat = cats.get(i);
							%>
						<tr>
							<td><%=i + 1%></td>
							<input type="hidden" name="catId"
								value="<%= request.getParameter("catId")%>" />
							<input type="hidden" name="status"
								value="<%=OrderMaster.OrderStatus.JUST_ORDERED.name() %>" />
							<td><%=cat.getItemName()%></td>
							<td><%= cat.getQnt() %></td>
							<td><%=cat.getCost() %></td>
							<td><input type="number" name="orderQnt" value="0" /></td>
							<td><input type="checkbox" name="ItemId"
								value="<%= cat.getId()%>" /></td>
						</tr>
						<%
								}
								}
							%>
					</table>
					Order Name : <input type="text" name="orderName" value="" /> <input
						type="hidden" name="tableNo" value="<%=Integer.parseInt(login.getUserName()) %>" /> <input type="submit"
						value="Order" /> <input type="reset" />
				</form>
				<a href="ViewCategory.jsp"> Back </a>
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