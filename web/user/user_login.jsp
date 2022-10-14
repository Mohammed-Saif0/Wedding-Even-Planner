<%-- 
    Document   : user_login
    Created on : 9-Oct-2022, 7:40:17 PM
    Author     : moham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    </head>
    <body>
        <h1 class="text-center pt-4">Log In</h1>
        <form action="${pageContext.request.contextPath}/Login" method='post'>
   <div class="mx-5" style="max-width: 70vw; padding-left:30vw;">
  
   <div class="mb-3">
    <label for="username" class="form-label">User Name</label>
    <input type="text" class="form-control" id="username" name="username">
  </div>
  <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" name="password">
  </div>
  <button type="submit" class="btn btn-outline-primary">Log In</button>
  </div>
</form>
        
        
        
        <% 
        String error = (String)session.getAttribute("message");
            if(error==null){
            }
            else{
            %>
            

<div class="alert alert-danger w-25 text-center" id="pop-up" style="margin-left:40vw; " role="alert">
     User Id and password did not match , please try loggin again or if you don't have an account try  <a href="./user/user_signup.jsp" class="alert-link">Sign Up</a> here.
</div>
            <% session.invalidate(); }%>
</div>

    

    </body>
</html>
