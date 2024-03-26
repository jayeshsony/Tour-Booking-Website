
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache , no-store");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="../css/forgot.css" rel="stylesheet" type="text/css"/>
     
        <style>
            .pbutton1
            {
                border: 2px solid #01b3a7;
                color: white;
                padding: 10px 20px;
                background-color: #01b3a7;
                transition: transform 0.3s ease-in-out;
                width: 90%;
                border-radius: 10px;
            }

            .pbutton1:hover
            {
                border: 2px solid #01b3a7;
                color: white;
                padding: 10px 20px;
                background-color: #01b3a7;
                transform: scale(1.1);
            }
        </style>
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
            <div id="login-form" class="col-lg-4 col-md-10 col-10">
                <form action="../forgotservlet" method="post" id="registrationForm" class="login-form register-form ">
                    <h2 style="margin-top: -20px;">FORGOT PASSWORD</h2>

                    <div class="row " >
                        <div class="col-12 my-2">
                            <input type="email" id="bemail" name="bemail" placeholder="Email.." required autocomplete="off">
                        </div>     

                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-12 my-2">
                            <input type="password" id="password" name="password" placeholder="Password" required autocomplete="off">
                        </div>
                        <div class="col-md-12 col-lg-12 col-12 my-2">
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" oninput="getpassword()" required autocomplete="off">
                        </div>
                        <div class="col-12">
                            <p style="height: 15px; color:#01b3a7; font-weight: 600;"  id="errorMessage1"></p>
                        </div>
                        <div class="col-12">
                            <input type="text" id="security" name="hint"  placeholder="Recovery pin " autocomplete="off">
                        </div>

                    </div>


                    <center>
                        <button style="margin-top: 30px;" type="submit" id="submitBtn" onclick="submitForm()" >CHANGE</button>

                    </center>
                    <div class="col-12 my-5">
                        <center>
                            <a href="../index.jsp" style="display: inline-block; text-decoration: none; width: 150px;" class="pbutton1 mt-5">HOME</a>
                        </center>
                    </div>
                </form> 
                <% if (session.getAttribute("Error") != null) {%>
                    <div id="errorMessageContainer" class="message-container">
                        <div id="errorMessage" class="alert alert-danger fade show" role="alert">
                            <%= session.getAttribute("Error")%>
                        </div>
                        <script>
                            setTimeout(function () {
                                var errorMessage = document.getElementById("errorMessage");
                                var errorMessageContainer = document.getElementById("errorMessageContainer");
                                errorMessage.classList.remove("show");
                                errorMessageContainer.addEventListener("transitionend", function () {
                                    errorMessageContainer.style.display = "none";
                                }, {once: true});
                            }, 2000); // Hide after 5 seconds (5000 milliseconds)
                        </script>
                    </div>
                    <% session.removeAttribute("Error"); %>
                    <% }%>
            </div>
        </div>  

        <script>
            function getpassword()
            {
                var confirmPassword = document.getElementById('confirmPassword').value;
                var password = document.getElementById('password').value;
                var errorMessage1 = document.getElementById("errorMessage1");
                errorMessage1.innerHTML = "";
                if (password !== confirmPassword) {
                    errorMessage1.innerHTML = "*Password don't match";
                }
            }


        </script>
    </body>
</html>