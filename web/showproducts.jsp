<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lepackage.Client"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>

<%
String type = "";
type = request.getParameter("type");
String username="";
int clientid=0;

try{
Client client = (Client) session.getAttribute("client");
username = client.username;
clientid = client.id;
}catch (Exception e){
    
}
      Class.forName("com.mysql.jdbc.Driver");
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/shop";

      String USER = "root";
      String PASS = "nbuser";
      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         
          PreparedStatement pstmt = null;
          
          String sql="";
          if (type.equals("Oporokipeutika") || type.equals("Galaktokomika") || type.equals("Kreata")) {
              sql = "SELECT * FROM products WHERE productcat1=?";
          } else {
              sql = "SELECT * FROM products WHERE productcat2=?";
          }
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, type);
          ResultSet rs = pstmt.executeQuery(); 
          
%>

<!DOCTYPE html>

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

</head>

<body>
	<!-- HEADER -->
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
                                            
                                            <div class="header-search">
						<form>
							<input class="input search-input" type="text" placeholder="">
							
							<button class="search-btn"><i class="fa fa-search"></i></button>
						</form>
					</div>
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
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav">
					<span class="category-header">ΚΑΤΗΓΟΡΙΕΣ <i class="fa fa-list"></i></span>
					<ul class="category-list">
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Οπωροκηπευτικα <i class="fa fa-angle-right"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Οπωροκηπευτικα</h3></li>
											<li><a href="showproducts.jsp?type=fruits">ΦΡΟΥΤΑ</a></li>
											<li><a href="showproducts.jsp?type=vegetables">ΛΑΧΑΝΙΚΑ</a></li>
											<li><a href="showproducts.jsp?type=ospria">ΟΣΠΡΙΑ</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
								</div>
							</div>
						</li>
						<li class="dropdown side-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Γαλακτοκομικα <i class="fa fa-angle-right"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Γαλακτοκομικα</h3></li>
											<li><a href="showproducts.jsp?type=milk">Γαλα</a></li>
											<li><a href="showproducts.jsp?type=cheese">Τυρι</a></li>
											<li><a href="showproducts.jsp?type=yoghurt">Γιαουρτι</a></li>
											<li><a href="showproducts.jsp?type=butter">βουτυρο</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
								</div>
							</div>
						</li>
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Κρεατικα <i class="fa fa-angle-right"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Κρεατικα</h3></li>
											<li><a href="showproducts.jsp?type=cow">Μοσχαρια</a></li>
											<li><a href="showproducts.jsp?type=pig">Χοιρινα</a></li>
											<li><a href="showproducts.jsp?type=chicken">Κοτοπουλα</a></li>
										</ul>
										<hr class="hidden-md hidden-lg">
									</div>
								</div>
							</div>
						</li>
						<li><a href="showproducts.jsp?type=eggs">Αυγα</a></li>
						<li><a href="showproducts.jsp?type=oliveoil">Ελαιολαδα</a></li>
						<li><a href="showproducts.jsp?type=honey">Μελι</a></li>
					</ul>
				</div>
				<!-- /category nav -->

			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->

	<!-- HOME -->
	<div id="home">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
                            <br/>
				
                            <% while (rs.next()) { %>
                            
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="card h-100">
                                    <a href="#"><img class="card-img-top" src="img/<%=rs.getString("productimageurl")%>" alt="" style="width:100% !important"></a>
                                  <div class="card-body">
                                      
                                    <h4 class="card-title">
                                        </br>
                                        <p name="productname"><%=rs.getString("productname")%></p>
                                        
                                    </h4>
                                    <h5>$<%=rs.getFloat("price")%>/kg</h5>
                                    <p class="card-text"><%=rs.getString("productdescription")%></p>
                                    <form class="input-group" action="addtocart">
                                        <input name="productname" value="<%=rs.getString("productname")%>" style="display:none" />
                                        <input name="amountofkg" type="text" class="form-control" placeholder="Kgs:">
                                        <span class="input-group-btn">
                                             <button class="btn btn-default" type="submit">Add to cart</button>
                                        </span>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            
                         <%  }  %>
                            
			</div>
			<!-- /home wrap -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->

	
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
