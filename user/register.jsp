
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache , no-store");
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Form</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script defer src="../javascript/register.js" type="text/javascript"></script>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>
        <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
        <script defer src="../javascript/menu.js" type="text/javascript"></script>
        <script src="../bootstrap/js/jQuery3.7.1.js" type="text/javascript"></script>
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
                <source src="../images/sea_-_24216 (Original).mp4" type="video/mp4">
            </video>
        </div>

        <div class="row">
            <!-- main  row for entire form -->
            <div id="login-form" class="col-lg-8 col-md-12 col-12">
                <form action="../registerServlet" method="post" id="registrationForm" class="login-form register-form ">
                    <h2 class="mt-5" style="font-size: 40px;">REGISTRATION</h2>

                    <!-- first row (first name and lastname) -->
                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-12">
                            <input type="text" id="fname" placeholder="First Name" name="f_name" required oninput="bookingtext(this)" autocomplete="off">
                        </div>
                        <div class="col-md-6 col-lg-6 col-12">
                            <input type="text" id="lname" name="l_name" placeholder="Last Name" required oninput="bookingtext(this)" autocomplete="off">
                        </div>
                    </div>
                    <!-- first row ends -->

                    <!-- second row (email name and age) -->
                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-12">
                            <input type="email" id="email" name="u_email" placeholder="Email" required autocomplete="off">
                        </div>
                        <div class="col-md-6 col-lg-6 col-12">
                            <input type="number" id="age" name="age" placeholder="Age" oninput="getage()" required autocomplete="off" >
                        </div>
                        <div class="col-md-6 col-lg-6 col-12" style="height: 20px;">

                        </div>
                        <div class="col-md-6 col-lg-6 col-12" style="height: 20px; ">
                            <p style="color: #01b3a7; font-weight: 600;" id="error-email"></p>
                        </div>
                    </div>
                    <!-- second row ends -->

                    <!-- third row (password,confirm password and pin) -->
                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-12">
                            <input type="password" id="password" name="password" placeholder="Password" required autocomplete="off">
                        </div>
                        <div class="col-md-6 col-lg-6 col-12">
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" required autocomplete="off" oninput="getpassword()">
                        </div>
                        <div class="col-12" style="height: 15px;" >
                            <p style="color: #01b3a7; font-weight: 600;" id="errorMessage1"></p>
                        </div>
                        <div class="col-12">
                            <input type="number" id="security" name="hint" placeholder="recovery pin (* In Case you forgot password)" autocomplete="off">
                        </div>

                    </div>
                    <!-- third row ends -->

                    <!-- forth row (entire optional section) -->
                    <div class="row">
                        <div class="col-12 optional mt-1 p-3">

                            <!-- forth-first row (state and city) -->
                            <div class="row">
                                <p style="color: #01b3a7; font-weight: 600; font-size: 20px;">OPTIONAL:</p>
                                <div class="col-md-6 col-lg-6 col-12">
                                    <select name="state" id="common" style="color: white;" name="common" onchange="changedropdownvalue(this.value)" >
                                        <option style="color: black;" value="select" selected disabled>Select State</option>
                                        <option style="color: black; " value="gujarat">Gujarat</option>
                                        <option style="color: black;" value="rajasthan">Rajasthan</option>
                                        <option style="color: black; " value="maharashtra">Maharashtra</option>
                                        <option style="color: black; " value="uttarpradesh">Uttar Pradesh</option>
                                    </select>
                                </div>
                                <div class="col-md-6 col-lg-6 col-12">
                                    <select name="city" id="category" style="color: white;" name="category" >
                                        <option value="" disabled selected>Select City</option>
                                    </select>
                                </div>
                            </div>
                            <!-- forth-first row ends -->

                            <!-- forth-second row (gender) -->
                            <div class="row gender mx-3">
                                <div class="col-lg-2 col-md-12 col-12 pt-4 "style="color: #01b3a7; font-weight: 600; font-size: 20px;">
                                    Gender :
                                </div>
                                <div class="col-lg-8 col-md-12 col-12 radio mt-3">
                                    <input label="Male" type="radio" id="male" name="gender" value="male">
                                    <input label="female" type="radio" id="female" name="gender" value="female">
                                    <input label="Prefer not to say" type="radio" id="other" name="gender" value="other">
                                </div>           
                            </div>
                            <!-- forth-second row ends -->
                        </div>
                    </div>

                    <!-- forth row ends -->
                    <div class="row">
                        <div class="col-6">
                            <center>
                                <button class="mt-5" type="submit" id="submitBtn" onclick="submitForm()" disabled>Submit</button>
                            </center>
                        </div>
                        <div class="col-6">
                            <center>
                                <a href="../index.jsp" style="display: inline-block; text-decoration: none; width: 200px;" class="pbutton1 mt-5">HOME</a>
                            </center>
                        </div>
                    </div>
                    <div class="col-12">
                        <p id="errorMessage"></p>
                    </div>
                </form>

            </div>
        </div>

        <script>
            function goback()
            {
                window.history.back();
            }

            function bookingtext(inputField)
            {
                inputField.value = inputField.value.replace(/[^a-zA-Z]/g, '');
            }


            $(document).ready(function () {
                $("#registrationForm").submit(function (event) {
                    event.preventDefault();
                    var formdata = $(this).serialize();

                    $.ajax({
                        type: "POST",
                        url: "../registerServlet",
                        data: formdata,
                        success: function (response) {
                            if (response.includes("success")) {
                                // Redirect to index page for login success
                                window.location.href = "../index.jsp";
                            } else if (response.includes("User already exists")) {
                                // Redirect to user page for user login success

                                $("#errorMessage").text("User already exists").fadeIn(400).delay(2000).fadeOut(400);
                            } else {
                                // Display the error message for invalid credentials with a fade effect
                                alert('Registration Failed');
                            }
                        },
                        error: function (error) {
                            // Handle error, if any
                            alert('error');
                        }
                    });

                });
                $("input[required]").on("input", function () {
                    var valid = true;
                    $("input[required]").each(function () {

                        if ($(this).val() === "")
                        {
                            valid = false;
                            return false;
                        }
                    });
                    $("#submitBtn").prop("disabled", !valid);
                });
            });

        </script>
    </body>

</html>
