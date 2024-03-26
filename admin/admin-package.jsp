


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
        <title>REGISTEREDUSER</title>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script  defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="../css/admin-dashboard.css" rel="stylesheet" type="text/css"/>
        <style>
  input,textarea,select
  {
    width: 100%;
    outline: none;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 4px 8px 15px -3px #ccc;
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
 

    table {
         width: 90%;
         border-collapse: collapse;
         margin-top: 20px;
         border-radius: 10px;
         margin-top: 100px;
         margin-left: 110px;

     }

     th, td  {
         padding: 12px;
         text-align: left;
         border-bottom: 1px solid #01b3a7;
         white-space: nowrap;
         width: 100px !important;
         overflow: hidden;
       
     }

     th {
         background-color: #01b3a7;
     }

     tr:hover {
         background-color:grey;
     }

      #resizable-table
     {
border-radius: 10px;
     }
     
        .modal-content
        {
            background-color: #bffffb;
            height: 300px;
            border-radius: 10px;
            box-shadow: 0px 4px 20px -5px rgba(0,0,0,0.86);
            width: 400px;
            margin: auto;
           
        }
        .delete , .delete:hover
        {
            display: inline-block;background-color: red;color: white;
            padding: 5.5px;
            text-decoration: none;
            letter-spacing: 1px;
            border-radius: 6px;
            font-weight: 400;
        }
        
        .dynamic
        {
            padding: 10px 0px;
            font-weight: 500;
            border-bottom: 1px solid #01b3a7;
           
        }
        

        
          .dynamic  a
        {
            text-decoration: none;
            color: #01b3a7;
        }
        
        .dynamic:hover
        {
            background-color: rgb(213, 232, 248);
        }
         
      
    ::-webkit-scrollbar {
    width: 10px;
    background-color: #162e44;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient( #162e44,#01b3a7);


}

        
  </style>
    </head>
    <body>
        <%if(x==1){
        response.sendRedirect("admin-login.jsp");
            }else{
        
    List<PackageData> pklist=new ArrayList<>();
    
    try {
            Connection con=connection.getconnection();
            
            String sql="select * from package";
            
            try {
                    PreparedStatement pts=con.prepareStatement(sql);
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
                        
                        PackageData pkdata=new PackageData(pk_id,pk_name,pk_type,pk_season,pk_location,pk_price,pk_description,pk_duration,pk_status,pk_image);
                        
                        pklist.add(pkdata);
                    }
                } catch (Exception e) {
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
        <span class="tooltip">DASHBOARD</span>
      </li>
      <li class="menu-item" id="menu2">
          <a href="admin-regUser.jsp">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
            <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
          </svg>
        </a>
        <span class="tooltip" >REGISTERED USER</span>
      </li>
      <li class="menu-item" id="menu3">
          <a href="admin-package.jsp" style="background-color: #01b3a7">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2" viewBox="0 0 16 16">
  <path d="M4.04 7.43a4 4 0 0 1 7.92 0 .5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14"/>
  <path fill-rule="evenodd" d="M4 9.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm1 .5v3h6v-3h-1v.5a.5.5 0 0 1-1 0V10z"/>
  <path d="M6 2.341V2a2 2 0 1 1 4 0v.341c2.33.824 4 3.047 4 5.659v1.191l1.17.585a1.5 1.5 0 0 1 .83 1.342V13.5a1.5 1.5 0 0 1-1.5 1.5h-1c-.456.607-1.182 1-2 1h-7a2.5 2.5 0 0 1-2-1h-1A1.5 1.5 0 0 1 0 13.5v-2.382a1.5 1.5 0 0 1 .83-1.342L2 9.191V8a6 6 0 0 1 4-5.659M7 2v.083a6 6 0 0 1 2 0V2a1 1 0 0 0-2 0M3 13.5A1.5 1.5 0 0 0 4.5 15h7a1.5 1.5 0 0 0 1.5-1.5V8A5 5 0 0 0 3 8zm-1-3.19-.724.362a.5.5 0 0 0-.276.447V13.5a.5.5 0 0 0 .5.5H2zm12 0V14h.5a.5.5 0 0 0 .5-.5v-2.382a.5.5 0 0 0-.276-.447L14 10.309Z"/>
</svg>
        </a>
          <span class="tooltip" >PACKAGES</span>
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
        <h3>PACKAGE DATA</h3>
      </div>
      <div class="col-2">
          <a href="../adminlogoutServlet">
        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="white" class="bi bi-box-arrow-in-right"
          viewBox="0 0 16 16">
          <path fill-rule="evenodd"
            d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z" />
          <path fill-rule="evenodd"
            d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
        </svg></a>
      </div>
    </div>
  </section>

    <div style="width: 85%; margin-left: 130px;" >
            <input class="mt-5 " style=" width: 100%; height: 50px; padding: 10px; margin-top: 150px !important;" type="search" id="searchInput" value="" name="searchInput" placeholder="Search By Package Name , Price , Type , Season , Location , Duration ,Status.." oninput="searchPackages()">  
    </div>
 
    <div  class="mt-5" style="width: 91%; margin-left: 110px; margin-bottom: -100px; display: flex; background-color: #01b3a7; height: 50px; padding: 10px; color: white; font-weight: 500; letter-spacing: 1px;">
       <div  style="width: 40px;" >ID</div>
       <div  style="width: 150px;" >NAME</div>
       <div  style="width: 100px;" >TYPE</div>
       <div  style="width: 150px;" >SEASON</div>
       <div  style="width: 150px;" >LOCATION</div>
       <div style="width: 100px;" >PRICE</div>
       <div  style="width: 120px;" >DURATION</div>
       <div  style="width: 125px;" >STATUS</div>
       <div  >MODIFY</div>
       <div style="margin-left: 35px;" >DELETE</div>
    </div>

    <div style="height: 100px;"></div>
        <%for(PackageData pkdata : pklist){%>
        
        <div class="product container" style="margin-left: 110px;">
            <div class="row dynamic">
                <div class="col-1 id" style="width: 40px;"><%=pkdata.getpk_id()%></div>
                <div class="col-1 name" style="width: 150px;"><%=pkdata.getpk_name()%></div>
                <div class="col-1 type"style="width: 100px;"><%=pkdata.getpk_type()%></div>
                <div class="col-1 season"style="width: 150px;"><%=pkdata.getpk_season()%></div>
                <div class="col-1 location"style="width: 150px;"><%=pkdata.getpk_location()%></div>
                <div class="col-2 price"style="width: 100px;"><%=pkdata.getpk_price()%></div>
                <div class="col-1 duration"style="width: 120px; padding-left: 45px;"><%=pkdata.getpk_duration()%></div>
                <div class="col-1 status"style="width: 125px;"><%=pkdata.getpk_status()%></div>
                <div class="col-1"><a href="admin-pack-modify.jsp?pk_id=<%=pkdata.getpk_id()%>">MODIFY</a></div>
                <div class="col-1 " style="margin-left: 10px; "><a href="../adminPackDelete?pk_id=<%=pkdata.getpk_id()%>">DELETE</a></div>
            </div>
        </div>
        
          
        
        <%}%>
        

  
  

 
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



        function searchPackages() {
            var searchValue = document.getElementById('searchInput').value.toLowerCase();
            var packageElements = document.getElementsByClassName('product');

            for (var i = 0; i < packageElements.length; i++) {
                var packageType = packageElements[i].querySelector('.type').textContent.toLowerCase();
                var packageName = packageElements[i].querySelector('.name').textContent.toLowerCase();
                var packageSeason = packageElements[i].querySelector('.season').textContent.toLowerCase();
                var packagePrice = packageElements[i].querySelector('.price').textContent.toLowerCase();
                var packageStatus = packageElements[i].querySelector('.status').textContent.toLowerCase();
                var packageDuration = packageElements[i].querySelector('.duration').textContent.toLowerCase();
                
                if (packageType.includes(searchValue) ||  packageName.includes(searchValue) || packageSeason.includes(searchValue) || packagePrice.includes(searchValue) || packageStatus.includes(searchValue) || packageDuration.includes(searchValue) ) {
                    packageElements[i].style.display = 'block';
                } else {
                    packageElements[i].style.display = 'none';
                }
            }
        }
   
  </script>
  <%}%>
    </body>
</html>

