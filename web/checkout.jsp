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
clientid = client.id;
}catch (Exception e){
    response.sendRedirect("errors/UserNotFound.html");
}

      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/shop";

      String USER = "root";
      String PASS = "nbuser";
      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         
          PreparedStatement pstmt = null;
          String sql = "SELECT * FROM clients WHERE clientid=?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, clientid);
          ResultSet rs = pstmt.executeQuery(); 
          rs.next();

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
	
         <div class="container">
            <h2>Confirm your shipping details</h2>
            <ul class="list-group">
              <li class="list-group-item">Full Address: <%=rs.getString("address")%></li>
              <li class="list-group-item">Postal Code: <%=rs.getString("pcode")%></li>
              <li class="list-group-item">City: <%=rs.getString("city")%></li>
              <li class="list-group-item">Phone: <%=rs.getString("phone")%></li>
              <li class="list-group-item">E-mail: <%=rs.getString("email")%></li>
            </ul> <br/>
            
            <div class="" >  
            <form action="inserttickets" method="post"> <p><h4>Credit card details</h4></p>
	  
            <div class="form-group" style="display:none !important;">
            <label for="credit">hidden username field</label>
            <input type="text" name="un" class="form-control" id="hiddenusername" placeholder="Enter Credit Card Number" value="<%=username%>">
            </div>           
            
            
            
            
          <div class="form-group">
            <label for="credit">Credit Card Number</label>
            <input type="text" class="form-control" id="credit" placeholder="Enter Credit Card Number">
          </div>
          <div class="form-group">
            <label for="cvc">CVC</label>
            <input type="password" class="form-control" id="cvc" placeholder="CVC">
          </div>
          <form class="form-inline">
                <div class="form-group">
                   <label class="col-sm-12 control-label" for="expiry-month">Expiration Date</label>
                      <div class="input-group">
                         <select class="form-control col-sm-4" name="expiry-month" id="expiry-month">
                           <option value="01">Jan (01)</option>
                           <option value="02">Feb (02)</option>
                           <option value="03">Mar (03)</option>
                           <option value="04">Apr (04)</option>
                           <option value="05">May (05)</option>
                           <option value="06">June (06)</option>
                           <option value="07">July (07)</option>
                           <option value="08">Aug (08)</option>
                           <option value="09">Sep (09)</option>
                           <option value="10">Oct (10)</option>
                           <option value="11">Nov (11)</option>
                           <option value="12">Dec (12)</option>
                         </select>
                      </div>
                      <div class="input-group">
                         <select class="form-control col-sm-4" name="expiry-year">
                           <option value="18" selected="selected">2018</option>
                           <option value="19">2019</option>
                           <option value="20">2020</option>
                           <option value="21">2021</option>
                           <option value="22">2022</option>
                           <option value="23">2023</option>
                           <option value="24">2024</option>
                           <option value="25">2025</option>
                           <option value="26">2026</option>
                         </select>
                       </div>
                 </div>
            </form>
          
        </form>
       </div> <br/>
            
            <span class="order"> <a href="finishorder" class="text-center">Finish order</a>
               </span> <br><br><br>Your products will be delivered to you within 1 working day
          </div>
	
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


