<%-- 
    Document   : paid_bookings
    Created on : 22-Oct-2022, 12:11:56 PM
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
 <p>
     <jsp:include page="../templates/header.jsp" />
<% 
    DBQuery db = new DBQuery();
    String username = (String) session.getAttribute("username");
    ArrayList ai=db.get_all_transactions_of_a_user(username);
    int cou =0;
    for(int j=0;j<ai.size();j++){
        String[] val = ai.get(j).toString().split("#");
        cou++;
%>
<button class="btn btn-primary" style="padding-left:20vw;padding-right: 20vw;" type="button" data-toggle="collapse" data-target="#collapseExample<%=cou%>" aria-expanded="false" aria-controls="collapseExample">
      Transaction id : <%=val[0]%> | Date : <%=val[2]%> | Amount:<span id="rupe<%=cou%>" > <%=val[1]%> </span>
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
        
</div>
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
