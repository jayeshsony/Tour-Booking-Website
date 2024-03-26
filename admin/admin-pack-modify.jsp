<%-- 
    Document   : admin-pack-modify
    Created on : 01-Feb-2024, 3:39:43 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="newpackage.*" %>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache , no-store");
    int x=0;
    if (session == null || session.getAttribute("admin") == null) {
        x=1;
    } 
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
         <link href="../css/admin-dashboard.css" rel="stylesheet" type="text/css"/>
        <style>
            
  input,textarea,select
  {
    width: 100%;
    outline: none;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 4px 8px 15px -3px #ccc;
    height: 50px;
  }

  .paddform
  {
    margin-top: 15vh;
    margin-left: 12vw;
    margin-right: 10vh;
  }

  @media (max-width:576px)  {
     .paddform
     {
      margin-left: 100px;
      margin-right: 20px;
     }
  }

  @media (min-width:576px) and  (max-width:900px) {
     .paddform
     {
      margin-left: 100px;
      margin-right: 20px;
     }
  }

  input:focus, textarea:focus , select:focus 
  {
    border-color: #01b3a7;
  } 
   
  .paddform button
  {
    background-color: #01b3a7;
    width: 100%;
    border:1px solid #01b3a7;
    border-radius: 5px;
    color: white;
    letter-spacing: 0.3rem;
    padding: 10px !important;
    box-shadow: 4px 8px 15px -3px #ccc;
  }

  .borderr
  {
    background-color: #01b3a7;
    height: 5px;
    margin-top: 20px;
  }
 
  .save
  {
       box-shadow: 0px 7px 13px 0px rgba(0, 0, 0, 0.7);
  }
  
  </style>
    </head>
    <body>
        <%if(x==1){
        response.sendRedirect("admin-login.jsp");
            }else{
            
    int pk_id=Integer.parseInt(request.getParameter("pk_id"));
    String pk_name=null;
    String pk_type=null;
    String pk_season=null;
    String pk_location=null;
    int pk_price=0;
    String pk_description=null;
    int pk_duration=0;
    String pk_status=null;
    String pk_image=null;
    
    Connection con=connection.getconnection();
    
    try {
            String sql="select * from package where pk_id=?";
            
            PreparedStatement pts1=con.prepareStatement(sql);
            pts1.setInt(1, pk_id);
            
            ResultSet rs=pts1.executeQuery();
            
            if(rs.next())
            {
                        pk_id=rs.getInt("pk_id");
                        pk_name=rs.getString("pk_name");
                        pk_type=rs.getString("pk_type");
                        pk_season=rs.getString("pk_season");
                        pk_location=rs.getString("pk_location");
                        pk_price=rs.getInt("pk_price");
                        pk_description=rs.getString("pk_description");
                        pk_duration=rs.getInt("pk_duration");
                        pk_status=rs.getString("pk_status");
                        pk_image=rs.getString("pk_image");
                        
            }
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
        <h3> MODIFY PACKAGE</h3>
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
        <div class="row paddform" >
    <div class="col-12">
        
        <form action="../pmodifyservlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="pk_id" value="<%=pk_id%>">
            <input type="hidden" name="pk_status" value="<%=pk_status%>">
            <input type="hidden" name="pk_image" value="<%=pk_image%>"> 
           
           <div class="row my-3" >
               <div class="col-lg-8 col-md-8 col-12 mt-lg-0 mt-md-0 mt-2">
                   <input class="p-2" type="text" name="pname" placeholder="Package Name" value="<%=pk_name%>"required>
               </div>
               <div class="col-lg-4 col-md-4 col-12 mt-lg-0 mt-md-0 mt-2">
                   <input class="p-2" type="text" name="pprice" placeholder="Price" value="<%=pk_price%>"required>
               </div>
           </div>

           <div class="row my-3">
            <div class="col-lg-4 col-md-4 col-6 mt-lg-0 mt-md-0 mt-2">
                <input  class="p-2" type="text" name="ptype" placeholder="Type" list="types" value="<%=pk_type%>"required>
              <datalist id="types">
                <option>family</option>
                <option>trekk</option>
              </datalist>      

            </div>
            <div class="col-lg-4 col-md-4 col-6 mt-lg-0 mt-md-0 mt-2">
                <input class="p-2" type="text" name="pseason" placeholder="Season" list="seasons" value="<%=pk_season%>"required>
              <datalist id="seasons">
                <option>Winter</option>
                <option>Summer</option>
                <option>Monsoon</option>
                <option>All Seanson</option>
              </datalist>                
          </div>
          <div class="col-lg-4 col-md-4 col-12 mt-lg-0 mt-md-0 mt-2">
            <input class="p-2" type="number" name="pduration" placeholder="Duration" value="<%=pk_duration%>"required>
          </div>
        </div>

        <div class="row my-3">
          <div class="col-lg-4 col-md-4 col-7">
            <label class="p-2" for="pstatus" style="color: #01b3a7; font-weight: 500; letter-spacing: 0.1rem;">Select Status:</label>
          </div>
          <div class="col-lg-4 col-md-4 col-5 mt-lg-0 mt-md-0 mt-2">
            <select  class="p-2" name="pstatus" id="pstatus" required >
              <option  selected disabled> --SELECT--</option>
              <option value="Available">Available</option>
              <option value="Unavailable">Unavailable</option>
            </select>
          </div>
             <div class="col-lg-4 col-md-4 col-7">
           <input class="p-2" type="text" name="plocation" placeholder="Location" value="<%=pk_location%>"required>
          </div>
        </div>
        
        <div class="row my-3">
          <div class="col-12">
              <input class="p-2" style="overflow:visible; overflow-wrap: break-word;" placeholder="Enter Package Discription..."  name="pdescription" value="<%=pk_description%>"required>
          </div>
        </div>

        <div class="row">
              <div class="col-4" style=" overflow: hidden; object-fit: contain;">
             <img src="../<%=pk_image%>" alt="" height="200px" width="100%"/>
          </div>
          <div class="col-8 pt-5">
              
              <input type="file" id="imageUpload" name="image">
          </div>
          
        </div>
          
        <button class="mt-3 p-1 save" type="submit" value="SUBMIT" name="submit" >SAVE CHANGES</button>
     
       
       </form>
    </div>
  </div>
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
