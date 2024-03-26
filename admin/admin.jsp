<%-- 
    Document   : admin
    Created on : 03-Jan-2024, 2:20:07 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="newpackage.*" %>
<%
    response.setHeader("Cache-Control", "no-cache , no-store");
    int x = 0;
    if (session == null || session.getAttribute("admin") == null) {
        x = 1;
    }
%>

<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="admin.css">

        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="../css/admin-dashboard.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%if (x == 1) {
                response.sendRedirect("admin-login.jsp");
            } else {

                int registeredUser = 0;
                int totalPack = 0;
                int availPack = 0;
                int unavailPack = 0;
                int tbookings=0;
                try {
                    Connection con = connection.getconnection();

                    String ucount = "select count(*) from user_info";
                    PreparedStatement pts1 = con.prepareStatement(ucount);
                    ResultSet rs1 = pts1.executeQuery(ucount);
                    rs1.next();
                    registeredUser = rs1.getInt(1);

                    String pcount = "select count(*) from package";
                    PreparedStatement pts2 = con.prepareStatement(pcount);
                    ResultSet rs2 = pts2.executeQuery(pcount);
                    rs2.next();
                    totalPack = rs2.getInt(1);

                    String availPackcount = "select count(*) from package where pk_status='available'";
                    PreparedStatement pts3 = con.prepareStatement(availPackcount);
                    ResultSet rs3 = pts3.executeQuery(availPackcount);
                    rs3.next();
                    availPack = rs3.getInt(1);

                    String unavailPackcount = "select count(*) from package where pk_status='unavailable'";
                    PreparedStatement pts4 = con.prepareStatement(unavailPackcount);
                    ResultSet rs4 = pts4.executeQuery(unavailPackcount);
                    rs4.next();
                    unavailPack = rs4.getInt(1);
                    
                    String totalbookings = "select count(*) from booking";
                    PreparedStatement pts5 = con.prepareStatement(totalbookings);
                    ResultSet rs5 = pts5.executeQuery(totalbookings);
                    rs5.next();
                    tbookings = rs5.getInt(1);
                } catch (Exception e) {
                }

        %>
        <div class="sidebar">
            <ul class="nav-list">
                <li class="menu-item " id="menu1">
                    <hr style=" margin-top: -5px; " class="hrr">
                    <a href="admin.jsp" class="mt-5">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-grid" viewBox="0 0 16 16">
                        <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/>
                        </svg>
                    </a>
                    <span class="tooltip mt-4">DASHBOARD</span>
                </li>
                <li class="menu-item" id="menu2">
                    <a href="admin-regUser.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                        <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                        </svg>
                    </a>
                    <span class="tooltip">REGISTERED USER</span>
                </li>
                <li class="menu-item" id="menu3">
                    <a href="admin-package.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2" viewBox="0 0 16 16">
                        <path d="M4.04 7.43a4 4 0 0 1 7.92 0 .5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14"/>
                        <path fill-rule="evenodd" d="M4 9.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm1 .5v3h6v-3h-1v.5a.5.5 0 0 1-1 0V10z"/>
                        <path d="M6 2.341V2a2 2 0 1 1 4 0v.341c2.33.824 4 3.047 4 5.659v1.191l1.17.585a1.5 1.5 0 0 1 .83 1.342V13.5a1.5 1.5 0 0 1-1.5 1.5h-1c-.456.607-1.182 1-2 1h-7a2.5 2.5 0 0 1-2-1h-1A1.5 1.5 0 0 1 0 13.5v-2.382a1.5 1.5 0 0 1 .83-1.342L2 9.191V8a6 6 0 0 1 4-5.659M7 2v.083a6 6 0 0 1 2 0V2a1 1 0 0 0-2 0M3 13.5A1.5 1.5 0 0 0 4.5 15h7a1.5 1.5 0 0 0 1.5-1.5V8A5 5 0 0 0 3 8zm-1-3.19-.724.362a.5.5 0 0 0-.276.447V13.5a.5.5 0 0 0 .5.5H2zm12 0V14h.5a.5.5 0 0 0 .5-.5v-2.382a.5.5 0 0 0-.276-.447L14 10.309Z"/>
                        </svg>
                    </a>
                    <span class="tooltip">PACKAGES</span>
                </li>

                <li class="menu-item" id="menu3">
                    <a href="admin-addpackage.jsp">

                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                        </svg>
                    </a>
                    <span class="tooltip">ADD PACKAGE</span>
                </li>
                <li class="menu-item" id="menu4">
                    <a href="admin-bookings.jsp" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                        <path d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425z"/>
                        </svg>

                    </a>
                    <span class="tooltip">PURCHASED TOURS</span>
                </li>

            </ul>
        </div>


        <section class="header">
            <div class="row">
                <div class="col-2">
                    <img src="../images/Jy_logo.png" alt="" width="100%">
                </div>
                <div class="col-8">
                    <h3> ADMIN DASHBOARD</h3>
                </div>
                <div class="col-2">
                    <a href="../adminlogoutServlet"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="white" class="bi bi-box-arrow-in-right"
                                                         viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z" />
                        <path fill-rule="evenodd"
                              d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                        </svg></a>
                </div>
            </div>
        </section>

        <section class="container-fluid main ">

            <div class="row hero">
                <!-- first column (visitors,registerd users,total packages)  strats-->
                <div class="col-lg-5 col-md-8 col-9 hero-1">
                    <div class="row">
                        <div class="col-12" style="height: 40vh;">
                            <center>
                                <H3 style="font-size: 26px;">USER INFORMATION</H3>
                            </center>
                            <div class="row  mt-5 container">
                                <center>


                                    <!-- first colummn part-2  starts -->
                                    <div class="col-11 hero-1-1">
                                        <div class="row pt-3">
                                            <!-- first column  part-2-1 svg starts -->
                                            <div class="col-3 m-1" style="mix-blend-mode:multiply;">
                                                <img src="../gifs/user.gif" alt="" width="120%" height="120%"> 
                                            </div>
                                            <!-- first column  part-2-1 svg ends -->

                                            <!-- first column  part-2-2 info starts -->
                                            <div class="col-8">
                                                <h2 class="mt-2"><%=registeredUser%></h2>
                                                <h5>Registerd Users</h5>
                                            </div>
                                            <!-- first column  part-2-2 info ends-->
                                        </div>
                                    </div>
                                    <!-- first colummn part-2  ends -->


                                </center>
                            </div>
                        </div>
                        <div class="col-12" style="height: 40vh;">
                            <center>
                                <H3 style="font-size: 26px;">TOTAL BOOKINGS</H3>
                            </center>
                            <div class="row  mt-5 container">
                                <center>


                                    <!-- first colummn part-2  starts -->
                                    <div class="col-11 hero-1-1">
                                        <div class="row pt-3">
                                            <!-- first column  part-2-1 svg starts -->
                                            <div class="col-3 m-1" style="mix-blend-mode:multiply;">
                                                <img src="../gifs/user.gif" alt="" width="120%" height="120%"> 
                                            </div>
                                            <!-- first column  part-2-1 svg ends -->

                                            <!-- first column  part-2-2 info starts -->
                                            <div class="col-8">
                                                <h2 class="mt-2"><%=tbookings   %></h2>
                                                <h5>NO.OF BOOKINGS</h5>
                                            </div>
                                            <!-- first column  part-2-2 info ends-->
                                        </div>
                                    </div>
                                    <!-- first colummn part-2  ends -->


                                </center>
                            </div>
                        </div>
                    </div>



                    <!-- first column ends -->
                </div>
                <!-- first column ends -->

                <!-- second column (package info)starts -->
                <div class="col-lg-5 col-md-8 col-9 hero-1">
                    <center>
                        <H3 style="font-size: 26px;">PACKAGE INFORMATION</H3>
                    </center>

                    <div class="row mt-5 container">
                        <center>
                            <!-- second colummn part-1  starts -->
                            <div class="col-11 hero-1-1">
                                <div class="row pt-3">
                                    <!-- second column  part-1-1 svg starts -->
                                    <div class="col-3 m-1" style="mix-blend-mode:multiply;">
                                        <img src="../gifs/way.gif" alt="" width="120%" height="120%"> 
                                    </div>
                                    <!-- second column  part-1-1 svg ends -->

                                    <!-- second column  part-1-2 info starts -->
                                    <div class="col-8">
                                        <h2 class="mt-2"><%=totalPack%></h2>
                                        <h5>Total Packages</h5>
                                    </div>
                                    <!-- second column  part-1-2 info ends-->
                                </div>
                            </div>
                            <!-- second colummn part-1  ends -->

                            <!-- second colummn part-2  starts -->
                            <div class="col-11 hero-1-1">
                                <div class="row pt-3">
                                    <!-- second column  part-2-1 svg starts -->
                                    <div class="col-3 m-1" style="mix-blend-mode:multiply;">
                                        <img src="../gifs/destination.gif" alt="" width="120%" height="120%"> 
                                    </div>
                                    <!-- second column  part-2-1 svg ends -->

                                    <!-- second column  part-2-2 info starts -->
                                    <div class="col-8">
                                        <h2 ><%=availPack%></h2>
                                        <h5>Available Packages</h5>
                                    </div>
                                    <!-- second column  part-2-2 info ends-->
                                </div>
                            </div>
                            <!-- second colummn part-2  ends -->

                            <!-- second colummn part-3 starts -->
                            <div class="col-11 hero-1-1">
                                <div class="row pt-3">
                                    <!-- second column  part-3-1 svg starts -->
                                    <div class="col-3 m-1" style="mix-blend-mode:multiply;">
                                        <img src="../gifs/route.gif" alt="" width="120%" height="120%"> 
                                    </div>
                                    <!-- second column  part-3-1 svg ends -->

                                    <!-- second column  part-3-2 info starts -->
                                    <div class="col-8">
                                        <h2 class=""><%=unavailPack%></h2>
                                        <h5>Unavailable Packages</h5>
                                    </div>
                                    <!-- second column  part-3-2 info ends-->
                                </div>
                            </div>
                            <!-- second colummn part-3  ends -->

                        </center>
                    </div>
                    <!-- second column ends -->
                </div>
        </section>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Get the title of the page
                var pageTitle = document.title.toLowerCase(); // Convert to lowercase

                // Get all menu items
                var menuItems = document.querySelectorAll('.menu-item');

                // Loop through menu items and add 'active' class to the <i> tag within the item with the same Font Awesome icon as the title
                menuItems.forEach(function (menuItem) {
                    var menuIcon = menuItem.querySelector('svg');
                    var menuspan = menuItem.querySelector('span');

                    // Compare the text content of menuspan with the lowercased page title
                    if (menuspan.textContent.toLowerCase() === pageTitle) {
                        menuIcon.classList.add('active');
                    }
                });
            });

        </script>
        <%}%>
    </body>
</html>