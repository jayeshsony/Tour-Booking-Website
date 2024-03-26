<%@ page import="javax.servlet.http.HttpServletRequest" %>

<%
    response.setHeader("Cache-Control", "no-cache , no-store");

    String previousUrl = request.getHeader("referer");
    int i = 0;
    if (previousUrl == null) {
        i = 1;
        session.setAttribute("previousUrl", i);
    } else {
        session.setAttribute("previousUrl", i);
    }

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <!--<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>-->
        <script src="../bootstrap/js/jQuery3.7.1.js" type="text/javascript"></script>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <style>
            #errorMessage {
                display: none;
                background-color: #ffcccc; /* Light red background color */
                color: #cc0000; /* Dark red text color */
                border: 1px solid #cc0000; /* Dark red border */
                border-radius: 5px; /* Rounded corners */
                padding: 10px; /* Padding around the text */
                margin-top: 10px; /* Margin from the top */
            }

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
                <source src="../images/logback.mp4" type="video/mp4">

            </video>
        </div>

        <div class="row">
            <!-- main  row for entire form -->
            <div id="login-form"  class="col-lg-4 col-md-10 col-10">
                <form id="loginForm" class="login-form register-form">
                    <h2 style="margin-top: -20px;">LOGIN</h2>
                    <input type="hidden" name="prevUrl" value="<%=previousUrl%>">
                    <div class="row " >
                        <div class="col-12 my-2">
                            <input type="email" name="u_email" placeholder="Email" required autocomplete="off">
                        </div>
                        <div class="col-12 my-2">
                            <input type="password" name="password" placeholder="Password" required autocomplete="off">
                        </div>
                        <div class="col-12 my-2">
                            <center>
                                <button style="margin-top: 10px;" type="button" onclick="submitForm()">LOGIN</button>
                            </center>
                        </div>
                        <div class="col-12 my-2">
                            <center>
                                <a href="register.jsp"  style="display:inline-block; margin-top:  30px;  font-size: 20px; text-decoration: none; color: white; "> Don't Have Account? CREATE ONE!</a><br>
                                <a href="forgot.jsp" style="display:inline-block; margin-top:  10px; font-size: 20px; text-decoration: none; color: white; "> Forgot password?</a>
                            </center>
                        </div>
                       
                        <div class="col-12 ">
                            <center>
                                   <a href="../index.jsp" style="display: inline-block; text-decoration: none; width: 150px;" class="pbutton1 mt-5">HOME</a>
                            </center>
                        </div>
                         <div class="col-12 my-2">
                            <p id="errorMessage" style="color: red;"></p>
                        </div>
                    </div>
                </form> 
            </div>
        </div>  
        <script>
            function submitForm() {
                var formData = $("#loginForm").serialize();

                $.ajax({
                    type: "POST",
                    url: "../loginservlet",
                    data: formData,
                    success: function (response) {
                        if (response === "admin") {
                            // Redirect to admin page for admin login success
                            window.location.href = "admin/admin.jsp";
                        } else if (response.startsWith("user,")) {
                            // Redirect to user page for user login success
                            var urlParts = response.split(",");
                            window.location.href = urlParts[1];
                        } else {
                            // Display the error message for invalid credentials with a fade effect
                            $("#errorMessage").text(response).fadeIn(400).delay(2000).fadeOut(400);
                        }
                    },
                    error: function () {
                        // Handle error, if any
                        $("#errorMessage").text("An error occurred").fadeIn(400).delay(2000).fadeOut(400);
                    }
                });
            }



        </script>
    </body>
</html>
