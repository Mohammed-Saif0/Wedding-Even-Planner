<%-- 
    Document   : payment_completed
    Created on : 21-Oct-2022, 7:32:43 PM
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
     
            
            
            <%-- 
    Document   : paid_bookings
    Created on : 22-Oct-2022, 12:11:56 PM
    Author     : moham
--%>


        
        
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
 <p>
    
 <div class="container">
<% 
    DBQuery db = new DBQuery();
    
    ArrayList ai=db.get_all_transactions();
    int cou =0;
    for(int j=0;j<ai.size();j++){
        String[] val = ai.get(j).toString().split("#");
        cou++;
%>

<button class="btn btn-primary" style="padding-left:20vw;padding-right: 20vw" type="button" data-toggle="collapse" data-target="#collapseExample<%=cou%>" aria-expanded="false" aria-controls="collapseExample">
    Transaction id : <%=val[0]%> | Amount :<span id="rupe<%=cou%>"> <%=val[2]%> </span>| User_name : <%=val[1] %> | Date:<%=val[3]%>
  </button>
</p>
<div class="collapse" id="collapseExample<%=cou%>">
  <div class="card card-body">
       <table class="table">
  <thead>
    <tr>
      <th scope="col">Venue Name</th>
      <th scope="col">Location</th>
        <th scope="col">AC/Non-AC</th>
      <th scope="col">Capacity</th>
     
    </tr>
  </thead>
        <%
             
            
            ArrayList al = db.get_paid_venues(Integer.parseInt(val[0]));
            int count =0;
            for(int i=0;i<al.size();i++){
                count++;
                String[] data = al.get(i).toString().split("#");
        %>
        
               

 
  <tbody>
    <tr>
      <td scope="row"><%=data[0]%></th>
      <td><%=data[1]%></td>
      <td><%=data[2]%></td>
      <td><%=data[3]%></td>

    </tr>
  </tbody>
<%}%>  
  </table>
  <table class="table">
       
  <thead>
    <tr>
      <th scope="col">Sevice</th>
      <th scope="col">Catogery</th>
        <th scope="col">Sub-Catogery</th>     
        
    </tr>
  </thead>
     
   <% 
    ArrayList di = db.get_all_paid_services(Integer.parseInt(val[0]));
    for(int z=0;z<di.size();z++){
    String[] d = di.get(z).toString().split("#");
   %>

  <tbody>
    <tr>
      <td scope="row"><%=d[0]%></th>
      <td><%=d[1]%></td>
      <td><%=d[2]%></td>
     
  
     
    </tr>
  </tbody>
 
 <%}%>
        
        </table>
   
     </div>
       
        
      </div>
            <%}%>  
        
       
        
          
 


    
     
            <div id="count" style="display:none"><%=cou%></div>    
<script>
    let ele = document.getElementById("count")
    let num = Number(ele.innerHTML)
    console.log(num)
    for(let i =1;i<=num;i++)
    {
        let e = document.getElementById("rupe"+i)
      
 
    let number = Number(e.innerHTML)
    e.innerHTML = (number.toLocaleString('en-IN',{
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
