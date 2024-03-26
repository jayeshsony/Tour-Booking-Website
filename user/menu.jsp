<%-- 
    Document   : menu
    Created on : 09-Jan-2024, 4:35:17 pm
    Author     : Admin
--%>
<%@page import="newpackage.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store");
%>
 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script defer src="../javascript/menu.js" type="text/javascript"></script>
        <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    </head>
    <body>
   
  <div id="blur"></div>

  <div id="sidebar" style="text-transform: uppercase;">
      <%
        user user=(user) session.getAttribute("loguser");
        if(user!=null)
        {%>
        <center><h4>WELCOME!</h4>
        <h4 class="pb-2"> <%=user.getf_name()%></h4></center>
        <%}%>
      <%
        if(user==null)
        {%>
        <a href="login.jsp">LOGIN</a>
      <%}%>
      <a href="../index.jsp">Home</a>
      <a href="package.jsp">Our Tour</a>
     
      <a href="aboutUs.jsp">About Us</a>
     
      <a href="gallery.jsp">Gallery</a>
    <%
        
        if(user!=null)
        {%>
        <a href="userprofile.jsp">My Profile</a>
        <a href="favourite.jsp">Favorite</a>
        <a href="../logoutServlet">Log Out</a>
       
        <%}%>
    
  </div>

  <div class="trigger" onclick="toggleSidebar()">
    <svg class="bars" viewBox="0 0 100 100" onclick="this.classList.toggle('active')">
      <path class="line top"
        d="m 30,33 h 40 c 13.100415,0 14.380204,31.80258 6.899646,33.421777 -24.612039,5.327373 9.016154,-52.337577 -12.75751,-30.563913 l -28.284272,28.284272">
      </path>
      <path class="line middle"
        d="m 70,50 c 0,0 -32.213436,0 -40,0 -7.786564,0 -6.428571,-4.640244 -6.428571,-8.571429 0,-5.895471 6.073743,-11.783399 12.286435,-5.570707 6.212692,6.212692 28.284272,28.284272 28.284272,28.284272">
      </path>
      <path class="line bottom"
        d="m 69.575405,67.073826 h -40 c -13.100415,0 -14.380204,-31.80258 -6.899646,-33.421777 24.612039,-5.327373 -9.016154,52.337577 12.75751,30.563913 l 28.284272,-28.284272">
      </path>
    </svg>
  </div>
  <!-- sidemenu ends -->
    </body>
</html>
