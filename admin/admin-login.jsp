<%-- 
    Document   : admin-login
    Created on : 13-Feb-2024, 4:40:01 pm
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
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="video-container">
            <video id="fullscreen-video" autoplay loop muted>
                <!--<source src="../images/logback.mp4" type="video/mp4">-->
                <source src="../images/sea_-_24216 (Original).mp4" type="video/mp4">
            </video>
        </div>

        <div class="row">
            <!-- main  row for entire form -->
            <div id="login-form"  class="col-lg-4 col-md-10 col-10">
                <form action="../adminLogin" method="post" id="registrationForm" class="login-form register-form ">
                    <h2 style="margin-top: -20px;">LOGIN</h2>

                    <div class="row " >
                        <div class="col-12 my-2">
                            <input type="email" name="u_email" placeholder="Email" required autocomplete="off">
                        </div>
                        <div class="col-12 my-2">
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                        <div class="col-12 my-2">
                            <center>
                                <button style="margin-top: 10px;" type="submit" >LOGIN</button>
                            </center>
                        </div>
                        <% if (session.getAttribute("error") != null) {%>
                        <div id="successMessageContainer" class="message-container">
                            <div id="successMessage" class="alert alert-danger fade show" role="alert">
                                <%= session.getAttribute("error")%>
                            </div>
                            <script>
                                setTimeout(function () {
                                    var successMessage = document.getElementById("successMessage");
                                    var successMessageContainer = document.getElementById("successMessageContainer");
                                    successMessage.classList.remove("show");
                                    successMessageContainer.addEventListener("transitionend", function () {
                                        successMessageContainer.style.display = "none";
                                    }, {once: true});
                                }, 2000); // Hide after 5 seconds (5000 milliseconds)
                            </script>
                        </div>
                        <% session.removeAttribute("error"); %>
                        <% }%>

                    </div>
                </form> 
            </div>
        </div>  
    </body>
</html>
