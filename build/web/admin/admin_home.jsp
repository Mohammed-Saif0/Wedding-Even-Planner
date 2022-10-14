<%-- 
    Document   : admin_home
    Created on : 9-Oct-2022, 8:16:35 PM
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
        <jsp:include page="../templates/header.jsp" />

        <p>
  <button class="btn btn-outline-primary mt-3 ml-5  " type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    Add Venue
  </button>
</p>
<div class="collapse mx-5 " id="collapseExample">
    <form action="${pageContext.request.contextPath}/Add_venue" enctype="multipart/form-data" method="post" >
  <div class="form-row ">
    <div class="col">
       
    <label for="exampleInputEmail1">Venue Name</label>
    <input type="text" name='name' class="form-control" id="exampleInputEmail1"  placeholder="Venue Name">
    </div>
    <div class="col">
    <label for="exampleInputPassword1">Venue Location</label>
    <input type="text" name ='location' class="form-control form-text-inline" id="exampleInputPassword1" placeholder="location">
    </div>
      <div class="col">
          
    <label for="exampleFormControlSelect1">AC/Non-AC</label>
    <select class="form-control" name='category' id="exampleFormControlSelect1">
      <option value='AC'>AC</option>
      <option value='Non-AC'>Non-AC</option>
    </select>
      </div>

  <div class="col">
    <label for="venue_capacity">Capacity</label>
    <input type="number" name ='capacity' class="form-control form-text-inline" id="venue_capacity" placeholder="Venue Capacity">
  </div>
      <div class="col">
    <label for="price">Price</label>
    <input type="number" name ='price' class="form-control form-text-inline" id="price" placeholder="Venue Price">
  </div>
   </div>
        
         <input type="file" name="file_name" />
         
  <button type="submit" class="btn btn-outline-success ">ADD</button>
</form>
</div>

<div>
        
<table class="table table-striped mx-3 mr-3">
  <thead>
    <tr>
      <th scope="col">Venue Name</th>
      <th scope="col">Location</th>
      <th scope="col">AC/Non-AC</th>
      <th scope="col">Capacity</th>
      <th scope="col">Prize</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
    <%
        DBQuery db = new DBQuery();
        ArrayList al = db.get_venues();
        int count =0;
        for(int i=0;i<al.size();i++){
            String[] data = al.get(i).toString().split("#");
            count++;
        %>

  <tbody>
    <tr>
      <td><%=data[1]%></td>
      <td><%=data[2]%></td>
      <td><%=data[3]%></td>
      <td><%=data[4]%></td>
      <td id="rupees<%=i%>"><%=data[5]%></td>
      <td>
          <form method="post" action="./Delete_venue" onsubmit="return confirm_delete();">
              <input type="hidden" value ="<%=data[0]%>" name="venue_id"/>
              <button type="submit" class="btn btn-outline-danger "> Delete </button>
          </form>
      </td>
    </tr>
   <%}%>
  </tbody>
</table>
        
     
     
</div>
  
   <div id="count" style="display:none;" ><%=count%></div>
  
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
    
   
   
    
</script>

    </body>
</html>
