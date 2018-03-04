<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lepackage.Client"%>

<%
Client client;
String username="";
int clientid=0;

try{
client = (Client) session.getAttribute("client");
username = client.username;
if (username.equals("")) response.sendRedirect("errors/UserNotFound.html");
clientid = client.id;
}catch (Exception e){
   if (username.equals("")) response.sendRedirect("errors/UserNotFound.html"); 
}
      Class.forName("com.mysql.jdbc.Driver");
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/shop";

      String USER = "root";
      String PASS = "nbuser";
      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         
          PreparedStatement pstmt = null;
          String sql = "SELECT * FROM cart WHERE clientid=?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, clientid);
          ResultSet rs = pstmt.executeQuery(); 

          DecimalFormat f = new DecimalFormat("##.00");
 
%>

<!DOCTYPE html>


<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>E-SHOP HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />
        <link type="text/css" rel="stylesheet" href="cart/assets/css/cart.css" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

</head>

<body>
    <header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Welcome to AFDEMP E-shop <%=username%>!</span>
				</div>
				
			</div>
		</div>
		<!-- /top Header -->

		<!-- header -->
	<div id="header">
			<div class="container">
				<div class="pull-left">
					<!-- Logo -->
					<div class="header-logo">
						<a class="logo" href="index.jsp">
							<img src="./img/logo.png" alt="">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Search -->
					
					<!-- /Search -->
				</div>
				<div class="pull-right">
                                    
                                    
					<ul class="header-btns">
                                            
                                            
						<!-- Account -->
						<li class="header-account">
							<div class="dropdown-toggle"  aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
                                                            <a href="accountdetails.jsp"><strong class="text-uppercase">My account </strong></a>
							</div>
							<a href="login.html" class="text-uppercase">Login</a> / <a href="register.html" class="text-uppercase">Join</a>
							
						</li>
						<!-- /Account -->

						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									
								</div>
                                                                
								<strong class="text-uppercase">My Cart</strong>
								
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-btns">
										<button onclick="location.href='cart.jsp';" class="main-btn">View Cart</button>
										<button onclick="location.href='cart.jsp';" class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
									</div>
								</div>
							</div>
						</li>
						<!-- /Cart -->

						<!-- Mobile nav toggle-->
						<li class="nav-toggle">
							<button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
						</li>
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
        <br/><br/>
	

	<div class="container text-center">

			<div class="col-md-5 col-sm-12">
				<div class="bigcart"></div>
				<h1>Your shopping cart</h1>
				<p>
                                Here you can check your products before proceeding to checkout.
				</p>
			</div>
			
			<div class="col-md-7 col-sm-12 text-left">
				<ul>
					<li class="row list-inline columnCaptions">
						<span>QTY</span>
						<span>ITEM</span>
						<span>Price</span>
					</li>
                                        
                                        <% while (rs.next()) { %>
                                        
					<li class="row">
                                            
						<span class="quantity"><%=rs.getInt("quantity")%></span>
						<span name="productname" class="itemName"><%=rs.getString("productname")%></span>
                                                <a href="removefromcart?productid=<%=rs.getString("productid")%>"><button class="close" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                    </button></a>
						<span name="price" class="price"><%=rs.getDouble("totalprice")%></span>
                                            
					</li>
					 
                                        <% } %>
					
					<li class="row totals">
						<span class="itemName">Total:</span>
						<span id="totalprice" class="price">0</span>
						<span class="order"> <a href="checkout.jsp" class="text-center">Checkout</a></span>
					</li>
				</ul>
			</div>

		</div>
                                        
                                        <script>
                                           var sum=0;
                                           var nl = document.getElementsByClassName("price");
                                           for(var i=0; i<nl.length; i++){
                                               sum +=parseFloat(nl[i].innerHTML);
                                               
                                           }
                                           sum = Math.round(sum * 100) / 100
                                           document.getElementById("totalprice").innerHTML=sum;
                                            
                                        </script>

		<!-- JavaScript includes -->

		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 
		<script src="cart/assets/js/cart.js"></script>

	
	<!-- FOOTER -->
	<footer id="footer" class="section section-grey">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<!-- footer logo -->
						<div class="footer-logo">
							<a class="logo" href="#">
		            <img src="./img/logo.png" alt="">
		          </a>
						</div>
						<!-- /footer logo -->

						<p> </p>

						<!-- footer social -->
						<ul class="footer-social">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						</ul>
						<!-- /footer social -->
					</div>
				</div>
				<!-- /footer widget -->

				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">My Account</h3>
						<ul class="list-links">
							<li><a href="#">My Account</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Login</a></li>
						</ul>
					</div>
				</div>
				<!-- /footer widget -->

				<div class="clearfix visible-sm visible-xs"></div>

				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">Customer Service</h3>
						<ul class="list-links">
							<li><a href="#">About Us</a></li>
							<li><a href="#">Shipping & Return</a></li>
							<li><a href="#">Shipping Guide</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<!-- /footer widget -->

				<!-- footer subscribe -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">Stay Connected</h3>
						<p></p>
						<form>
							<div class="form-group">
								<input class="input" placeholder="Enter Email Address">
							</div>
							<button class="primary-btn">Join Newsletter</button>
						</form>
					</div>
				</div>
				<!-- /footer subscribe -->
			</div>
			<!-- /row -->
			<hr>
			
		</div>
		<!-- /container -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>

