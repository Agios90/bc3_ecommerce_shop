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
    if (username.equals("")) response.sendRedirect("errors/UserNotFound.html"); 
}

%>


<!DOCTYPE html>
<html style="overflow-y: hidden;">
<head>
	<link rel=stylesheet type="text/css" href="css.css">
	<link rel=stylesheet type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <meta charset="UTF-8"/>
	<title>Login</title>
</head>
<body>

    <div class="container">

			
            <p id="profile-name" class="profile-name-card"> E-shop Webapp - Account Details for <%=username%></p>
            <form class="form-signin" action="savedetails" method="post">
                <input type="text" name ="address" id="address" class="form-control" placeholder="Delivery Address" required autofocus>
                <input type="text" name ="pcode" id="address" class="form-control" placeholder="Postal Code" required autofocus>
                <input type="text" name ="city" id="address" class="form-control" placeholder="City" required autofocus>
                <input type="text" name ="phone" id="address" class="form-control" placeholder="Phone Number" required autofocus>
                <input type="text" name ="email" id="address" class="form-control" placeholder="E-mail" required autofocus>
                
                <button id="searchbtn" class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Save my account details</button>
            </form>
            
        </div>
    
	
</body>
</html>
