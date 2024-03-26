<%-- 
    Document   : bookinform
    Created on : 03-Feb-2024, 1:41:45 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="newpackage.*" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%
    response.setHeader("Cache-Control", "no-cache , no-store");
    int x = 0;
    if (session == null || session.getAttribute("loguser") == null) {
        x = 1;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BOOKING</title>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="../css/bookingform.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>

        <%if (x == 1) {
                response.sendRedirect("login.jsp");
            } else {%>
        <!-- booking from starts -->
        <%@include file="menu.jsp"%>
        <%
            int pk_id = Integer.parseInt(request.getParameter("pk_id"));
            int pkId = 0;
            String pk_name = null;
            String pk_image = null;
            String pk_season = null;
            int duration = 0;
            double price = 0;
            int u_id = 0;

            user u = (user) session.getAttribute("loguser");
            u_id = u.getu_id();
            try {
                Connection con = connection.getconnection();

                String sql = "select * from package where pk_id=?";

                PreparedStatement pts1 = con.prepareStatement(sql);
                pts1.setInt(1, pk_id);

                ResultSet rs = pts1.executeQuery();

                if (rs.next()) {
                    pkId = rs.getInt("pk_id");
                    pk_name = rs.getString("pk_name");
                    pk_image = rs.getString("pk_image");
                    pk_season = rs.getString("pk_season");
                    duration = rs.getInt("pk_duration");
                    price = rs.getInt("pk_price");

                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <section class="bookingform container" id="bookingform">
            <div class="row">
                <!-- booking-frame starts -->
                <div class="col-lg-4 col-md-6 col-10 bframe">
                    <div class="row">
                        <div class="col-12" style="height: 200px; object-fit: cover;">
                            <img src="../<%=pk_image%>" alt="" height="100%" width="100%" style="border-radius: 10px">
                        </div>

                        <div class="col-12">
                            <center><h4 class="bframetitle" style="font-family: 'elnath'"><%=pk_name%></h4></center>
                        </div>


                        <div class="col-12 framecontent">
                            <div class="row">
                                <div class="col-8">
                                    <p class="pp col-6" style="height: 40px;">AVAILABLE IN</p>
                                    <p  class="pp" >DURATION</p>
                                </div>
                                <div class="col-4">
                                    <p class="col-6 pp"  style="height: 40px;" id="seasonTitle"><%=pk_season%></p>
                                    <p  class="pp" id="duration" ><%=duration%></p>
                                </div>
                            </div>

                            <div class="row" style="margin-top: -10px;">
                                <div class="col-8">
                                    <p class="pp">PACKAGE PRICE:</p>
                                </div>
                                <div class="col-4">
                                    <p class="pp" id="ogprice"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                        <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
                                        </svg><%=price%></p>
                                </div>
                            </div>

                            <div class="row" style="margin-top: -10px;">
                                <div class="col-8">
                                    <p class="pp">TOTAL TOURIST:</p>
                                </div>
                                <div class="col-4">
                                    <p class="pp" id="totaltourist">1</p>
                                </div>
                            </div>
                            <center><div class="col-12" style="height: 5px; border-bottom: 1px solid #ccc; margin-top: -15px;"></div></center>

                            <div class="row">
                                <div class="col-8">
                                    <p class="pp">TOTAL PRICE:</p>
                                </div>
                                <div class="col-4" >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                    <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
                                    </svg> <span class="pp" id="totalprice"><%=price%></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- booking-frame ends -->

                <!-- actual booking form starts here -->
                <div class="col-lg-8 col-md-6 col-10 bog">
                    <form action="../bookingservlet" method="post" onsubmit="return validateForm()" style="border: 2px solid #01b3a7; border-radius: 8px; padding: 20px;   box-shadow: 0px 4px 23px -7px rgba(0,0,0,0.86);">
                        <input type="hidden" name="totalpricehidden" value="" id="totalpricehidden" placeholder="pp"/>
                        <input type="hidden" name="totaltouristhidden" value="" id="totaltouristhidden" placeholder="pp"/>
                        <input type="hidden" name="pk_id" value="<%=pkId%>">
                        <input type="hidden" name="u_id" value="<%=u_id%>"> 
                        <input type="hidden" name="pk_name" value="<%=pk_name%>">
                        <div class="row">
                            <div class="col-3 bheader" style="padding: 5px;">
                                <h2 style="font-family: 'elnath'; padding-top: 7px; ">BOOKING:</h2>
                            </div>
                        </div>

                        <!-- firstrow (name) starts -->
                        <div class="row">
                            <div class="col-2 pt-3">
                                <label for="">NAME:</label>
                            </div>
                            <div class="col-10">
                                <div class="row">
                                    <div class="col-6">
                                        <input type="text" id="bfname" name="bfname" placeholder="FIRST NAME" oninput="bookingtext(this)" required autocomplete="off">
                                        <!--<input type="text" name="bfname" value="bfname">-->
                                    </div>
                                    <div class="col-6">
                                        <input type="text" id="blname" name="blname" placeholder="LAST NAME" oninput="bookingtext(this)" required autocomplete="off">
                                        <!--<input type="text" name="blname" value="blname">-->    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- firstrow (name) ends -->

                        <!-- second row (mobile number) starts -->
                        <div class="row">
                            <div class="col-2">
                                <label for="bmobile">MOBILE:</label>
                            </div>
                            <div class="col-10">
                                <input type="tel" id="bmobile" name="bmobile" pattern="[0-9]{10}" maxlength="10" placeholder="1234567890" oninput="bookingnumber(this)" required autocomplete="off">
                                <!--<input type="text" name="bmobile" value="bmobile">-->
                            </div>
                        </div>
                        <!-- second row (mobile number) ends -->

                        <!-- third row (email) starts -->
                        <div class="row">
                            <div class="col-2">
                                <label for="bemail">EMAIL:</label>
                            </div>
                            <div class="col-10">
                                <input type="email" id="bemail" name="bemail" placeholder="abc@gmail.com"  oninput="validateEmail()" required autocomplete="off">
                                <!--<input type="text" name="bemail" value="bemail">-->
                            </div>
                        </div>
                        <!-- third row (email) ends -->

                        <!-- forth row (total passanger) starts -->
                        <div class="row">
                            <div class="col-4">
                                <label for="bpassanger">NO OF TOUR BUDDIES:</label>
                            </div>
                            <div class="col-8">
                                <input type="number" id="bpassanger" name="bpassanger" placeholder="0-10" min="0" max="10" oninput="performMultiplication(),validatepassanger()" required autocomplete="off">
                                <!--<input type="number" name="bpassanger" value="passenger">-->
                            </div>
                        </div>
                        <!-- forth row (total passanger) ends -->

                        <!-- fifth row (pickup point) starts -->
                        <div class="row">
                            <div class="col-4">
                                <label for="pickupPoints">CHOOSE PICKUP POINT:</label>
                            </div>
                            <div class="col-8">
                                <select  id="pickupPoints" name="pick_city" onchange="populateAddresses()">
                                    <option class="option" value="select" selected disabled>--select--</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Chennai">Chennai</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Ahmedabad">Ahmedabad</option>
                                    <option value="Lucknow">Lucknow</option>
                                </select>

                                <input type="hidden" id="inputField" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <label for="pickupAddresses"> SELECT ADDESS:</label>
                            </div>
                            <div class="col-8">
                                <select id="pickupAddresses" name="pick_point">
                                    <option value="select" selected disabled>select address</option>
                                </select>

                            </div>
                        </div>
                        <!-- fifth row (pickup point) ends -->

                        <!-- sixth row (from , to date) starts-->
                        <div class="row">
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-2">
                                        <label for="bfromdate">FROM:</label>
                                    </div>
                                    <div class="col-10">
                                        <input type="date" id="bfromdate" name="from_date" onchange="calculateEndDate()" required autocomplete="off" />
                                        <!--<input type="date" name="from_date"  value="from_date">-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-2">
                                        <label for="benddate">TO:</label>
                                    </div>
                                    <div class="col-10">
                                        <input type="text" id="bendDate" name="to_date" readonly/>
                                        <!--<input type="date" name="to_date"  value="to_date">-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- sixth row (from , to date) ends-->

                        <center><p id="error-email" class="error-email" style="color: red; height: 20px; padding-top:20px;"></p>
                            <div class="row">
                                <div class="col-6">
                                    <a class="internalbutton mt-5" onclick="goback()">GO BACK</a>
                                </div>
                                <div class="col-6">
                                    <a class="internalbutton mt-5" onclick="redirectToInternalDiv()">PROCEED TO PAY</a>
                                </div>
                            </div>
                        </center>

                </div>
                <!-- actual booking form ends here -->
            </div>
        </section>  
        <!-- booking from ends -->


        <!-- creditcard starts -->
        <div class="main" id="creditcard"></div>
        <section class="secondpart container">
            <section class="container" style="position:relative; z-index: 1;">
                <div class="card">
                    <div class="card-front">
                        <div class="logos">
                            <img src="../images/chip.png" alt=""/>
                            <img src="../images/visa.png" alt=""/>
                        </div>
                        <div class="number">
                            <center><h3 id="outcnumber">************</h3></center>
                        </div>

                        <div class="row info mt-4 ">
                            <div class="col-6 name">
                                <p>card holder</p>
                                <h5 id="outcname">*******</h5>
                            </div>
                            <div class="col-5 expiry" style="margin-left: 30px;" >
                                <div class="row mt-2 ">
                                    <div class="col-4"><p>valid</p><p>thru</p></div>
                                    <div class="col-8"> <h5><span id="outcmonth">**</span><span>/</span><span id="outcyear">**</span></h5></div>

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="card-back">
                        <div class="strip" style="height:40px; background-color: black; width: 399px; margin-left:-20px;" ></div>

                        <div class="row mt-4" style="background-color: white; border-radius: 5px;">
                            <div class="col-9 cvv-stripe"></div>
                            <div class="col-3 " ><p  id="outccvv"  style="color: black;">***</p></div>
                        </div>
                        <div class="row mt-3 ">
                            <div class="col-9"></div>
                            <div class="col-3"><img src="../images/visa.png" alt="" height="50px" width="50px" ></div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- creditcard ends -->

            <!-- card form starts -->
            <section class="container cform"  style="box-shadow: 0px 4px 23px -7px rgba(0,0,0,0.86);border: 2px solid #01b3a7; margin-top: 100px; padding-top: 120px; border-radius: 10px; z-index:-1;" >

                <!-- first row(name) starts -->
                <div class="row">
                    <div class="col-2">
                        <label class="p-2" for="cname" style="color: #01b3a7; font-weight: 500; letter-spacing: 0.1rem;">NAME:</label>
                    </div>
                    <div class="col-10">
                        <input type="text" id="cname" name="cname"  maxlength="15" placeholder="Cardholder's Name" oninput="enterincard1(this)" autocomplete="off" required>
                    </div>
                </div>
                <!-- first row(name) ends -->

                <!-- second row(number) starts -->
                <div class="row">
                    <div class="col-2">
                        <label class="p-2" for="cnumber" style="color: #01b3a7; font-weight: 500; letter-spacing: 0.1rem;">CARD NO:</label>
                    </div>
                    <div class="col-10">
                        <input type="text" id="cnumber" name="cnumber" pattern="{16}" maxlength="19" placeholder="1111 2222 3333 4444" oninput="enterincard2(this)" autocomplete="off" required>
                        <span id="noerror" class="error-message" style="display: inline-block; height: 20px;" ></span>
                    </div>
                </div>
                <!--second row(number) ends -->


                <!-- third row(cvv,month,year) starts -->
                <div class="row thirdrow-2">
                    <!--3-1 (cvv) starts-->
                    <div class="col-4">
                        <div class="row">
                            <div class="col-6">
                                <label class="p-2" for="ccvv" style="color: #01b3a7; font-weight: 500; letter-spacing: 0.1rem;">CVV:</label>

                            </div>
                            <div class="col-6">
                                <input type="text" id="ccvv" name="ccvv" maxlength="3" placeholder="cvv" oninput="enterincard5(this)" autocomplete="off" required>  
                                <span id="cvv-error" class="error-message" style="display: inline-block; height: 20px;" ></span>
                            </div>
                        </div>
                    </div>
                    <!--3-1 (cvv) ends-->

                    <!-- 3-2(month,year) starts -->
                    <div class="col-7">
                        <div class="row">
                            <div class="col-4">
                                <label class="p-2" style="color: #01b3a7; font-weight: 500; letter-spacing: 0.1rem;">EXPIRY DATE:</label>
                            </div>
                            <div class="col-4">
                                <input type="text" id="cmonth" name="cmonth" maxlength="2" placeholder="month(01-12)" oninput="enterincard3(this)" autocomplete="off" required>  
                                <span id="month-error" class="error-message"></span>
                            </div>
                            <div class="col-4">
                                <input type="text" id="cyear" name="cyear" maxlength="2" placeholder="year" oninput="enterincard4(this)" autocomplete="off" autocomplete="off" required>  
                                <span id="year-error" class="error-message"></span>
                            </div>
                        </div>
                    </div>
                    <!-- 3-2(month,year) ends -->
                </div>
                <!--third row(cvv,month,year) ends -->



                <div class="row pb-4">
                    <div class="col-6">
                        <a href="#bookingform" class="mt-4" style="width: 100%; padding: 8px; border-radius: 5px; background-color: #01b3a7; text-decoration: none; display: block; text-align: center; color: white; letter-spacing: 1px; height: 40px;">PRIVIOUS</a>
                    </div>
                    <div class="col-6">
                        <button id="pay" class="mt-4 p-2" type="submit" value="CONFIRM PAYMENT" name="submit" style="width: 100%; padding: 8px; border-radius: 5px; background-color: #01b3a7; text-decoration: none; display: block; text-align: center; color: white; height: 40px;" >CONFIRM PAYMENT</button>
                    </div>
                    <div class="col-12">
                        <P id="abc"></P>
                    </div>

                </div>
                </form>
            </section>
        </section>
        <!-- card form ends -->
        <script>

            function validateForm()
            {
                var abc = document.getElementById('abc');
                var cyear = document.getElementById('cyear').value;
                var cmonth = document.getElementById('cmonth').value;
                var ccvv = document.getElementById('ccvv').value;
                var cvverror = document.getElementById('cvv-error');
                var noerror = document.getElementById('noerror');
                var cnumber = document.getElementById('cnumber').value.replace(/\D/g, '');
                  var dropdown = document.getElementById("pickupPoints");
                if (cyear < 24)
                {
                    return false;
                }

                if (cmonth > 12 || cmonth <= 00)
                {
                    return false;
                }

                if (ccvv.length < 3)
                {
                    cvverror.innerHTML = 'Enter valid CVV';
                    return false;
                }

                if (cnumber.length !== 16)
                {

                    return  false;
                }
               
                 if (dropdown.value === "select")
                { 
                   alert("pleae select value");
                   return false;
                }


            }

            function populateAddresses()
            {

                var pickupPoint = document.getElementById("pickupPoints").value;

                var addresses = getAddresses(pickupPoint);

                var errorMessage = document.getElementById("error-email");


                errorMessage.innerHTML = "";

                var pickupAddressesDropdown = document.getElementById("pickupAddresses");
                pickupAddressesDropdown.innerHTML = "";

                for (var i = 0; i < addresses.length; i++)
                {
                    var option = document.createElement("option");
                    option.value = addresses[i];
                    option.text = addresses[i];
                    pickupAddressesDropdown.appendChild(option);
                }
            }

            function getAddresses(pickupPoint)
            {
                switch (pickupPoint)
                {
                    case "Delhi":
                        return ["Lotus Temple", "Humayun's Tomb", "Dilli Haat,INA", "Hauz Khas"];
                    case "Mumbai":
                        return ["Shree Siddhivinayak Temple", "Nehru Science Center", "St. Michael's Church,Mahim", "Taj Santacruz"];
                    case "Chennai":
                        return ["Guindy National Park", "Accord Chrome", "Arulmigu Vadapalani Murugan Temple", "Fort St. George Museum"];
                    case "Kolkata":
                        return ["Mia by Tanishq,South City Mall", "AMRI Hospital Dhakuria", "Acropolis Mall", "Kumartuli Park"];
                    case "Ahmedabad":
                        return["ISKCON Temple", "Narendra Modi Stadium", "Shree Baaji Agora Mall", "Apolo Hospital"];
                    case "Lucknow":
                        return["Chhatar Manzil", "Maharaja Bijli Pasi Quila", "Eco Garden Lucknow", "Bada Imambara"];
                    default :
                        return [];
                }
            }

            function goback()
            {
                window.history.back();
            }

            //js for proceed to pay button(checks the dropdown validation, pass the total rpice and tourist to hidden fields, and if its valid transfer to next div)

            function redirectToInternalDiv()
            {
                var dropdown = document.getElementById("pickupPoints");
                var inputField = document.getElementById("inputField");
                var errorMessage = document.getElementById("error-email");
                var tprice = document.getElementById('totalprice').innerText;
                var tamount = document.getElementById('totaltourist').innerText;
                var emailInput = document.getElementById('bemail');
                var spanError = document.getElementById('error-email');
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                document.getElementById("totalpricehidden").value = tprice;
                document.getElementById("totaltouristhidden").value = tamount;

                errorMessage.innerHTML = "";

                if (dropdown.value === "select")
                {
                    errorMessage.innerHTML = "Please select a Pickup Point";
                } else if (!emailRegex.test(emailInput.value))
                {
                    spanError.textContent = 'Invalid email format';

                } else
                {

                    errorMessage.innerHTML = "";


                    inputField.value = dropdown.value;

                    var targetDiv = document.getElementById("creditcard");

                    if (targetDiv)
                    {
                        targetDiv.scrollIntoView({behavior: 'smooth'});
                    }

                }


                // Get today's date
                var today = new Date();

                // Get the selected date from the input field
                var selectedDate = new Date(document.getElementById("inputDate").value);

                // Calculate the difference in milliseconds
                var differenceInMilliseconds = selectedDate - today;

                // Calculate the difference in days, adding 1 if the selected date hasn't passed yet
                var differenceInDays = Math.floor(differenceInMilliseconds / (24 * 60 * 60 * 1000)) + (today.getHours() < selectedDate.getHours() ? 1 : 0);

                // Set the calculated difference in the hidden input field
                document.getElementById("dateDifference").value = (differenceInDays + 1);
                //    window.location.href="invoice.html"

            }

            //js for proceed to pay button

            function bookingtext(inputField)
            {
                inputField.value = inputField.value.replace(/[^a-zA-Z]/g, '');
            }

            function bookingnumber(inputField)
            {
                inputField.value = inputField.value.replace(/\D/g, '');
            }

            function validateEmail()
            {
                var pay = document.getElementById('pay');
                var emailInput = document.getElementById('bemail');
                var spanError = document.getElementById('error-email');
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (!emailRegex.test(emailInput.value))
                {
                    spanError.textContent = 'Invalid email format';

                } else
                {
                    spanError.textContent = null;

                }
            }




            function enterincard1(inputField) {
                inputField.value = inputField.value.replace(/[^a-zA-Z]/g, '');
                var cname = inputField.value;
                document.getElementById('outcname').innerText = cname;
            }

            function enterincard2(inputField) {

                inputField.value = inputField.value.replace(/\D/g, '');
                let cleanedInput = inputField.value.replace(/\D/g, '');
                let formattedOutput = cleanedInput.replace(/(\d{4})/g, '$1 ');
                var noerror = document.getElementById('noerror');
                var cnumber = document.getElementById('cnumber').value.replace(/\D/g, '');
                formattedOutput = formattedOutput.slice(0, 19);
                noerror.innerHTML = "";
                if (cnumber.length !== 16)
                {
                    if (cnumber.length === 0)
                    {
                        noerror.innerHTML = "";
                    } else
                    {
                        noerror.innerHTML = "*Invalid card number";
                    }


                } else
                {
                    noerror.innerHTML = "";
                }

                inputField.value = formattedOutput;
                var cnumber = inputField.value;
                document.getElementById('outcnumber').innerText = cnumber;



            }

            function enterincard3(inputField) {
                inputField.value = inputField.value.replace(/\D/g, '');
                var cmonth = inputField.value;
                var monthError = document.getElementById('month-error');
                if (isValidMonth(cmonth)) {
                    monthError.innerText = '';
                    document.getElementById('outcmonth').innerText = cmonth;
                } else {
                    monthError.innerText = 'Invalid month. Please enter a valid two-digit month (01-12).';
                }
            }

            function enterincard4(inputField) {
                inputField.value = inputField.value.replace(/\D/g, '');
                var cyear = document.getElementById('cyear').value;
                var yearError = document.getElementById('year-error');
                if (isValidYear(cyear)) {
                    if (cyear < 24) {
                        yearError.innerText = 'Invalid year. ';
                    } else
                    {
                        yearError.innerText = '';
                        document.getElementById('outcyear').innerText = cyear;
                    }
                } else
                {
                    yearError.innerText = 'Invalid year. Please enter a valid two-digit year.';
                }
            }

            function enterincard5(inputField)
            {
                inputField.value = inputField.value.replace(/\D/g, '');
                var ccvv = inputField.value;
                var cvverror = document.getElementById('cvv-error');
                cvverror.innerHTML = "";
                document.getElementById('outccvv').innerText = ccvv;
                if (ccvv.length !== 3)
                {
                    cvverror.innerHTML = "Invalid cvv";
                } else
                {
                    cvverror.innerHTML = "";
                }
            }

            function isValidMonth(month) {
                // Check if the month is a two-digit number between 01 and 12
                return /^\d{2}$/.test(month) && parseInt(month, 10) >= 1 && parseInt(month, 10) <= 12;
            }

            function isValidYear(year) {
                // Check if the year is a two-digit number (you may need to add additional validation based on your requirements)
                return /^\d{2}$/.test(year);
            }


            function validatepassanger()
            {
                var spanError = document.getElementById('error-email');
                var inputValue = document.getElementById('bpassanger').value;

                var numericValue = inputValue.replace(/[^0-9]/g, '');

                document.getElementById('bpassanger').value = numericValue;

                var number = parseInt(numericValue);

                if (!isNaN(number) && number >= 0 && number <= 10)
                {
                    spanError.textContent = '';
                } else
                {
                    if (inputValue === '')
                    {
                        spanError.textContent = '';
                    } else
                    {
                        spanError.textContent = 'you can Add 10 people max';
                    }

                }
            }

            //js for total price and tourist in booking frame

            function performMultiplication()
            {
                var ogprice = parseFloat(document.getElementById('ogprice').innerText);
                var bpassanger = parseFloat(document.getElementById('bpassanger').value);

                if (!isNaN(ogprice) && !isNaN(bpassanger))
                {
                    var totalprice = (ogprice) * (bpassanger + 1);

                    document.getElementById('totalprice').innerText = totalprice;
                    document.getElementById('totaltourist').innerText = (bpassanger + 1);
                } else
                {
                    document.getElementById('totaltourist').innerText = '1';
                    document.getElementById('totalprice').innerText = ogprice;
                }
            }

            //js for get totalprice and tourist ends

            //js for date calculation gets the season and sets min and max value for from date

            updateDateInput();

            function updateDateInput()
            {
                var selectedSeason = document.getElementById("seasonTitle").innerText.toLowerCase();

                var seasonMonths = {
                    winter: {min: "2024-11-01", max: "2025-02-28"},
                    summer: {min: "2024-03-01", max: "2024-06-30"},
                    monsoon: {min: "2024-07-01", max: "2024-10-31"},
                    full_year: {min: "2024-01-01", max: "2024-12-31"}
                };

                document.getElementById("bfromdate").max = seasonMonths[selectedSeason].max;
                document.getElementById("bfromdate").min = seasonMonths[selectedSeason].min;

                calculateEndDate();
            }

            //js for calculate end date based on from date

            function calculateEndDate()
            {
                var selectedDate = document.getElementById("bfromdate").value;
                var duration = document.getElementById("duration").innerText;
                var spanError = document.getElementById('error-email');
                spanError.textContent = "";
                if (selectedDate && duration)
                {
                    var startDate = new Date(selectedDate);

                    var today = new Date();
                    today.setHours(0, 0, 0, 0);

                    if (startDate > today)
                    {
                        var endDate = new Date(startDate);
                        endDate.setDate(startDate.getDate() + parseInt(duration, 10));

                        var formattedEndDate = endDate.getDate().toString().padStart(2, '0') + '-' + (endDate.getMonth() + 1).toString().padStart(2, '0') + '-' + endDate.getFullYear();

                        document.getElementById("bendDate").value = formattedEndDate;
                    } else
                    {
                        spanError.textContent = "please Select a Valid Date";
                        document.getElementById("bfromdate").value = "";
                        document.getElementById("bendDate").value = "";
                    }
                } else
                {
                    document.getElementById("bendDate").value = "";
                }
            }


        </script>

        <%}%>
    </body>
</html>
