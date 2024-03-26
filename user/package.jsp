<%-- 
    Document   : package
    Created on : 16-Jan-2024, 4:14:10 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="newpackage.*" %>

<%
    List<PackageData> pklist=new ArrayList<>();
    
    try {
            Connection con=connection.getconnection();
            
            String sql="select * from package where pk_status='available'";
            
            try {
                    PreparedStatement pts=con.prepareStatement(sql);
                    ResultSet rs=pts.executeQuery();
                    
                    while(rs.next())
                    {
                        int pk_id=rs.getInt("pk_id");
                        String pk_name=rs.getString("pk_name");
                        String pk_type=rs.getString("pk_type");
                        String pk_season=rs.getString("pk_season");
                        String pk_location=rs.getString("pk_location");
                        int pk_price=rs.getInt("pk_price");
                        String pk_description=rs.getString("pk_description");
                        String pk_duration=rs.getString("pk_duration");
                        String pk_status=rs.getString("pk_status");
                        String pk_image=rs.getString("pk_image");
                        
                        PackageData pkdata=new PackageData(pk_id,pk_name,pk_type,pk_season,pk_location,pk_price,pk_description,pk_duration,pk_status,pk_image);
                        
                        pklist.add(pkdata);
                    }
                } catch (Exception e) {
                }
        } catch (Exception e) {
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="../css/footer.css" rel="stylesheet" type="text/css"/>
        <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
        <script defer src="../javascript/menu.js" type="text/javascript"></script>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
       
        <style>
   
           
            .header
            {
               
                background: linear-gradient(#01b3a7,white);
            }
            
            input
            {
                border-radius: 10px;
                background-color: transparent;
                outline: none;
                border:2px solid #01b3a7;
                color: #162e44;
                font-size: 18px;
                
            }
            
            input:focus
            {
                  border:3px solid #01b3a7;
            }
           
            input::placeholder
            
            {
                color: #162e44;
                font-size: 18px;
            }
            
    
           
        </style>
    </head>
    <body>
        
        <div class="container-fluid">
            <div class="row header">
                <div class="col-3 px-4">
                    <img src="../images/Jy_logo.png" alt="" height="150px" width="60%">
                </div>
                <div class="col-7 pt-5">
                    <div class="row">
                        <div class="col-12" >
                            <h2 style="text-align: center; padding-top: -30px; font-family: 'gadems'; letter-spacing: 2px;">OUR TOURS</h2>  
                        </div>
                        
                    </div>
                   
                </div>
            </div>
        </div>
        <div class="col-12" >
            <center> <input   style=" width: 98%; height: 50px; padding: 10px;" type="search" id="searchInput" value="" name="searchInput" placeholder="Search By Package Name Or Price.." oninput="searchPackages()">  </center>  
        </div>
    <%@include file="menu.jsp" %>
    <%-- Display Success Message --%>
<% if (session.getAttribute("successMessage") != null) { %>
    <div id="successMessageContainer" class="message-container">
        <div id="successMessage" class="alert alert-success fade show" role="alert">
            <%= session.getAttribute("successMessage") %>
        </div>
        <script>
            setTimeout(function(){
                var successMessage = document.getElementById("successMessage");
                var successMessageContainer = document.getElementById("successMessageContainer");
                successMessage.classList.remove("show");
                successMessageContainer.addEventListener("transitionend", function(){
                    successMessageContainer.style.display = "none";
                }, {once: true});
            }, 2000); // Hide after 5 seconds (5000 milliseconds)
        </script>
    </div>
    <% session.removeAttribute("successMessage"); %>
<% } %>

<%-- Display Error Message --%>
<% if (session.getAttribute("errorMessage") != null) { %>
    <div id="errorMessageContainer" class="message-container">
        <div id="errorMessage" class="alert alert-danger fade show" role="alert">
            <%= session.getAttribute("errorMessage") %>
        </div>
        <script>
            setTimeout(function(){
                var errorMessage = document.getElementById("errorMessage");
                var errorMessageContainer = document.getElementById("errorMessageContainer");
                errorMessage.classList.remove("show");
                errorMessageContainer.addEventListener("transitionend", function(){
                    errorMessageContainer.style.display = "none";
                }, {once: true});
            }, 2000); // Hide after 5 seconds (5000 milliseconds)
        </script>
    </div>
    <% session.removeAttribute("errorMessage"); %>
<% } %>

    <%user u=(user)session.getAttribute("loguser");%>
    <section style="background-color: white">
    <%for(PackageData pkdata : pklist){%>
    <div class="product m-5" data-aos="fade-left" data-aos-duration="800">
      <div class="row no-gutters">
        <div class="pimage border-2  col-md-6 col-12" data-aos="fade-right">
          <img class="" src="../<%=pkdata.getpk_image()%>" alt="" height="100%" width="100%">
        </div>
        <div class="col col-lg-6 col-md-6 col-12">
          <div class="pcontent">

            <div class="co2  mt-5"  data-aos="fade-left">
                <h2 style="font-family: 'elnath'; letter-spacing: 2px; "><%=pkdata.getpk_name()%></h2>
                <p class="mt-3" style="font-size: 16px !important; font-family: 'raleway'; letter-spacing: 1.5px;  font-weight: 500;"><%=pkdata.getpk_description()%></p>
              
              <div class="py-3">
                  <%if(u==null){%>
                  <a href="login.jsp" class="pbutton2" style="font-family: 'raleway'; letter-spacing: 1.5px">Add to Favorite</a>
                  <%}else{%>
                  <a href="../favServlet?pk_id=<%=pkdata.getpk_id()%>&&u_id=<%=u.getu_id()%>" class="pbutton2" style="font-family: 'raleway'; letter-spacing: 1.5px">Add to Favorite</a>
                  
                  <%}%>
                <a href="packDetails.jsp?pk_id=<%=pkdata.getpk_id()%>" class="pbutton2" style="font-family: 'raleway'; letter-spacing: 1.5px">Explore More</a>
             
              </div>
            </div>
            <div class="pprice">
              <center>
                <p style="font-family: 'elnath'; letter-spacing: 2px; " ><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg><%=pkdata.getpk_price()%></p>
              </center>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%}%>
  </section>
   <section style="margin-bottom: 330px;"></section>
  <%@include file="footer.jsp" %>
    </body>
     <script>
         
      
    
    
        function searchPackages() {
            var searchValue = document.getElementById('searchInput').value.toLowerCase();
            var packageElements = document.getElementsByClassName('product');

            for (var i = 0; i < packageElements.length; i++) {
                var packageName = packageElements[i].querySelector('.co2 h2').textContent.toLowerCase();
                var packagePrice = packageElements[i].querySelector('.pprice p').textContent.toLowerCase();
               // var packageSeason = packageElements[i].querySelector('.co2 p').textContent.toLowerCase();
                
                if (packageName.includes(searchValue) || packagePrice.includes(searchValue) )  {
                    packageElements[i].style.display = 'block';
                } else {
                    packageElements[i].style.display = 'none';
                }
            }
        }
    </script>
</html>
