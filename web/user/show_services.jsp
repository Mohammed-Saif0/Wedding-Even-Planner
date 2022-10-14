<%-- 
    Document   : show_services
    Created on : 11-Oct-2022, 10:05:56 PM
    Author     : moham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td{
                padding-top: 10px;
                padding-left:15px;
            }
        </style>
    </head>
    <body>
         <jsp:include page="../templates/header.jsp" />
         <table style="    margin-left: 30vw;
    margin-top: 20vh;">   
         <form name="form1"  id="form1" action="${pageContext.request.contextPath}/add_services" method="post"/>

    <tr>
        <td>Services:</td>
        <td> <select name="service" class="form-select-lg"  id="subject">
    <option value="" selected="selected">Select Service</option>
  </select></td>
    </tr>

    <tr>
        <td>
            Category:
        </td>
        <td>
            <select name="category" class="form-select-lg" id="topic">
    <option value="" selected="selected">Please select Service first</option>
  </select> 
        </td>
    </tr>

    <tr>
        <td>
          Sub-category   
        </td>
        <td>
            <select name="sub" class="form-select-lg" id="chapter">
    <option value="" selected="selected">Please select Category first</option>
  </select>
        </td>
    </tr>

    <tr>
        <td>
           Price 
        </td>
        <td>
            <div id="rupees">  </div>
        </td>
    </tr>
  <input type="hidden" value="" id="price" name="price" />
  <tr>
      <td>
          
      </td>
      <td>
          <button type="submit" class="btn btn-outline-primary" > Add to Orders </button>
      </td>
  </tr>
  
  <% String user_name = (String)session.getAttribute("username"); %>
  <input type="hidden" name="user_name" value="<%=user_name%>" />
</form>
</table>

           
<script>
      
var subjectObject = {
  "Food": {
    "Veg": ["South-Indian", "North-Indian"],
    "Non-Veg": ["South-Indian","North-Indian"],
  },
  "Photographs": {
    "Single": ["Photo","Photo and Video" ],
    "Team": ["Photo","Photo and Video" ]
  },
  "Decorators":{
      "North-Style": ["Normal","Premium"],
      "South-Style": ["Normal","Premium"]
  },
  "DJ":{
      "Bands":["Old-Music","New-Music"],
      "Modern DJ":["Old-Music","New-Music"]
  }
}
window.onload = function() {
  var subjectSel = document.getElementById("subject");
  var topicSel = document.getElementById("topic");
  var chapterSel = document.getElementById("chapter");
  var priceSel = document.getElementById("price");
  var rupees = document.getElementById("rupees")
  for (var x in subjectObject) {
    subjectSel.options[subjectSel.options.length] = new Option(x, x);
  }
  subjectSel.onchange = function() {
    //empty Chapters- and Topics- dropdowns
    chapterSel.length = 1;
    topicSel.length = 1;
    //display correct values
    for (var y in subjectObject[this.value]) {
      topicSel.options[topicSel.options.length] = new Option(y, y);
    }
  }
  topicSel.onchange = function() {
    //empty Chapters dropdown
    chapterSel.length = 1;
    //display correct values
    var z = subjectObject[subjectSel.value][this.value];
    for (var i = 0; i < z.length; i++) {
      chapterSel.options[chapterSel.options.length] = new Option(z[i], z[i]);
    }
  }
  
  

  chapterSel.onchange = function(){
      priceSel.length =1;
      if(chapterSel.value == "South-Indian")
      {
         let price = 100000;
         priceSel.value = price; 
         rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
      }
          
       if(chapterSel.value == "North-Indian")
       {
           let price = 800000;
            priceSel.value = price; 
            rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
       }
          
      if(chapterSel.value == "Photo")
      {
          let price = 5000;
           priceSel.value = price;
            rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
      }
         
     if(chapterSel.value == "Photo and Video")
     {
         let price = 15000;
         priceSel.value = price;
          rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
     }
          
      if(chapterSel.value == "Normal")
      {
          let price = 25000
           priceSel.value = price;
            rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
      }
         
      if(chapterSel.value == "Premium")
      {
          let price = 40000
         priceSel.value = price; 
         rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
      }
          
      if(chapterSel.value == "Old-Music")
      {
          let price = 30000
          priceSel.value = price;
           rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
      }
          
      if(chapterSel.value == "New-Music"){
          let price = 35000;
           priceSel.value = price;
           rupees.innerHTML = price.toLocaleString('en-IN',{
            maximumFractionDigits: 0,
            style:'currency',
            currency:'INR'
    });
      }
         
      
  }

  
}
</script>
         
    </body>
    
    
</html>
