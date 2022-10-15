<%-- 
    Document   : header.jsp
    Created on : 9-Oct-2022, 6:32:07 PM
    Author     : moham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- CSS only -->
         
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->

<link href="css/bootstrap.css" rel="stylesheet">    
    </head>
    <body>
        
<nav class="navbar navbar-expand-lg navbar-light bg-light x-3">
  <a class="navbar-brand px-2" >Wedding Planner</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
        <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/user_home.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/show_orders.jsp">Orders</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/show_services.jsp">Services</a>
      </li>
<li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/view_bookings.jsp">Pending Bookings</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/view_completed_booking.jsp">Completed Bookings</a>
      </li>
    </ul>
  </div>
  <div class="justify-content-end">
      
      
   <%
            String username = (String)session.getAttribute("username");
        %>
        Welcome <%=username%>     
        
  </div>
        <form method="post" action="${pageContext.request.contextPath}/Logout">
            <button type="submit" class="btn btn-outline-danger btn-sm"  style="margin-left: 20px" /> LogOut </button>
        </form>
</nav>
       
  <script src="https://code.jquery.com/jquery.js"></script>
  <!-- Include all compiled plugins (below), or include individual files 
        as needed -->
 
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
