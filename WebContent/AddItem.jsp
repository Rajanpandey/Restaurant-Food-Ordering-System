<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.rajan.constants.GlobalConstants"%>
<%@page import="com.rajan.dao.CookServices"%>
<%@page import="com.rajan.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Category> cats = new CookServices().getAllCategorys();
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
					<h1>Add Item</h1>
					<form action="cook?action=addItem" method="post">
						<table width="100%">
							<%
								if (!GlobalConstants.MESSAGE.equals("")
										&& GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%>
							<tr>
								<td width="40%">Item Name :</td>
								<td><input type="text" name="itemName" size="22" /></td>
							</tr>
							<tr>
								<td width="40%">Category :</td>
								<td><select style="size: 30" name="categoryId">

										<option>-- Select --</option>
										<%if(cats != null && cats.size() != 0){ 
								for(int i=0;i <cats.size();i++)
								{
									Category cat = cats.get(i);
								%>
										<option value="<%=cat.getId() %>">
											<%=cat.getCategoryName() %></option>
										<%}} %>
								</select></td>
							</tr>
							<tr>
								<td width="40%">Qnt :</td>
								<td><input type="number" name="qnt" size="30" /></td>
							</tr>
							<tr>
								<td width="40%">Cost:</td>
								<td><input type="text" name="cost" size="22" /></td>
							</tr>
							<tr>
								<td colspan="2" width="40%"><input type="submit"
									value="Add" /> <input type="reset" /></td>

							</tr>
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