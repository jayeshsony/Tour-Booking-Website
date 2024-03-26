<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="newpackage.*" %>
 <%
    response.setHeader("Cache-Control", "no-cache , no-store");

    List<PackageData> pklist=new ArrayList<>();
    
    try {
            Connection con=connection.getconnection();
            
            String sql="select * from package where pk_status='available' order by pk_id desc limit 3 ";
            
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
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <script  defer src="bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
  <link href="aos/dist/aos.css" rel="stylesheet" type="text/css"/>
  <script defer="" src="aos/dist/aos.js" type="text/javascript"></script>
  <link href="css/index.css" rel="stylesheet" type="text/css"/>
  <script defer src="javascript/index.js" type="text/javascript"></script>
  <link href="css/menu.css" rel="stylesheet" type="text/css"/>
  <script defer src="javascript/menu.js" type="text/javascript"></script>
  <link href="css/footer.css" rel="stylesheet" type="text/css"/>
</head>

<body>
  
  <div id="blur"></div>

  <div id="sidebar" style="text-transform: uppercase;">
      <%
        user user=(user) session.getAttribute("loguser");
        if(user!=null)
        {%>
        <center>
        <h4 class=""> Welcome</h4>
        <h4> <%=user.getf_name()%></h4>
  </center>
        <%}%>
      <%
        if(user==null)
        {%>
        <a href="user/login.jsp">LogIn</a>
      <%}%>
      <a href="user/package.jsp">Our Tours</a>
      <a href="user/aboutUs.jsp">About Us</a>
      <a href="user/gallery.jsp">Gallery</a>
    <%
        
        if(user!=null)
        {%>
        <a href="user/userprofile.jsp">My Profile</a>
        <a href="user/favourite.jsp">Favorite</a>
        
        <a href="logoutServlet">Log Out</a>
       
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
  <!-- parallex effect section begins -->
  <div class=" container-fluid parallex ">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-12 ">
        <img src="images/hill1.png" alt="" id="hill1">
        <img src="images/hill2.png" alt="" id="hill2">
        <div class="parallexlogo">
          <img src="images/Jy_logo.png" alt="" id="logo" height="300px" width="100px">
        </div>
        <img src="images/hill3.png" alt="" id="hill3">
        <img src="images/tree.png" alt="" id="tree">
        <img src="images/hill4.png" alt="" id="hill4">
        <img src="images/hill5.png" alt="" id="hill5">
        <img src="images/leaf.png" alt="" id="leaf">
        <img src="images/plant.png" alt="" id="plant">
      </div>
    </div>
  </div>
  <!-- parallex effect section ends-->



 

  <!-- information div starts -->
  <div class="container-fluid information">
    <div class="row mt-5" data-aos="fade-down">
        <div class="col-lg-12 col-md-12 col-12 information-button" style="font-family: elnath; ">
            <a  style="font-size: 20px;" class="a1" onclick="toggleSection()">ABOUT US</a>
        <a style="font-size: 20px;" class="a2" onclick="toggleSection1()">WHY CHOOSE US</a>
      </div>
    </div>

    <div class="row mt-5 pt-5" data-aos="zoom-in">
      <div class=" col-lg-12 col-md-12  col-12 panel zoom-in" id="aboutUsPanel" style="display: block;">
          <p style="font-family: 'raleway'; font-size: 18px; letter-spacing: 1.2px; line-height: 1.5rem !important;">"Welcome to Adventour, your gateway to curated travel experiences across India! We specialize in fixed tours
          that blend cultural immersion, adventure, and relaxation. Our meticulously planned itineraries showcase the
          diverse landscapes and rich heritage of India. With a commitment to hassle-free travel, we take care of all
          logistics, ensuring you can focus on making lasting memories. Join us on a journey of discovery as we explore
          iconic landmarks, savor local cuisines, and connect with vibrant communities. Adventour is your trusted
          companion for unforgettable adventures in India."</p>
        </center>
      </div>
      <div class="col-lg-12 col-md-12  col-12 panel zoom-in" id="chooseUsPanel" style="display: none;">
        <p style="font-family: 'raleway'; font-size: 18px; letter-spacing: 1.2px; line-height: 1.5rem !important;">"Choose Adventour for an unparalleled exploration of India. In a crowded travel landscape, we stand out as
          your essential companion, offering expertise, reliability, and seamless experiences. Our fixed tours blend
          cultural immersion, adventure, and relaxation, meticulously planned to showcase India's diverse landscapes and
          rich heritage. We handle all logistics, ensuring stress-free travel and allowing you to focus on creating
          lasting memories. Adventour is more than a travel service; we are your trusted partner for unforgettable
          adventures. Whether you're a solo traveler, a couple, or a group, let Adventour be your guide to the
          extraordinary wonders of India."</p>
      </div>
    </div>
  </div>
  
  <!-- inforamation div ends -->

  <!-- honey comb div starts -->
  <div class="container-fluid  honey-comb " style="font-family: 'elnath'; ">
    <div class="row mt-lg-5 mt-xl-5 mt-md-0">
      <!-- honey  comb left column -->
      <div class="d-lg-block d-md-none d-none  col-lg-6 col-xl-6 col-md-6" data-aos="fade-right" data-aos-duration="1000">
        <div class="hexa-top1 d-flex">
          <div class="hexagon-2"></div>
          <div class="hexagon-2"></div>
        </div>
        <div class="hexa-top d-flex">
          <div class="hexagon-2"></div>
          <div class="hexagon">
            <center class="pt-5" >
              <h2 class="counter-numbers" data-number="100">0+</h2>
              <p>TOURS</p>
            </center>
          </div>
          <div class="hexagon-2"></div>
        </div>
        <div class="hexa-mid d-flex">
          <div class="hexagon">
            <center class="pt-5">
              <h2 class="counter-numbers" data-number="400">0+</h2>
              <p>PLACES</p>
            </center>
          </div>
          <div class="hexagon">
            <center class="pt-5">
              <h2 class="counter-numbers" data-number="1000">0+</h2>
              <p>VISITORS</p>
            </center>
          </div>
          <div class="hexagon-2"></div>
        </div>
        <div class="hexa-low d-flex">
          <div class="hexagon-2"></div>
          <div class="hexagon">
            <center class="pt-5">
              <h2 class="counter-numbers" data-number="200">0+</h2>
              <p>SERVICES</p>
            </center>
          </div>
          <div class="hexagon-2"></div>
        </div>
        <div class="hexa-low2 d-flex">
          <div class="hexagon-2"></div>
          <div class="hexagon-2"></div>
        </div>
      </div>

      <!--  honey comb  right column -->
      <div class=" r-honeycomb col-12 col-md-12 col-lg-6  col-xl-6   " data-aos="fade-left">
        <center>
          <div class="typing   ">
            <div class="text first-text  ">When in Doubt..</div>
            <div class="text sec-text"></div>
            <div class="mt-5 p-5">
                <a href="user/aboutUs.jsp" class="typebutton1">GET IN TOUCH</a>
              <a href="user/package.jsp"  class="typebutton2">SEE TOURS</a>
            </div>

          
          </div>
         

        </center>
      </div>
    </div>
  </div>



  <!-- honey comb div ends -->

  <section  style="background-color: white">
      <div class="row mt-5">
          <div class="col-5" style="height: 10px; background-color: #01b3a7; margin-top: 20px; "></div>
            <div class="col-7">  <h1 style="text-align: right; margin-right: 50px; color: #162e44; font-size: 50px; font-weight: 600;  font-family:elnath;" >Recently Added Tours</h1></div>
      </div>
    
    <%for(PackageData pkdata : pklist){%>
    <div class="product  mx-4 my-5" data-aos-duration="800">
      <div class="row no-gutters">
        <div class="pimage border-2  col-md-6 col-12"  data-aos="fade-right" >
          <img class="" src="<%=pkdata.getpk_image()%>" alt="" height="120%" width="100%">
        </div>
        <div class="col col-lg-6 col-md-6 col-12">
          <div class="pcontent">

            <div class="co2  mt-5"  data-aos="fade-left">
               <h2 style="font-family: 'elnath'; letter-spacing: 2px; "><%=pkdata.getpk_name()%></h2>
             <p class="mt-3" style="font-family: 'raleway'; font-size: 16px; letter-spacing: 1.5px; line-height:1.3rem !important; font-weight: 500;"><%=pkdata.getpk_description()%></p>
              
              <div class="py-3">
                  
<!--                <button type="button" class="pbutton2">Buy Now</button>-->
                <a  class="pbutton2" href="user/packDetails.jsp?pk_id=<%=pkdata.getpk_id()%>" >Explore More</a>
             
              </div>
            </div>
            <div class="pprice">
              <center>
                <p style="font-family: 'elnath'; letter-spacing: 2px; "><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg><%=pkdata.getpk_price()%></p>
              </center>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%}%>
  </section>
  <!-- product div ends -->
  <section style="margin-bottom: 330px;"></section>
 
  <%@include file="user/footer.jsp" %>
  
</body>

</html>