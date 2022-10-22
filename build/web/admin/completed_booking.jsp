<%-- 
    Document   : view_all_booking
    Created on : 15-Oct-2022, 10:17:42 AM
    Author     : moham
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Database.DBQuery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_home.jsp">Home</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/view_all_booking.jsp">Request Bookings</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/completed_booking.jsp">Pending Payment</a>
      </li>
            <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/payment_completed.jsp">Payments</a>
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
        <div>
        
<table class="table table-striped mx-3 mr-3">
  <thead>
    <tr>
      <th scope="col">User Name</th>
       <th scope="col">Venue Name</th>
      <th scope="col">Location</th>
      <th scope="col">AC/Non-AC</th>
      <th scope="col">Capacity</th>
      <th scope="col">Prize</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
    <%
        DBQuery db = new DBQuery();
        ArrayList al = db.get_all_completed();
        int count =0;
        for(int i=0;i<al.size();i++){
            String[] data = al.get(i).toString().split("#");
            count++;
        %>

  <tbody>
    <tr>
        <td><%=data[6]%></td>
      <td><%=data[1]%></td>
      <td><%=data[2]%></td>
      <td><%=data[3]%></td>
      <td><%=data[4]%></td>
      <td id="rupees<%=i%>"><%=data[5]%></td>
      <td>
         Completed
      </td>
    </tr>
   <%}%>
  </tbody>
</table>
           
</div>
  
    <table class="table table-striped mx-3 mr-3">
  <thead>
    <tr>
      <th scope="col">User Name</th>
       <th scope="col">Service</th>
      <th scope="col">Category</th>
      <th scope="col">Sub-Category</th>
      <th scope="col">Prize</th>
      <th scope="col">Completed</th>
    </tr>
  </thead>
    <%
       
        ArrayList ai = db.get_all_booked_services(1);
        int order =0;
        for(int i=0;i<ai.size();i++){
            String[] data = ai.get(i).toString().split("#");
            order++;
        %>

  <tbody>
    <tr>
        <td><%=data[4]%></td>
      <td><%=data[0]%></td>
      <td><%=data[1]%></td>
      <td><%=data[2]%></td>
  
      <td id="rup<%=i%>"><%=data[3]%></td>
      <td>
          Completed
      </td>
    </tr>
   <%}%>
  </tbody>
</table>
     
</div>
  
    <div id="count" style="display:none;" ><%=count%></div>
 <div id="order" style="display:none;" ><%=order%></div>
 

 
   <script>
     function confirm_delete(){
         let x = confirm("Do you want to delete ?");
         return x;
     }

     let count = document.getElementById("count");
     count = Number(count.innerHTML)
     console.log(count)
     for(let i=0;i<count;i++){
       let ele = document.getElementById("rupees"+i);

     let number = Number(ele.innerHTML)
     ele.innerHTML = (number.toLocaleString('en-IN',{
             maximumFractionDigits: 0,
             style:'currency',
             currency:'INR'
     }));   

     }   

let order = document.getElementById("order");
     order = Number(order.innerHTML)
     
for(let i=0;i<order;i++){
       let ele = document.getElementById("rup"+i);
 let number = Number(ele.innerHTML)
     ele.innerHTML = (number.toLocaleString('en-IN',{
             maximumFractionDigits: 0,
             style:'currency',
             currency:'INR'
     }));   

     }  



 </script>
    </body>
</html>

        
    </body>
</html>
