<%-- 
    Document   : favourite
    Created on : 18-Jan-2024, 3:44:08 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="newpackage.*" %>
<%@page import="javax.servlet.http.HttpSession" %>


    

<%
    response.setHeader("Cache-Control", "no-cache , no-store");
    int x=0;
    int check=0;
    if (session == null || session.getAttribute("loguser") == null) {
        x=1;
    } 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script defer src="../javascript/menu.js" type="text/javascript"></script>
        <link href="../css/footer.css" rel="stylesheet" type="text/css"/>
        <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
        <style>
            
             .header
            {
               
                background: linear-gradient(#01b3a7,white);
                height: 150px;
                letter-spacing: 2px;
                font-family: gadems;

            }
        </style>
    </head>
    <body>
        <%if(x==1){
            response.sendRedirect("login.jsp");
        }
        else
        {
                List<PackageData> favlist=new ArrayList<>();
                
                user u=(user)session.getAttribute("loguser");
    
                try {
                    Connection con=connection.getconnection();
            
                    String sql="select * from package where pk_id in(select pk_id from fav where u_id=?)";
            
                    try {
                    PreparedStatement pts=con.prepareStatement(sql);
                    pts.setInt(1,u.getu_id());
                    
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
                        
                        PackageData favdata=new PackageData(pk_id,pk_name,pk_type,pk_season,pk_location,pk_price,pk_description,pk_duration,pk_status,pk_image);
                        
                        favlist.add(favdata);
                        check=1;
                    }
                } catch (Exception e) {
                }
        } catch (Exception e) {
        }
%>       

<div class="container-fluid header">
            <div class="row ">
                <div class="col-3 px-4" style="">
                    <img style="" src="../images/Jy_logo.png" alt="" height="150px" width="200px">
                </div>
                <div class="col-6 pt-5 " style="margin-left: 170px; ">
                    <h1 style="font-family: 'gadems';">FAVOURITES</h1>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
<%@include file="menu.jsp" %>

            <%if(check==1){%>
        
        <div class="container-fluid"style="background-color: white;">
            
        <%for(PackageData favdata : favlist){%>
    <div class="product my-5" data-aos="fade-left" data-aos-duration="800">
      <div class="row no-gutters">
        <div class="pimage border-2  col-md-6 col-12" data-aos="fade-right">
          <img class="" src="../<%=favdata.getpk_image()%>" alt="" height="100%" width="100%">
        </div>
        <div class="col col-lg-6 col-md-6 col-12">
          <div class="pcontent">

            <div class="co2  mt-5" data-aos="fade-left">
              <h2 style="font-family: 'elnath'; letter-spacing: 2px; "><%=favdata.getpk_name()%></h2>
              <p class="my-4" style="font-size: 16px; font-family: 'raleway'; letter-spacing: 1.5px; font-weight: 500;"><%=favdata.getpk_description()%></p>
              <div class="py-3">
                  
                  <a href="packDetails.jsp?pk_id=<%=favdata.getpk_id()%>" class="pbutton2">Explore More</a>
                  
                  <a href="../remove?pk_id=<%=favdata.getpk_id()%>&&u_id=<%=u.getu_id()%>" class="pbutton2">Remove Favourite</a>
                  
                
             
              </div>
            </div>
            <div class="pprice">
              <center>
                <p style="font-family: 'elnath'; letter-spacing: 2px; " ><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg><%=favdata.getpk_price()%></p>
              </center>
            </div>
          </div>
        </div>
      </div>
    </div>
  
  <%
      }
    }else{   
  %>
   <div class="container-fluid"style="background-color: white;">
      <div class="row">
          <div class="col-6">
              <svg style="height: 400px;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 148.47 132.6"><defs><style>.cls-1{fill:#1abbbc;}.cls-2{fill:#f1f1f1;}.cls-3{fill:#00bfbf;}.cls-4{fill:#1a506a;}.cls-5{fill:#fff;}</style></defs><title>empty-wishlist</title><g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><path class="cls-1" d="M98.16,40l-53,11.87a4.27,4.27,0,0,0-3.24,5.1L57.45,126.5a4.27,4.27,0,0,0,5.1,3.24l53-11.87a4.28,4.28,0,0,0,3.24-5.1L103.26,43.21A4.27,4.27,0,0,0,98.16,40ZM117.64,113a3.07,3.07,0,0,1-2.32,3.65l-53,11.87a3.06,3.06,0,0,1-3.65-2.31L43.07,56.68A3.06,3.06,0,0,1,45.38,53l53-11.87a3.06,3.06,0,0,1,3.65,2.31Z"/><path class="cls-1" d="M81.62,49a.62.62,0,0,0-.73-.47l-5.36,1.2A3,3,0,0,0,69.75,51l-5.36,1.2a.6.6,0,0,0-.46.73L64.39,55,50,58.25l14,62.74,46.43-10.39-14-62.74L82.08,51.07ZM65.25,53.29l5.3-1.19a.6.6,0,0,0,.46-.73,1.8,1.8,0,0,1,3.52-.79.62.62,0,0,0,.73.47l5.3-1.19,1.19,5.33L66.44,58.61Zm30.27-4L109,109.67l-44,9.86L51.48,59.17l13.18-2.94.72,3.24a.62.62,0,0,0,.73.47l16.5-3.69a.63.63,0,0,0,.47-.73l-.73-3.25Z"/><path class="cls-1" d="M73.64,54.85a1.23,1.23,0,1,0-1.46-.93A1.23,1.23,0,0,0,73.64,54.85Z"/><path class="cls-2" d="M122.58,129.87h-2.07a1.31,1.31,0,0,0,0,2.61h2.07a1.31,1.31,0,1,0,0-2.61Z"/><path class="cls-2" d="M114.86,129.88h-4.1a1.31,1.31,0,1,0,0,2.61h4.1a1.31,1.31,0,0,0,0-2.61Z"/><path class="cls-2" d="M105.35,129.9,49.54,130a1.31,1.31,0,0,0,0,2.61l55.81-.09a1.31,1.31,0,1,0,0-2.61Z"/><path class="cls-2" d="M41.72,129.93H35.11a1.31,1.31,0,0,0,0,2.61h6.61a1.31,1.31,0,0,0,0-2.61Z"/><path class="cls-3" d="M125.71,78a2.45,2.45,0,0,0-3,1.77.37.37,0,0,0,.26.45.36.36,0,0,0,.44-.27,1.75,1.75,0,0,1,.79-1,1.7,1.7,0,0,1,1.3-.19,1.72,1.72,0,1,1-1.67,2.85.36.36,0,1,0-.53.49,2.5,2.5,0,0,0,1.18.7,2.45,2.45,0,0,0,1.2-4.75Z"/><path class="cls-3" d="M143.3,76.32a.35.35,0,0,0,.25.1.37.37,0,0,0,.26-.1.36.36,0,0,0,0-.51l-1.1-1.1a.36.36,0,1,0-.51.51Z"/><path class="cls-3" d="M143.42,77.31a.36.36,0,0,0-.36-.36h-1.55a.36.36,0,1,0,0,.71h1.55A.36.36,0,0,0,143.42,77.31Z"/><path class="cls-3" d="M143.85,78.28a.36.36,0,0,0-.51,0l-1.1,1.1a.35.35,0,0,0,0,.5.36.36,0,0,0,.26.11.36.36,0,0,0,.25-.11l1.1-1.09A.36.36,0,0,0,143.85,78.28Z"/><path class="cls-3" d="M144.84,78.66a.36.36,0,0,0-.36.36v1.56a.36.36,0,0,0,.72,0V79A.36.36,0,0,0,144.84,78.66Z"/><path class="cls-3" d="M145.81,78.23a.36.36,0,0,0,0,.51l1.1,1.1a.36.36,0,0,0,.25.11.37.37,0,0,0,.26-.62l-1.1-1.1A.36.36,0,0,0,145.81,78.23Z"/><path class="cls-3" d="M146.2,77.24a.36.36,0,0,0,.35.36h1.56a.36.36,0,1,0,0-.71h-1.56A.35.35,0,0,0,146.2,77.24Z"/><path class="cls-3" d="M146,76.38a.38.38,0,0,0,.26-.11l1.09-1.1a.35.35,0,0,0-.5-.5l-1.1,1.09a.36.36,0,0,0,0,.51A.36.36,0,0,0,146,76.38Z"/><path class="cls-3" d="M144.78,75.89a.36.36,0,0,0,.36-.36V74a.36.36,0,0,0-.72,0v1.56A.36.36,0,0,0,144.78,75.89Z"/><path class="cls-3" d="M140.15,93.05a.56.56,0,0,0-.78,0l-1.68,1.68a.54.54,0,0,0,0,.78.55.55,0,0,0,.77,0l1.69-1.68A.56.56,0,0,0,140.15,93.05Z"/><path class="cls-3" d="M136.26,96.93a.55.55,0,0,0-.77,0l-1.68,1.69a.54.54,0,1,0,.77.77l1.68-1.68A.54.54,0,0,0,136.26,96.93Z"/><path class="cls-3" d="M140.15,98.62l-1.69-1.69a.55.55,0,0,0-.77,0,.54.54,0,0,0,0,.78l1.68,1.68a.54.54,0,0,0,.78,0A.55.55,0,0,0,140.15,98.62Z"/><path class="cls-3" d="M136.26,94.73l-1.68-1.68a.55.55,0,0,0-.77,0,.54.54,0,0,0,0,.78l1.68,1.68a.55.55,0,0,0,.77,0A.54.54,0,0,0,136.26,94.73Z"/><path class="cls-3" d="M3.69,67,2.61,68a.35.35,0,0,0,0,.5.34.34,0,0,0,.25.11.36.36,0,0,0,.25-.11l1.08-1.08a.35.35,0,1,0-.5-.5Z"/><path class="cls-3" d="M1.19,69.46.1,70.55a.37.37,0,0,0,0,.5.35.35,0,0,0,.25.1.35.35,0,0,0,.25-.1L1.69,70a.35.35,0,0,0-.5-.5Z"/><path class="cls-3" d="M3.11,69.46a.35.35,0,0,0-.5.5l1.08,1.09a.35.35,0,1,0,.5-.5Z"/><path class="cls-3" d="M.6,67a.35.35,0,0,0-.5,0,.37.37,0,0,0,0,.5l1.09,1.08a.36.36,0,0,0,.25.11.36.36,0,0,0,.25-.11.35.35,0,0,0,0-.5Z"/><path class="cls-3" d="M21.52,72.72a1.66,1.66,0,1,0,1.66,1.66A1.65,1.65,0,0,0,21.52,72.72Zm0,2.82a1.17,1.17,0,1,1,1.17-1.16A1.16,1.16,0,0,1,21.52,75.54Z"/><path class="cls-3" d="M136,116.22a1.66,1.66,0,1,0,1.66,1.65A1.65,1.65,0,0,0,136,116.22Zm0,2.82a1.17,1.17,0,1,1,1.17-1.17A1.16,1.16,0,0,1,136,119Z"/><path class="cls-3" d="M15.05,54.78a1.66,1.66,0,1,0,1.65,1.65A1.66,1.66,0,0,0,15.05,54.78Zm0,2.82a1.17,1.17,0,1,1,1.16-1.17A1.17,1.17,0,0,1,15.05,57.6Z"/><path class="cls-3" d="M27.42,91.28,25.63,89.5l1.79-1.79a.41.41,0,1,0-.58-.58l-1.79,1.79-1.78-1.79a.41.41,0,1,0-.58.58l1.78,1.79-1.78,1.78a.41.41,0,0,0,.58.58l1.78-1.79,1.79,1.79a.41.41,0,0,0,.58-.58Z"/><path class="cls-3" d="M34.89,64H32.47V61.63a.39.39,0,1,0-.78,0V64H29.27a.4.4,0,0,0,0,.79h2.42v2.41a.39.39,0,1,0,.78,0V64.83h2.42a.4.4,0,0,0,0-.79Z"/><path class="cls-2" d="M131,20.61a3.09,3.09,0,0,0-1.77.5,7.18,7.18,0,0,0-13.07-.74,5.72,5.72,0,0,0-9.69.54,3.91,3.91,0,0,0-5.55-.05,4,4,0,0,0-1.21,2.88,2.59,2.59,0,0,1-2.59,2.59h-.85a.94.94,0,0,0,0,1.87h.85a4.47,4.47,0,0,0,4.46-4.46,2.15,2.15,0,0,1,.65-1.55,2,2,0,0,1,1.47-.6,2.1,2.1,0,0,1,2,2.09.94.94,0,0,0,1.87,0,3.87,3.87,0,1,1,7.73,0,.94.94,0,0,0,1.87,0,5.32,5.32,0,1,1,10.63,0,.93.93,0,1,0,1.86,0,1.19,1.19,0,0,1,.37-.87,1.21,1.21,0,0,1,.87-.34,1.24,1.24,0,0,1,1.17,1.25v1.41a1.2,1.2,0,0,1-1.2,1.2h-.39a.94.94,0,0,0,0,1.87h.39A3.08,3.08,0,0,0,134,25.13V23.72A3.11,3.11,0,0,0,131,20.61Z"/><path class="cls-2" d="M88,26.33a1,1,0,1,0,.66.28A.9.9,0,0,0,88,26.33Z"/><path class="cls-2" d="M92.85,26.33H91.2a.94.94,0,1,0,0,1.87h1.65a.94.94,0,0,0,0-1.87Z"/><path class="cls-2" d="M126.87,26.33h-2a.94.94,0,1,0,0,1.87h2a.94.94,0,0,0,0-1.87Z"/><path class="cls-2" d="M87.85,0a7.59,7.59,0,0,0-5.48,2.21,7.73,7.73,0,0,0-1.53,2.13,5.49,5.49,0,0,0-8.29-.65,5.73,5.73,0,0,0-1.71,4.06,3.52,3.52,0,0,1-3.51,3.52h-.64a.94.94,0,0,0,0,1.87h.64a5.4,5.4,0,0,0,5.38-5.4A3.85,3.85,0,0,1,73.86,5,3.6,3.6,0,0,1,76.47,4a3.71,3.71,0,0,1,3.62,3.69.94.94,0,1,0,1.87,0,5.79,5.79,0,0,1,5.86-5.79,5.88,5.88,0,0,1,5.72,5.89A3.53,3.53,0,0,1,90,11.27h-.38a.94.94,0,0,0,0,1.87H90A5.4,5.4,0,0,0,95.4,7.75,7.73,7.73,0,0,0,87.85,0Z"/><path class="cls-2" d="M86.74,11.27H85.19a.94.94,0,0,0,0,1.87h1.55a.94.94,0,0,0,0-1.87Z"/><path class="cls-2" d="M63.17,11.27H59.36a.94.94,0,0,0,0,1.87h3.81a.94.94,0,0,0,0-1.87Z"/><path class="cls-2" d="M55.69,11.27a.94.94,0,0,0-.93.93.94.94,0,0,0,.27.66.92.92,0,0,0,.66.28.91.91,0,0,0,.66-.28.93.93,0,0,0,0-1.31A.91.91,0,0,0,55.69,11.27Z"/><path class="cls-2" d="M70.14,28.78a3.48,3.48,0,0,0-2.31.76,8.74,8.74,0,0,0-16.2-.83,6.92,6.92,0,0,0-12.09.6,4.73,4.73,0,0,0-3.47-1.64A4.63,4.63,0,0,0,32.72,29a4.83,4.83,0,0,0-1.45,3.43,3.48,3.48,0,0,1-3.48,3.48H26.73a.93.93,0,0,0,0,1.86h1.06a5.34,5.34,0,0,0,5.34-5.34,3,3,0,0,1,.89-2.1,2.8,2.8,0,0,1,2-.82,2.86,2.86,0,0,1,2.79,2.85.93.93,0,0,0,1.86,0,5.07,5.07,0,1,1,10.14,0,.94.94,0,0,0,1.87,0,6.88,6.88,0,1,1,13.75,0,.93.93,0,0,0,1.86,0,1.72,1.72,0,0,1,.53-1.25,1.7,1.7,0,0,1,1.26-.49,1.78,1.78,0,0,1,1.69,1.79v1.76A1.74,1.74,0,0,1,70,35.93h-.48a.93.93,0,1,0,0,1.86H70a3.61,3.61,0,0,0,3.61-3.6V32.43A3.66,3.66,0,0,0,70.14,28.78Z"/><path class="cls-2" d="M17.22,35.93h-.87a.93.93,0,0,0,0,1.86h.87a.93.93,0,0,0,0-1.86Z"/><path class="cls-2" d="M23.56,35.93H20.37a.93.93,0,1,0,0,1.86h3.19a.93.93,0,0,0,0-1.86Z"/><path class="cls-2" d="M67,35.93H64.52a.93.93,0,0,0,0,1.86H67a.93.93,0,1,0,0-1.86Z"/><path class="cls-2" d="M139.14,46.46h-.39a.94.94,0,0,0,0,1.87h.39a.94.94,0,0,0,0-1.87Z"/><path class="cls-2" d="M144,41.83a3.68,3.68,0,0,0-5.13-.08,6.16,6.16,0,0,0-10.93-.16l-.16-.18a4.29,4.29,0,0,0-3.11-1.24,4.37,4.37,0,0,0-4.25,4.39v1.8a.1.1,0,0,1-.11.1h-1.12a.94.94,0,0,0,0,1.87h1.12a2,2,0,0,0,2-2v-1.8A2.52,2.52,0,0,1,124.7,42a2.48,2.48,0,0,1,2.51,2.47.93.93,0,0,0,1.86,0,4.29,4.29,0,1,1,8.58,0,.94.94,0,0,0,1.87,0,1.89,1.89,0,0,1,1.84-1.88,1.81,1.81,0,0,1,1.33.54,1.93,1.93,0,0,1,.59,1.4v1.23a.67.67,0,0,1-.67.67.94.94,0,0,0,0,1.87,2.54,2.54,0,0,0,2.54-2.54V44.56A3.84,3.84,0,0,0,144,41.83Z"/><path class="cls-2" d="M116,46.46h-1.46a.94.94,0,0,0,0,1.87H116a.94.94,0,0,0,0-1.87Z"/><path class="cls-2" d="M110.78,46.46a1,1,0,0,0-.93.94.93.93,0,0,0,1.59.66.93.93,0,0,0,.27-.66.9.9,0,0,0-.27-.66A.91.91,0,0,0,110.78,46.46Z"/><path class="cls-4" d="M116.48,124.69a2.08,2.08,0,0,1-1.46-.61l-11.81-12a9.16,9.16,0,0,1,0-12.81,8.9,8.9,0,0,1,12.71,0c.19.2.38.41.56.64.19-.23.38-.44.57-.64a8.9,8.9,0,0,1,12.71,0,9.16,9.16,0,0,1,0,12.81l-11.82,12A2,2,0,0,1,116.48,124.69Z"/><path class="cls-5" d="M123.4,98.12a7.38,7.38,0,0,1,5.29,2.22,7.65,7.65,0,0,1,0,10.7l-11.81,12a.57.57,0,0,1-.79,0l-11.81-12a7.65,7.65,0,0,1,0-10.7,7.4,7.4,0,0,1,10.57,0,9.32,9.32,0,0,1,1.63,2.41,9.38,9.38,0,0,1,1.64-2.41,7.38,7.38,0,0,1,5.28-2.22m0-3a10.34,10.34,0,0,0-6.92,2.64,10.39,10.39,0,0,0-14.34.48,10.67,10.67,0,0,0,0,14.91l11.82,12a3.53,3.53,0,0,0,2.52,1.06,3.56,3.56,0,0,0,2.53-1l11.81-12a10.65,10.65,0,0,0,0-14.91,10.32,10.32,0,0,0-7.42-3.12Z"/></g></g></svg>
          </div>
          <div class="col-6  " style="display: flex; align-items: center">
              <h1 style="color:#01b3a7; font-size: 40px; font-weight: 500; text-align: center; font-family: 'elnath'">....NO RECORD IN YOUR WISH LIST...</h1>
          </div>
      </div>
  </div>
  <%}
}%>
  </div>
   <section style="margin-bottom: 330px;"></section>
   <%@include file="footer.jsp" %>
    </body>
</html>
