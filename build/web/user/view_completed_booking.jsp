<%-- 
    Document   : view_completed_booking
    Created on : 15-Oct-2022, 11:17:52 AM
    Author     : moham
--%>

<%@page import="Database.DBQuery"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <jsp:include page="../templates/header.jsp" />
       
        
        
    
       <table class="table">
  <thead>
    <tr>
      <th scope="col">Venue Name</th>
      <th scope="col">Location</th>
        <th scope="col">AC/Non-AC</th>
      <th scope="col">Capacity</th>
      <th scope="col">Price</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
        <%
             DBQuery db = new DBQuery();
            String username = (String) session.getAttribute("username");
            ArrayList al = db.get_completed_booked_venue(username);
            int venue_count =0;
            int item_count=0;
            for(int i=0;i<al.size();i++){
                venue_count++;
                item_count++;
                String[] data = al.get(i).toString().split("#");
        %>
        
               

 
  <tbody>
    <tr>
      <td scope="row"><%=data[0]%></th>
      <td><%=data[1]%></td>
      <td><%=data[2]%></td>
      <td><%=data[3]%></td>
      <td><span id="rupees<%=i%>"><%=data[4]%></span></td>
      <td><div class="alert alert-success"  role="alert">
  Approved
</div></td>
    </tr>
  </tbody>

        <%}%>
        </table>
   </div>

    </div>
    
     <table class="table">
  <thead>
    <tr>
      <th scope="col">Sevice</th>
      <th scope="col">Catogery</th>
        <th scope="col">Sub-Catogery</th>
         <th scope="col">Price</th> 
        <th scope="col">Status</th>    
    </tr>
  </thead>
     
   <% 
       String user_name = (String)session.getAttribute("username");
    ArrayList data = db.get_approved_services(username);
    int service_count =0;
    for(int i=0;i<data.size();i++){
        service_count++;
        item_count++;
    String[] d = data.get(i).toString().split("#");
   %>

  <tbody>
    <tr>
      <td scope="row"><%=d[0]%></th>
      <td><%=d[1]%></td> 
      <td><%=d[2]%></td>
      <td><span id="rupe<%=i%>"><%=d[3]%></span></td>
      <td><div class="alert alert-success"  role="alert">
  Approved
</div></td>
     
    </tr>
  </tbody>

        <%}%>
        </table>
   
     
            <div class="card">
  <h5 class="card-header">Order Summary</h5>
  <div class="card-body">
      <h5 class="card-title">Total Items - <span id="total_items"><%=item_count%></span></h5>
    <h6 class="card-text">Overall Price - <span id="price"></span></h6>
    
    <form method="post" action="${pageContext.request.contextPath}/proceed_payment">
        <input type="hidden" value="<%=username%>" name="username"/>
        <input type="hidden" id="cost" name="cost"  />
    <button type="submit" class="btn btn-outline-success">Pay and Book</button>
    </form>
  </div>
</div>     
 
    
    <div id="venue_count" style="display:none;" ><%=venue_count%></div>
    <div id="service_count" style="display:none;" ><%=service_count%></div>
    
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
<script>
    let total_sum = 0;
        let service_count = document.getElementById("service_count");
    let total_services = Number(service_count.innerHTML);
    
    
    let venue_count = document.getElementById("venue_count");
    
    let total_venue = Number(venue_count.innerHTML);
    
    for(let i=0;i<total_venue;i++){
        let ele = document.getElementById("rupees"+i)
        let number = Number(ele.innerHTML)
         total_sum+=number;
        ele.innerHTML = (number.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    }));   
    }
    
    for(let i=0;i<total_services;i++){
        let ele = document.getElementById("rupe"+i)
        let number = Number(ele.innerHTML)
        total_sum+=number;
        ele.innerHTML = (number.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    }));   
    }
    
    let total = document.getElementById("price")
    
    
    
    total.innerHTML = (total_sum.toLocaleString('en-IN',{
        maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    }));
    
    let element = document.getElementById("cost");
    element.value = Number(total_sum)
    

</script>
     
    </body>
</html>
