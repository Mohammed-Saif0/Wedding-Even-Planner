<%-- 
    Document   : show_orders
    Created on : 11-Oct-2022, 6:57:26 PM
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->

    </head>
    <body>
   <jsp:include page="../templates/header.jsp" />
    <div class="container">
        <div class="row">
        <%
            DBQuery db = new DBQuery();
            String user_name = (String)session.getAttribute("username");
            ArrayList al = db.get_orders(user_name);
             int count =0;
            for(int i=0;i<al.size();i++){
                String[] data = al.get(i).toString().split("#");
                count++;
        %>
        
               

        <div class="col-sm-3 mt-3 mx-2" style="margin-left:-5vw">
    <div class="card">
      <div class="card-body">
          <h5 class="card-title pb-2 text-center text-underline"><u><%=data[1]%></u></h5>
        <p class="card-text">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/> 
</svg>
           <%=data[2]%>
        
        </p>
        <p class="card-text">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fan" viewBox="0 0 16 16">
  <path d="M10 3c0 1.313-.304 2.508-.8 3.4a1.991 1.991 0 0 0-1.484-.38c-.28-.982-.91-2.04-1.838-2.969a8.368 8.368 0 0 0-.491-.454A5.976 5.976 0 0 1 8 2c.691 0 1.355.117 1.973.332.018.219.027.442.027.668Zm0 5c0 .073-.004.146-.012.217 1.018-.019 2.2-.353 3.331-1.006a8.39 8.39 0 0 0 .57-.361 6.004 6.004 0 0 0-2.53-3.823 9.02 9.02 0 0 1-.145.64c-.34 1.269-.944 2.346-1.656 3.079.277.343.442.78.442 1.254Zm-.137.728a2.007 2.007 0 0 1-1.07 1.109c.525.87 1.405 1.725 2.535 2.377.2.116.402.222.605.317a5.986 5.986 0 0 0 2.053-4.111c-.208.073-.421.14-.641.199-1.264.339-2.493.356-3.482.11ZM8 10c-.45 0-.866-.149-1.2-.4-.494.89-.796 2.082-.796 3.391 0 .23.01.457.027.678A5.99 5.99 0 0 0 8 14c.94 0 1.83-.216 2.623-.602a8.359 8.359 0 0 1-.497-.458c-.925-.926-1.555-1.981-1.836-2.96-.094.013-.191.02-.29.02ZM6 8c0-.08.005-.16.014-.239-1.02.017-2.205.351-3.34 1.007a8.366 8.366 0 0 0-.568.359 6.003 6.003 0 0 0 2.525 3.839 8.37 8.37 0 0 1 .148-.653c.34-1.267.94-2.342 1.65-3.075A1.988 1.988 0 0 1 6 8Zm-3.347-.632c1.267-.34 2.498-.355 3.488-.107.196-.494.583-.89 1.07-1.1-.524-.874-1.406-1.733-2.541-2.388a8.363 8.363 0 0 0-.594-.312 5.987 5.987 0 0 0-2.06 4.106c.206-.074.418-.14.637-.199ZM8 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"/>
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14Zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16Z"/>
</svg>
            <%=data[3]%></p>
        <p class="card-text">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
  <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
</svg>
            <%=data[4]%></p>
       
        <p class="card-text">
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tag-fill" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l4.586-4.586a1 1 0 0 0 0-1.414l-7-7A1 1 0 0 0 6.586 1H2zm4 3.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
</svg><span id="rupees<%=i%>">
                <%=data[5]%></span></p>
        <form action='${pageContext.request.contextPath}/Remove_order' method='get'>
            <input type='hidden' value='<%=data[0]%>' name='venue_id'/>
           
            <input type='hidden' value='<%=user_name%>' name='user_name' />
            <button type='submit' class="btn btn-outline-danger">Remove Order</button>
        </form>
        
      </div>
    </div>

 

        
         </div>           

        <%}%>
   </div>

    </div>
      <div class="row">
   <% 
       int order_count =0;
    ArrayList data = db.get_added_services(user_name);
    for(int i=0;i<data.size();i++){
        order_count++;
    String[] d = data.get(i).toString().split("#");
   %>

  <div class="col-sm-3 mt-3 mx-2">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title"><%=d[0]%></h5>
        <p class="card-text"><%=d[1]%></p>
        <p class="card-text"><%=d[2]%></p>
        <p class="card-text"><span id="rup<%=i%>"><%=d[3]%></span></p>
        <form action='${pageContext.request.contextPath}/remove_added_service' method='get'>
            <input type='hidden' value='<%=d[0]%>' name='service'/>
            
            <input type='hidden' value='<%=d[1]%>' name='category'/>
           <input type='hidden' value='<%=d[2]%>' name='sub'/>
            <input type='hidden' value='<%=user_name%>' name='username' />
            <button type='submit' class="btn btn-outline-danger">Remove Order</button>
        </form>

      </div>
    </div>
  </div>



   <%}%> 
</div>
   </div>
   </div>
     
     
       <div id="count" style="display:none;"><%=count%></div>
        <div id="order_count" style="display:none;"><%=order_count%></div>
        
        
        <div class="card">
  <h5 class="card-header">Order Summary</h5>
  <div class="card-body">
      <h5 class="card-title">Total Items - <span id="total_items"></span></h5>
    <h6 class="card-text">Overall Price - <span id="price"></span></h6>
    <form method="get" action="${pageContext.request.contextPath}/booking" onsubmit="return validate();">
        <input type="hidden" value="<%=user_name%>" name="username"/>
    <button class="btn btn-outline-success">Send for Approval</button>
    </form>
  </div>
</div>
     <script>
         
     function validate(){
         let x= confirm("Do you want to proceed the booking?")
         var ele = document.getElementById("total_items")
         let price = Number(ele.innerHTML);
         if(price==0)
         {
             alert("please add any item first!!")
             return false;
         }
         return x;
     }
    function confirm_delete(){
        let x = confirm("Do you want to delete ?");
        return x;
    }
    
    
     
    
    
    
    let count = document.getElementById("count");
    count = Number(count.innerHTML)
    let sum =0;
    for(let i=0;i<count;i++){
      let ele = document.getElementById("rupees"+i);
     
           let number = Number(ele.innerHTML)
   
    sum+=number;
    
   
    ele.innerHTML = (number.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    }));  
    }
    
    
    
    
    let ocount = document.getElementById("order_count");
    ocount = Number(order_count.innerHTML);
    let osum =0;
    for(let i=0;i<ocount;i++){
        let ele = document.getElementById("rup"+i);
        let number = Number(ele.innerHTML)
        osum +=number
        ele.innerHTML = (number.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    })); 
    }
    
   
    console.log(sum);
    
    let prices = document.getElementById("price");
    let total = sum+osum
    prices.innerHTML = (total.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    })); ;
     let total_count = ocount+count;
       var total_items = document.getElementById("total_items");
       console.log(total_count)
       total_items.innerHTML = total_count;
       
    
   
   
    
</script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
     
    </body>
</html>
