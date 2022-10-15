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
      <th scope="col">Status</th>
    </tr>
  </thead>
        <%
             DBQuery db = new DBQuery();
            String username = (String) session.getAttribute("username");
            ArrayList al = db.get_completed_booked_venue(username);
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
      <td><div class="alert alert-success"  role="alert">
  Completed
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
        <th scope="col">Status</th>    
    </tr>
  </thead>
     
   <% 
       String user_name = (String)session.getAttribute("username");
    ArrayList data = db.get_boooked_services(username,1);
    for(int i=0;i<data.size();i++){
    String[] d = data.get(i).toString().split("#");
   %>

  <tbody>
    <tr>
      <td scope="row"><%=d[0]%></th>
      <td><%=d[1]%></td> 
      <td><%=d[2]%></td>
      <td><div class="alert alert-success"  role="alert">
  Completed
</div></td>
     
    </tr>
  </tbody>

        <%}%>
        </table>
   
     
        
 
    
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
     
    </body>
</html>
