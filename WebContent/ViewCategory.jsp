<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.rajan.dao.UserService"%>
<%@page import="com.rajan.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rajan.constants.GlobalConstants"%>
<%
	ArrayList<Category> cats = new UserService().getAllCategorys();
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

			<div id="content_right">
				<div class="product_box">
					<h1>View Category</h1>
					<form action="cook?action=addCategory" method="post">
						<table width="100%" style="text-align: center;">
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
							</tr>
							<% if(cats != null && cats.size() != 0) {
								for(int i=0; i< cats.size();i++){
									Category cat = cats.get(i);
							%>
							<tr>
								<td><%= i+1  %></td>
								<td><a href="ViewItems.jsp?catId=<%=cat.getId()%>"><%= cat.getCategoryName() %></a>

								</td>
							</tr>
							<%}} %>
						</table>

					</form>
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