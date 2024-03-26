<%-- 
    Document   : aboutUs
    Created on : 02-Feb-2024, 3:40:23 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     response.setHeader("Cache-Control", "no-cache , no-store");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/aboutUs.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
  <link href="css/footer.css" rel="stylesheet" type="text/css"/>
        <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
        <script defer src="../javascript/menu.js" type="text/javascript"></script>
        <style>
            *
            {
                list-style: none;
                
            }
              .header
            {
               
                background: linear-gradient(#01b3a7,white);
                height: 150px;
                letter-spacing: 4px;
                font-family: gadems;
                color: #162e44;
                
            }
        </style>
    </head>
    <body>
          <div class="container-fluid header">
            <div class="row ">
                <div class="col-3 px-4" style="">
                    <img style="" src="../images/Jy_logo.png" alt="" height="150px" width="200px">
                </div>
                <div class="col-6  " style="margin-left: 130px;">
                    <p style="font-size: 40px;">ABOUT US</p>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
        <%@include file="menu.jsp" %>
       
        <div  style="background-color: white; padding-bottom: 50px; " >
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-12 main-content">
                    <h2>Your Ultimate Adventure Partner</h2>
                    <p>Welcome to ADVENTOUR, where we transform your dreams into unforgettable adventure . As a premier tour and trek organizing company, we pride ourselves on delivering exceptional experiences that go beyond expectations. Established with a passion for exploration and a commitment to excellence, we are your ultimate adventure partner.</p>
                </div>
                <div class="col-lg-6 col-md-6 col-12 main-img">
                    
                    <img src="../images/graph.png" width="100%" height="100%" alt=""/>
                    <img class="image" src="../images/6990-removebg-preview.png" width="75%" height="75%" alt=""/>
                </div>
            </div>
        </div>
        <hr style="border-bottom: 3px solid #01b3a7; margin-top: -30px;">
        <div class="div"></div>
        
        <div class="col-1 infoline2"></div>
        
        <div class="container">
            <div class="row pt-4">
                <div class="col-1">
                    <div class="infocircle"></div>
                </div>
                <div class="col-11 infocontent">
                    <h2>Exemplary Expertise:</h2>
                    <p>Our team Comprises seasons professionals who are well-versed in the art of organizing seamless tours and treks. With years oof experience, we possess extensive knowledge of the destinations we offer, ensuring you receive expert guidance at every step.</p>
                    <hr style="border-bottom: 3px solid #01b3a7;">
                </div>
            </div>
            
            <div class="row">
                <div class="col-1">
                    <div class="infocircle"></div>
                </div>
                <div class="col-11 infocontent">
                    <h2>Tailor-Made Adventures:</h2>
                    <p>Recognizing that every traveler is unique, we specialize in crafting tailor-made adventures. Whether you seek a challenging trek to remote landscapes or a leisurely tour of cultural gems, our customized itineraries cater to your preferences, ensuring a truly personalized journey.</p>
                    <hr style="border-bottom: 3px solid #01b3a7;">
                </div>
            </div>
            
            <div class="row">
                <div class="col-1">
                    <div class="infocircle"></div>
                </div>
                <div class="col-11 infocontent">
                    <h2>All-Inclusive Packages:</h2>
                    <p>At Adventour, we believe in hassle-free travel. our all-inclusive packages cover everything from accommodations and transportation to permits and meals, so you can focus on immersing yourself in the experience without worrying about the details.</p>
                    <hr style="border-bottom: 3px solid #01b3a7;">
                </div>
            </div>
            
            <div class="row">
                <div class="col-1">
                    <div class="infocircle"></div>
                </div>
                <div class="col-11 infocontent">
                    <h2>Passionate Guides:</h2>
                    <p>Our local guides are not just experts in navigating the terrain; they are passionate storytellers and cultural ambassadors. They add a personal touch to your journey, sharing insights and anecdotes that enrich your understanding of the destination.</p>
                    <hr style="border-bottom: 3px solid #01b3a7;">
                </div>
            </div>
            
            <div class="row">
                <div class="col-1">
                    <div class="infocircle"></div>
                </div>
                <div class="col-11 infocontent">
                    <h2>Safety First:</h2>
                    <p>Your safety is our top priority. We adhere to strict safety standards and procedures, employing experienced guides and providing top-notch equipment to ensure that every adventure with us is not only thrilling but also secure.</p>
                    <hr style="border-bottom: 3px solid #01b3a7;">
                </div>
            </div>
            
            <div class="row">
                <div class="col-1">
                    <div class="infocircle"></div>
                </div>
                <div class="col-11 infocontent">
                    <h2>Sustainable Tourism:</h2>
                    <p>Committed to preserving the natural beauty and cultural heritage of the regions we explore, we embrace sustainable tourism practices. Our eco-friendly initiative contribution to the well-being of local communities and the preservation f the environment.</p>
                    <hr style="border-bottom: 3px solid #01b3a7;">
                </div>
            </div>
        </div>
        </div> 
        <section style="margin-bottom: 330px;"></section>
        <%@include file="footer.jsp" %>
    </body>
</html>
