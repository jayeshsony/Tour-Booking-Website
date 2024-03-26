<%-- 
    Document   : packDetails
    Created on : 20-Jan-2024, 3:50:46 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="newpackage.*" %>

<%
    List<PackageData> pklist=new ArrayList<>();
    
    int pk_id=Integer.parseInt(request.getParameter("pk_id"));
    
    try {
            Connection con=connection.getconnection();
            
            String sql="select * from package where pk_id=?";
            
            try {
                    PreparedStatement pts=con.prepareStatement(sql);
                    pts.setInt(1, pk_id);
                    ResultSet rs=pts.executeQuery();
                    
                    while(rs.next())
                    {
                        int pk_id1=rs.getInt("pk_id");
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <link href="../css/packDetails.css" rel="stylesheet" type="text/css"/>
    <link href="../css/footer.css" rel="stylesheet" type="text/css"/>
    <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
    <script defer src="../javascript/menu.js" type="text/javascript"></script>
    <style>
        .logo
        {
            position: fixed;
            top: 0px;
            left: 10px;
            height: 150px;
            width: 150px;
        }
        
        .price h5 , span
        {
            font-family: 'poppins';  
            font-size: 18px;
            font-weight: 600;
        }
        
        .attributes p
        {
            font-family: 'montserrat';  
            text-transform: uppercase;
            margin-left: 10px;  
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <img class="logo" src="../images/Jy_logo.png" alt=""/>
<!-- image div starts -->
<%@include file="menu.jsp" %>
<section   style="background-color: white; padding-bottom: 60px">
<%user u=(user)session.getAttribute("loguser");%>
 <%for(PackageData pkdata : pklist){%>
    <section class="container-fluid imgdiv" >
        <div class="row">
            <div class="col-12" style="padding: 0%;">
                <img src="../<%=pkdata.getpk_image()%>" alt="">
            </div>
        </div>
    </section>
<!-- image div ends -->

<!-- package discription (info,price) strats -->

    <section class="container">
        <div class="row info" >

            <!-- first column (discription)  starts--> 
            <div class="col-lg-7 col-md-7 col-12 infodesign" style="margin-top: -50px;">
                <h3 class="mt-2" style="font-family: 'elnath'; letter-spacing: 2px;"><%=pkdata.getpk_name()%></h3>
                    <hr style="color:#162e44">
                    <p><%=pkdata.getpk_description()%></p>
                </div>
            <!-- first column (discription)  ends-->

            <!-- second column (price) starts -->
                <div class="col-lg-4 col-md-4 col-12 infodesign mb-3" style="margin-top: -50px;">
                    <h3 style="font-family: 'elnath'; letter-spacing: 2px;"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg> <%=pkdata.getpk_price()%><span style="font-size: medium;     ">/person</span></h3>
                    <hr style="color:#162e44">
                    <h5 style="margin-top: -10px; font-weight: 600; ">includes</h5>
                    
                    <!-- diving second column in two parts starts -->
                    <div class="container mt-3">
                        <!-- second column first part   starts--> 
                        <div class="row mt-1 price">
                            
                              <div class="col-5 ">
                                  <h5 >
                                      <img src="../images/png/travel.png" alt="" height="40px" width="40px"/>
                                      TRAVEL
                                   </h5>
                              </div>
                            
                            
                            <div class="col-7 ">
                              <h5>
                                  <img src="../images/png/health.png" alt="" height="45px" width="35px"/>
                                  <span style="margin-left: 5px;"> FIRST-AID</span>
                               </h5>
                            </div>    
                        </div>
                         <!-- second column first part ends-->

                          <!-- second column first part   starts--> 
                        <div class="row mt-3 price">
                              <div class="col-5 ">
                                  <h5 style="margin-left: 5px;">
                                    <img src="../images/png/food.png" alt="" height="35px" width="35px"/>
                                   FOOD
                                 </h5>
                              </div>   
                            <div class="col-7">
                                <h5>
                                  <img src="../images/png/activies.png" alt="" width="40px" height="40px"/>
                                  ACTIVITIES
                                 </h5>
                            </div>
                            
                      </div>
                       <!-- second column first part ends-->
                    </div>
                    <!-- diving second column in two parts ends -->

                  <%if(u==null){%>
                  <center> <a href="login.jsp" style="display: block; text-decoration: none; text-align: center; font-family: 'raleway'; text-transform: uppercase;" class="pbutton1 mt-2" >Buy Now</a></center>
                  <%}else{%>
                  <center><a href="bookingform.jsp?pk_id=<%=pkdata.getpk_id()%>&&u_id=<%=u.getu_id()%>" class="pbutton1 mt-2" style="display: block; text-decoration: none; text-align: center;font-family: 'raleway'; text-transform: uppercase; ">Buy Now</a></center>
                  
                  <%}%>

                </div>
            <!-- second column (price) ends -->

        </div>
    </section>
<!-- package discription (info,price) ends -->

<!-- fixed bottom bar starts -->
    <section class="container-fluid" id="overlay">
        <div class="row bottom-line">
            <div class="col-lg-7 p-2">
                <h4 style="color: white; font-family: 'elnath'; letter-spacing: 2px;">FROM <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg><%=pkdata.getpk_price()%>/person</h4>
            </div>
            <div class="col-lg-3">
                <center>
                    
                  <%if(u==null){%>
                  <a href="login.jsp"  class="pbutton1" style="display: block; text-decoration: none;text-align: center; font-family: 'raleway'; text-transform: uppercase; ">Buy Now</a>
                  <%}else{%>
                  <center><a href="bookingform.jsp?pk_id=<%=pkdata.getpk_id()%>&&u_id=<%=u.getu_id()%>" class="pbutton1" style="display: block; text-decoration: none; text-align: center;">Buy Now</a></center>
                  
                  <%}%>
                </center>
                <span class="close-btn" onclick="closepopup()" style="color: white; font-size: 20px; font-weight: 900; position: absolute; top: 10px; right: 10px; cursor: pointer;">X</span>
            </div>
        </div>
    </section>
<!-- fixed bottom bar ends -->

<!-- ATTRIBUTES ROW starts -->
   <section class="container my-4  attributes">
       <!-- main row incvludes 4 columns -->
       <div class="row">
           <!-- column 1  starts-->
           <div class="col-3" style="border-right: 1px solid #01b3a7; margin-top: 3px; margin-bottom: 3px;">
              <!-- column1 divides here -->
                    <div class="row container">
                         <!-- column-1 part-1 svg starts -->
                          <div class="col-3 p-4">
                              <img src="../images/png/duration.png" alt="" height="60px" width="50px"/>
                          </div> 
                         <!-- column-1 part-1 svg ends -->

                         <!-- column-1 part-2 discription starts -->
                         <div class="col-9">
                             <div class="row">
                                 <div class="col-12 pt-3 px-3">
                                     <p style="text-align: center">duration</p>
                                 </div>
                                  <div class="col-12  px-3" style="margin-top:-10px">
                                    <p style="text-align: center"><%=pkdata.getpk_duration()%></p>
                                  </div>
                             </div>
                         </div>
                         <!-- column-1 part-2 discription ends -->
                    </div>
              <!-- column1 divides here ends-->
           </div>
           <!-- column 1  ends-->

           <!-- column 1  starts-->
           <div class="col-3" style="border-right: 1px solid #01b3a7; margin-top: 3px; margin-bottom: 3px;">
            <!-- column1 divides here -->
                  <div class="row container">
                       <!-- column-1 part-1 svg starts -->
                       <div class="col-3 p-4" >
                            <img src="../images/png/types.png" alt="" height="60px" width="50px"/>
                        </div> 
                       <!-- column-1 part-1 svg ends -->

                       <!-- column-1 part-2 discription starts -->
                       <div class="col-9">
                           <div class="row">
                               <div class="col-12 pt-3 px-3">
                                   <p style="text-align: center">Type</p>
                               </div>
                               <div class="col-12  px-3" style="margin-top:-10px">
                                   <p style="text-align: center"><%=pkdata.getpk_type()%></p>
                                </div>
                           </div>
                       </div>
                       <!-- column-1 part-2 discription ends -->
                  </div>
            <!-- column1 divides here ends-->
         </div>
         <!-- column 1  ends-->

         <!-- column 1  starts-->
         <div class="col-3" style="border-right: 1px solid #01b3a7; margin-top: 3px; margin-bottom: 3px;">
            <!-- column1 divides here -->
                  <div class="row container">
                       <!-- column-1 part-1 svg starts -->
                        <div class="col-3 p-4">
                            <img src="../images/png/season.png" alt="" height="60px" width="60px"/>
                        </div> 
                       <!-- column-1 part-1 svg ends -->

                       <!-- column-1 part-2 discription starts -->
                       <div class="col-9">
                           <div class="row">
                               <div class="col-12 pt-3 px-3">
                                  <p style="text-align: center">Season</p>
                               </div>
                               <div class="col-12  px-3" style="margin-top:-10px">
                                   <p style="text-align: center"><%=pkdata.getpk_season()%></p>
                                </div>
                           </div>
                       </div>
                       <!-- column-1 part-2 discription ends -->
                  </div>
            <!-- column1 divides here ends-->
         </div>
         <!-- column 1  ends-->

         <!-- column 1  starts-->
         <div class="col-3" style="margin-top: 3px; margin-bottom: 3px;">
            <!-- column1 divides here -->
                  <div class="row container">
                       <!-- column-1 part-1 svg starts -->
                       <div class="col-3 p-4 " style="" >
                           <img src="../images/png/status.png" alt="" height="60px" width="50px"/>
                        </div> 
                       <!-- column-1 part-1 svg ends -->

                       <!-- column-1 part-2 discription starts -->
                       <div class="col-9">
                           <div class="row">
                               <div class="col-12 pt-3 px-3">
                                   <p style="text-align: center">Status</p>
                               </div>
                              <div class="col-12 px-3" style="margin-top:-10px">
                                   <p style="text-align: center"><%=pkdata.getpk_status()%></p>
                                </div>
                           </div>
                       </div>
                       <!-- column-1 part-2 discription ends -->
                  </div>
            <!-- column1 divides here ends-->
         </div>
         <!-- column 1  ends-->

         
       </div>
   </section>
<%}%>
</section>
<!-- ATTRIBUTES ROW ends -->
<script>
    function closepopup()
    {
        document.getElementById('overlay').style.display='none';
    }
</script>

<%--<%@include file="footer.jsp" %>--%>
</body>
</html>
