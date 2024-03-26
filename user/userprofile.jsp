<%-- 
    Document   : userprofile
    Created on : 12-Feb-2024, 2:39:37 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="newpackage.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.time.temporal.ChronoUnit" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%
    response.setHeader("Cache-Control", "no-cache , no-store");
    int x = 0;
    if (session == null || session.getAttribute("loguser") == null) {
        x = 1;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <title>Document</title>
    </head>
    <style>
        *
        {
            margin: 0%;
            padding: 0%;
            box-sizing: border-box;
            overflow: hidden;
        }

        #profile-pic , #profile-pic1
        {
            width: 175px;
            height: 175px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid #01b3a7;
            margin: 30px auto;
        }

        #profile-pic img ,
        #profile-pic1 img
        {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        input , textarea , select
        {
            width: 100%;
            height: 45px;
            padding: 10px;
            outline: none;
            border: 1px  solid #ccc;
            border-radius: 5px;
            box-shadow: 4px 8px 15px -3px #ccc;

        }

        input:focus , textarea:focus , select:focus
        {
            border-color: #01b3a7;
        }

        .container .row
        {
            margin-top: 10px;
        }

        .thirdrow-2
        {
            display: flex;
            justify-content: space-between;
        }

        button
        {
            background-color: #01b3a7;
            width: 90%;
            border: 1px solid #01b3a7;
            border-radius: 5px;
            color: white;
            letter-spacing: 0.3rem;
            padding: 10px !important;
            box-shadow: 4px 8px 15px -3px #ccc;
            height: 40px;
        }

        .booking-form
        {
            height: 100vh;
            width: 100%;
            padding-top: 5vh;
        }

        label
        {
            color: #01b3a7;
            font-weight: 500;
            letter-spacing: 0.1rem;
        }

        .radio input
        {
            width: auto;
            height: 45px;
            appearance: none;
            outline: none;
            cursor: pointer;
            color: #162e44;
            border-radius: 5px;
            padding: 5px 10px;
            margin: 5px;
            font-size: 16px;
            transition: all 100ms linear;
            background-color: white;
        }

        .radio input:checked
        {
            background-color: #01b3a7;
            color: #162e44;
        }

        .radio input::before
        {
            content: attr(label);
            display: inline-block;
            text-align: center;
        }

        .modifybuttons
        {
            display: block;
            padding: 10px;
            margin: 10px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-radius: 5px;
            height: 45px;
            background-color: #01b3a7;
            width: 90%;
            text-decoration: none;
            color: white;
            transition: all 0.3s ease;
        }
        .modifybuttons:hover
        {
            color: white;
            box-shadow: 0px 7px 13px 0px rgba(0, 0, 0, 0.4);
        }
        .firstdiv
        {
            border: 2px solid #01b3a7;
            height: 75vh;
            background-color: aliceblue;
            border-radius: 10px;
            box-shadow: 0px 7px 13px 0px rgba(0, 0, 0, 0.7);
        }

    </style>
    <body>
        <%@include file="menu.jsp" %>
        <%if (x == 1) {
                response.sendRedirect("login.jsp");
            } else {%>
        <!-- main div starts-->

        <%
            List<BookingData> booklist = new ArrayList<>();
            user u = (user) session.getAttribute("loguser");

            int u_id = u.getu_id();
            String f_name = null;
            String l_name = null;
            String u_email = null;
            int age = 0;
            String state = null;
            String city = null;
            String gender = null;
            String image = null;
            int check = 0;
            String pk_image = null;
            int b_id = 0;

            try {
                Connection con = connection.getconnection();

                String sql1 = "select * from user_info where u_id=?";

                PreparedStatement pts1 = con.prepareStatement(sql1);
                pts1.setInt(1, u_id);

                ResultSet rs = pts1.executeQuery();

                if (rs.next()) {
                    f_name = rs.getString("f_name");
                    l_name = rs.getString("l_name");
                    u_email = rs.getString("u_email");
                    age = rs.getInt("age");
                    state = rs.getString("state");
                    city = rs.getString("city");
                    gender = rs.getString("gender");
                    image = rs.getString("image");
                }

                String sql2 = "select * from booking where u_id=?";
                PreparedStatement pts2 = con.prepareStatement(sql2);
                pts2.setInt(1, u_id);

                ResultSet rs1 = pts2.executeQuery();

                while (rs1.next()) {
                    check = 1;

                    int passenger = rs1.getInt("passenger");
                    int tprice = rs1.getInt("tprice");
                    String pk_name = rs1.getString("pk_name");
                    int pk_id = rs1.getInt("pk_id");
                    b_id = rs1.getInt("b_id");
                    String purchased_date = rs1.getString("purchased_date");
                    String from_date = rs1.getString("from_date");
                    
                    String sql3 = "select pk_image from package where pk_id=?";
                    PreparedStatement pts3 = con.prepareStatement(sql3);
                    pts3.setInt(1, pk_id);

                    ResultSet rs2 = pts3.executeQuery();

                    if (rs2.next()) {
                        pk_image = rs2.getString("pk_image");
                    }

                    BookingData bd = new BookingData(b_id, passenger, tprice, pk_name, pk_id, pk_image, purchased_date, from_date);

                    booklist.add(bd);
                }
            } catch (Exception e) {

                e.getMessage();
            }


        %>
        <div class="container-fluid " id="profile" style="margin-bottom: -50px;">
            <div class="row">
                <div class="col-3">
                    <img src="../images/Jy_logo.png" alt="" height="200px;" width="200px;"/>
                </div>
                <div class="col-9"></div>
            </div>
        </div>
        <div class="container entirepage">
            <!-- first row profile page starts -->
            <div class="row"  style="height: 90vh;">
                <!-- first row first column starts -->
                <div class="col-4 mx-4 firstdiv">
                    <div id="profile-pic1">
                        <img id="profile-img1" src="../<%=image%>" alt="">
                    </div>
                    <div class="col-8" style="margin: auto; text-align: center;">
                        <h2 class="my-5" style="color: #162e44;"><%=f_name%> <%=l_name%></h2>
                        <a href="#editprofile" class="modifybuttons">EDIT PROFILE</a>
                        <a href="#bookinghistory" class="modifybuttons">BOOKING HISTORY</a>
                    </div>
                </div>
                <!-- first row first column ends -->

                <!-- first row second column starts -->
                <div class="col-7 mx-3 py-5 firstdiv">
                    <form action="">
                        <!-- 1-2-1 (first name) starts -->
                        <div class="row ">
                            <div class="col-4">
                                <label for="fname" class="p-2">FIRST NAME:</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="fname" value="<%=f_name%>" readonly>
                            </div>
                        </div>
                        <!-- 1-2-1 (first name) ends -->

                        <!-- 1-2-2 (last name) starts -->
                        <div class="row pt-3">
                            <div class="col-4">
                                <label for="lname" class="p-2">LAST NAME:</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="lname" value="<%=l_name%>" readonly>
                            </div>
                        </div>
                        <!-- 1-2-2 (last name) ends -->

                        <!-- 1-2-3 (email) starts -->
                        <div class="row pt-3">
                            <div class="col-4">
                                <label for="email" class="p-2">EMAIL:</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="email" value="<%=u_email%>" readonly>
                            </div>
                        </div>
                        <!-- 1-2-3 (email) ends -->

                        <!-- 1-2-4 (age) starts -->
                        <div class="row pt-3">
                            <div class="col-4">
                                <label for="age" class="p-2">AGE:</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="age" value="<%=age%>" readonly>
                            </div>
                        </div>
                        <!-- 1-2-4 (age) ends -->

                        <!-- 1-2-5 (gender) starts -->
                        <div class="row pt-3">
                            <div class="col-4">
                                <label for="gender" class="p-2">GENDER:</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="gender" value="<%=gender%>" readonly>
                            </div>
                        </div>
                        <!-- 1-2-5 (gender) ends -->

                        <!-- 1-2-6 (state) starts -->
                        <div class="row pt-3">
                            <div class="col-4">
                                <label for="state" class="p-2">STATE:</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="state" value="<%=state%>" readonly>
                            </div>
                        </div>
                        <!-- 1-2-6 (state) ends -->

                        <!-- 1-2-7 (city) starts -->
                        <div class="row pt-3">
                            <div class="col-4">
                                <label for="city" class="p-2">CITY:</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="city" value="<%=city%>" readonly>
                            </div>
                        </div>
                        <!-- 1-2-7 (city) ends -->
                    </form>
                </div>
                <!-- first row second column ends -->
            </div>
            <!-- first row profile page ends -->

            <!-- second row edit profile page starts -->
            <div class="row" style="height: 100vh;">
                <div class="col-12 mt-1" id="editprofile" style="height: 101vh; padding-top: 3vh; border-radius: 10px; border: 3px solid #01b3a7; background-color: aliceblue;">
                    <form action="../UserprofileServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="state1" value="<%=state%>">
                        <input type="hidden" name="city1" value="<%=city%>">
                        <input type="hidden" name="gender1" value="<%=gender%>">
                        <input type="hidden" name="image1" value="<%=image%>">
                        <input type="hidden" name="u_id" value="<%=u_id%>">
                        <!-- extra for img starts -->
                        <div class="row">
                            <div class="col-4">
                                <div id="profile-pic">
                                    <img id="profile-img" src="<%=image%>" alt="">
                                </div>
                            </div>
                            <div class="col-4" style="display: flex; align-items: center;">
                                <!--                                <input type="file" id="file-input" style="display: none;" accept="image/*" name="image" onchange="handleFileChnage(this)">-->
                                <input type="file" id="file-input" style="display: none;" name="image" onchange="handleFileChnage(this)">
                                <label for="file-input" class="modifybuttons" id="file-label">Choose New Image</label>
                            </div>
                            <div class="col-4 pt-5">
                                <a href="#profile" class="modifybuttons">PROFILE</a>
                                <a href="#bookinghistory" class="modifybuttons">BOOKING HISTORY</a>
                            </div>
                        </div>
                        <!-- extra for img ends -->

                        <!-- first row (first name and last name) starts-->
                        <div class="row">
                            <div class="col-6">
                                <input type="text" id="fname" placeholder="First Name" name="f_name" value="<%=f_name%>" oninput="bookingtext(this)" required autocomplete="off">
                            </div>
                            <div class="col-6">
                                <input type="text" id="lname" placeholder="Last Name" name="l_name" value="<%=l_name%>" oninput="bookingtext(this)" required autocomplete="off">
                            </div>
                        </div>
                        <!-- first row (first name and last name) ends-->

                        <!-- second row (email and age) starts-->
                        <div class="row">
                            <div class="col-6">
                                <input type="email" id="email" placeholder="eg.. abc@gmail.com" name="u_email" value="<%=u_email%>" required autocomplete="off" oninput="validateEmail()">
                                <p style="height: 10px; color: red;" id="error-email"></p>
                            </div>
                            <div class="col-6">
                                <input type="number" id="age" placeholder="Age" name="age" oninput="validateForm()" value="<%=age%>" required autocomplete="off">
                                <p style="height: 10px; color: red;" id="error-email"></p>
                            </div>
                        </div>
                        <!-- second row (email and age) starts-->

                        <!-- third row (state and city) starts-->
                        <div class="row">
                            <div class="col-6">
                                <select name="state" id="common"  name="state" onchange="changedropdownvalue(this.value)">
                                    <option style="color: black;" value="select" selected disabled>Select State</option>
                                    <option style="color: black; " value="gujarat">Gujarat</option>
                                    <option style="color: black;" value="rajasthan">Rajasthan</option>
                                    <option style="color: black; " value="maharashtra">Maharashtra</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <select name="city" id="category"  name="city">
                                    <option value="" disabled selected>Select City</option>
                                </select>
                            </div>
                        </div>
                        <!-- third row (state and city) ends-->

                        <!-- forth row (gender) -->
                        <div class="row gender">
                            <div class="col-lg-2 col-md-12 col-12 pt-4"style="color: #01b3a7; font-weight: 600; font-size: 18px;">
                                Gender :
                            </div>
                            <div class="col-lg-8 col-md-12 col-12 radio mt-3">
                                <input label="Male" type="radio" id="male" name="gender" value="male">
                                <input label="female" type="radio" id="female" name="gender" value="female">
                                <input label="Prefer not to say" type="radio" id="other" name="gender" value="other">
                            </div>           
                        </div>
                        <!-- forth row (gender) -->
                        <center><input style="width: 50%;" type="submit" value="Save Changes" class="modifybuttons"></center>
                    </form>
                </div>
            </div>
            <!-- second row edit profile page ends -->

            <!-- third row booking history starts -->
            <div class="row mt-5 firstdiv" id="bookinghistory" style="height:100vh; overflow-y: scroll;">
                <div class="col-8 pt-5">
                    <h1 style="text-align: left; text-decoration:underline;color: #01b3a7; font-family: 'elnath'">MY BOOKINGS:</h1>
                </div>
                <div class="col-4 mt-3">
                    <a href="#profile" class="modifybuttons">PROFILE</a>
                    <a href="#editprofile" class="modifybuttons">EDIT PROFILE</a>
                </div>
                <%if (check == 1) {%>
                <!-- dynamic data loop starts here -->
                <%
                    for (BookingData bd : booklist) {
                        String futureDateStr = bd.getFrom_date();
                        long daysDifference = 0;

                        if (futureDateStr != null && !futureDateStr.isEmpty()) {
                            try {
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                LocalDate futureDate = LocalDate.parse(futureDateStr, formatter);

                                LocalDate today = LocalDate.now();
                                daysDifference = ChronoUnit.DAYS.between(today, futureDate);

                            } catch (Exception e) {
                                out.println("Error parsing the future date. Please provide a valid date in the format yyyy-MM-dd.");
                            }
                        } else {
                            out.println("Please provide a future date.");
                        }
                %>
                <div class="col-11 mt-1" style="margin:auto">
                    <div class="row firstdiv" style="height: max-content;">
                        <div class="col-4" style="padding-left: 0% !important;">
                            <img src="../<%=bd.getPk_image()%>" alt="" height="300px" width="100%" style="padding: 5px; border-radius: 10px;"> 
                        </div>
                        <div class="col-4" style="display: flex; align-items: center; justify-content: space-between;">
                            <div class="row">
                                <div class="col-12 my-2"><h5>PACKAGE NAME:</h5></div>
                                <div class="col-12 my-2"><h5>INVOICE NO:</h5></div>
                                <div class="col-12 my-2"><h5>BILLED AMOUNT:</h5></div>
                                <div class="col-12 my-2"> <h5>BOOKING DATE:</h5></div>
                            </div>
                            <div class="row">
                                <div class="col-12 my-2"><h5><%=bd.getPk_name()%></h5></div>
                                <div class="col-12  my-2"><h5>INV-2024-<%=bd.getB_id()%></h5></div>
                                <div class="col-12 my-2"><h5><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                        <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
                                        </svg><%=bd.getTprice()%></h5></div>
                                <div class="col-12 my-2"> <h5><%=bd.getPurchased_date()%></h5></div>
                            </div>



                        </div>
                        <div class="col-4" style="display: flex; align-items: center; justify-content: space-between;">
                            <div class="row">
                                <div class="col-12">
                                    <a href="packDetails.jsp?pk_id=<%=bd.getPk_id()%>" class="modifybuttons">VIEW PACKAGE</a>
                                </div>
                                <div class="col-12">
                                    <%if (daysDifference >= 7) {%>
                                    <a href="../cancelOrderServlet?b_id=<%=bd.getB_id()%>" class="modifybuttons" >CANCEL PACKAGE</a>

                                    <%} else {%>
                                    <input type="button" class="modifybuttons" value="CANCEL PACKAGE" style="cursor: not-allowed; background-color: #ccc;" disabled>
                                    <span style="color: #162e44; margin-left: 20px; letter-spacing: 1px;">*Cancellation Period is Over</span>
                                    <%}%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <%}%>
                <!-- dynamic data loop ends here -->
                <%}else{%>
                <center><h1 style="color: #01b3a7; font-family: 'elnath'; font-weight: 600;">...no record found...</h1></center>
                <%}%>
            </div>
            <!-- third row booking history ends -->

        </div>
        <!-- main div ends-->

        <script>
            var commonvalues = {
                gujarat: ["B.K", "Ahmedabad", "Surat", "Vadodara", "Jamnagar"],
                rajasthan: ["Jodhpur", "Udaipur", "Chittorgarh"]
            };
            function changedropdownvalue(value) {
                if (value.length === 0) {
                    document.getElementById("category").innerHTML = "<option value='' disabled selected>Select City</option>";
                } else {
                    var commonOptions = "";

                    for (var i = 0; i < commonvalues[value].length; i++) {
                        commonOptions += "<option style='color:black;' value='" + commonvalues[value][i] + "'>" + commonvalues[value][i] + "</option>";
                    }

                    document.getElementById("category").innerHTML = commonOptions;
                }
            }

            function handleFileChnage(input)
            {
                var fileInput = input;
                var profileImg = document.getElementById('profile-img');

                if (fileInput.files.length > 0)
                {
                    var objectURL = URL.createObjectURL(fileInput.files[0]);
                    profileImg.src = objectURL;
                }
            }

            function validateForm()
            {
                var age = document.getElementById('age').value;
                var spanError = document.getElementById('error-age');
                if (age < 18)
                {
                    spanError.textContent = "AGE must be above 18";
                } else
                {
                    spanError.textContent = "";
                }
            }

            function validateEmail()
            {
                var emailInput = document.getElementById('email');
                var spanError = document.getElementById('error-email');
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (!emailRegex.test(emailInput.value))
                {
                    spanError.textContent = 'invalid email format';
                } else
                {
                    spanError.textContent = '';
                }
            }


            function bookingtext(inputField)
            {
                inputField.value = inputField.value.replace(/[^a-zA-Z]/g, '');
            }

            function bookingnumber(inputField)
            {
                inputField.value = inputField.value.replace(/\D/g, '');
            }


        </script>

        <%}%>
    </body>
</html>
