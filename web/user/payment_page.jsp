<%-- 
    Document   : payment_page
    Created on : 21-Oct-2022, 4:57:52 PM
    Author     : moham
--%>

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
        <% 
            String price = (String)session.getAttribute("cost");
        %>
        
        <div class="container">
   
           
            
            <div class="col-12 mt-4">
                <div class="card p-3">
                    <p class="mb-0 fw-bold h4">Payment Methods</p>
                </div>
            </div>
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body border p-0">

                        <div class="collapse p-3 pt-0" id="collapseExample">
                            <div class="row">
                                <div class="col-8">
                                    <p class="h4 mb-0">Summary</p>
                                    <p class="mb-0"><span class="fw-bold">Product:</span><span class="c-green">: Name of
                                            product</span></p>
                                    <p class="mb-0"><span class="fw-bold">Price:</span><span
                                            class="c-green"><%=price%></span></p>
                                    <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Atque
                                        nihil neque
                                        quisquam aut
                                        repellendus, dicta vero? Animi dicta cupiditate, facilis provident quibusdam ab
                                        quis,
                                        iste harum ipsum hic, nemo qui!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body border p-0">
                        <p>
                            <a class="btn btn-primary p-2 w-100 h-100 d-flex align-items-center justify-content-between"
                                data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true"
                                aria-controls="collapseExample">
                                <span class="fw-bold">Credit Card</span>
                                <span class="">
                                    <span class="fab fa-cc-amex"></span>
                                    <span class="fab fa-cc-mastercard"></span>
                                    <span class="fab fa-cc-discover"></span>
                                </span>
                            </a>
                        </p>
                        <div class="collapse show p-3 pt-0" id="collapseExample">
                            <div class="row">
                                <div class="col-lg-5 mb-lg-0 mb-3">
                                    <p class="h4 mb-0">Summary</p>
                                    <p class="mb-0"><span class="fw-bold">Product:</span><span class="c-green">: Name of
                                            product</span>
                                    </p>
                                    <p class="mb-0">
                                        <span class="fw-bold">Price:</span>
                                        <span class="c-green" id="rupees"><%=price%></span>
                                    </p>
                                    <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Atque
                                        nihil neque
                                        quisquam aut
                                        repellendus, dicta vero? Animi dicta cupiditate, facilis provident quibusdam ab
                                        quis,
                                        iste harum ipsum hic, nemo qui!</p>
                                </div>
                                <div class="col-lg-7">
                                   
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form__div">
                                                     <label for="" class="form__label">Card Number</label>
                                                    <input type="text" class="form-control" placeholder=" ">
                                                   
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <label for="" class="form__label">MM / yy</label>
                                                    <input type="text" class="form-control" placeholder=" ">
                                                    
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <label for="" class="form__label">cvv code</label>
                                                    <input type="password" class="form-control" placeholder=" ">
                                                    
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form__div">
                                                    <label for="" class="form__label">Name on the card</label>
                                                    <input type="text" class="form-control" placeholder=" ">
                                                    
                                                </div>
                                            </div>
                                            <%
                                                String username = (String)session.getAttribute("username");
                                            %>
                                            <form method="post" action="${pageContext.request.contextPath}/transaction" class="form" onsubmit="return check_price()">
                                         <input type="hidden" value="<%=username%>" name="username"/>
                                         <input type="hidden" value="<%=price%>" name="price" id="prices" />
                                    
                                             <button class="btn btn-primary w-100" type="submit"> Submit</button>
                                    </form>
                                            
                                        </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                
                    <a class="btn btn-primary payment" href="${pageContext.request.contextPath}/user/view_completed_booking.jsp">Go BACK</a>
                    
            </div>
        </div>
    </div>
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    
    
    let ele = document.getElementById("rupees");
    let price = Number(ele.innerHTML);
   ele.innerHTML = (price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    }));   
    
</script>
    </body>
</html>
