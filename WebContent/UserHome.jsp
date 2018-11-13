<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
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
					<h1>User Home</h1>
					<p>
						Welcome to the best restaurant in town!

					</p>
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