<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%> 
<%@page import="com.rajan.constants.GlobalConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hotel Ordering System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!--  Free CSS Templates from www.templatemo.com -->
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
				<div class="content_left_section">
					<h1 style="text-align: center">Raj Resto</h1>
					<ul>
						<li><a href="HomePage.html"> Home </a></li>
						<li><a href="LoginPage.jsp"> Login </a></li>
						<li><a href="LoginPage.jsp"> Table Login </a></li>
						<li><a href="ContactUs.html">Contact Us </a></li>
					</ul>
				</div>
			</div>
			<form action="control?action=login" method="post">
				<table
					style="width: 40%; margin: 20px; padding: 20px; border-style: double">
					<tr>
						<td colspan="2" style="text-align: center; font-size: 17px">
							Login</td>
					</tr>
					<%
								if (!GlobalConstants.MESSAGE.equals("")
										&& GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%>
					<tr>
						<td>User/Table No</td>
						<td><input type="text" name="userName" id="userName" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pass" id="pass" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Login" /> <input type="reset" /></td>
					</tr>
				</table>
			</form>
			<!-- end of content left -->
			<!-- end of content right -->
			<div class="cleaner_with_height">&nbsp;</div>
		</div>
		<!-- end of content -->

		<div id="footer">
			<a href="HomePage.html">Home</a> | <a href="LoginPage.jsp"> Login
			</a> | <a href="LoginPage.jsp">Table Login </a> | <a href="ContactUs.html">Contact Us</a>
		</div>
		<!-- end of footer -->
		<!--  Free CSS Template www.templatemo.com -->
	</div>
	<!-- end of container -->
</body>
</html>