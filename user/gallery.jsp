

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery Page</title>
    <link href="../css/footer.css" rel="stylesheet" type="text/css"/>
    <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
    <script defer src="../javascript/menu.js" type="text/javascript"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script defer src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <style>
       
              .header
            {
               
                background: linear-gradient(#01b3a7,white);
                height: 150px;
                letter-spacing: 4px;
                
                color: #162e44;
                
            }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            text-align: center;
        }

        .gallery img {
            width: 275px;
            height: 250px;
            margin: 10px;
            cursor: pointer;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            transition: transform 0.2s;
        }

        .gallery img:hover {
            transform: scale(1.1);
        }

        #myModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            max-width: 75%;
            max-height: 75%;
        }

        .close {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 20px;
            color: #fff;
            cursor: pointer;
        }
        
        ::-webkit-scrollbar {
    width: 10px;
    background-color: #01b3a7;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(#01b3a7, #162e44);


}
    </style>
</head>
<body>
    <%
     response.setHeader("Cache-Control", "no-cache , no-store");
%>
    <%@include file="menu.jsp" %>
<div class="container-fluid header">
            <div class="row ">
                <div class="col-4   " style="">
                    <img style="" src="../images/Jy_logo.png" alt="" height="150px" width="200px">
                </div>
                <div class="col-6 pt-5  mx-5 " >
                    <p style="font-size: 40px; font-family: 'gadems'">GALLERY</p>
                </div>
                <div class="col-2"></div>
            </div>
 </div>
<div class="gallery " style="background-color: white;;">
    <div style=" width: 95%; margin: 0 auto;">
    <img src="../images/Dwarka.jpg" alt="" onclick="openModal('../images/Dwarka.jpg')">
    
    <img src="../images/agra/agra.jpg" alt="" onclick="openModal('../images/agra/agra.jpg')"/>
    <img src="../images/agra/preetam-priyabrat-D4e0CTsvEGU-unsplash.jpg" alt="" onclick="openModal('../images/agra/preetam-priyabrat-D4e0CTsvEGU-unsplash.jpg')"/>
    <img src="../images/dwarka/mukul-pathak-75zkUGkxp9k-unsplash.jpg" alt="" onclick="openModal('../images/dwarka/mukul-pathak-75zkUGkxp9k-unsplash.jpg')"/>
    <img src="../images/dwarka/sudhanshu-soni-50qkq4osIF8-unsplash.jpg" alt="" onclick="openModal('../images/dwarka/sudhanshu-soni-50qkq4osIF8-unsplash.jpg')"/>
    <img src="../images/goa/nikos-zacharoulis-O2wgGEZVvA4-unsplash.jpg" alt="" onclick="openModal('../images/goa/nikos-zacharoulis-O2wgGEZVvA4-unsplash.jpg')"/>
    <img src="../images/goa/sarang-pande-IijeyJbmrec-unsplash.jpg" alt="" onclick="openModal('../images/goa/sarang-pande-IijeyJbmrec-unsplash.jpg')"/>
    <img src="../images/goa/sumit-sourav-eSRtxPd9q1c-unsplash.jpg" alt="" onclick="openModal('../images/goa/sumit-sourav-eSRtxPd9q1c-unsplash.jpg')"/>
    <img src="../images/jaisalmer/gaurav-sehara-Mn-3P_jMAbU-unsplash.jpg" alt="" onclick="openModal('../images/jaisalmer/gaurav-sehara-Mn-3P_jMAbU-unsplash.jpg')"/>
    <img src="../images/jaisalmer/oren-yomtov-FAcfTXBw95s-unsplash.jpg" alt="" onclick="openModal('../images/jaisalmer/oren-yomtov-FAcfTXBw95s-unsplash.jpg')"/>
    <img src="../images/jaisalmer/sakshi-R8iPqL8SLAc-unsplash.jpg" alt="" onclick="openModal('../images/jaisalmer/sakshi-R8iPqL8SLAc-unsplash.jpg')"/>
    <img src="../images/kedarkantha/jackman-chiu-36Vbwo1OiZU-unsplash.jpg" alt="" onclick="openModal('../images/kedarkantha/jackman-chiu-36Vbwo1OiZU-unsplash.jpg')"/>
    <img src="../images/kedarkantha/neha-maheen-mahfin-SbCqwxc9-Cg-unsplash.jpg" alt="" onclick="openModal('../images/kedarkantha/neha-maheen-mahfin-SbCqwxc9-Cg-unsplash.jpg')"/>
    <img src="../images/kedarkantha/neha-maheen-mahfin-uzdftSQIuRo-unsplash.jpg" alt="" onclick="openModal('../images/kedarkantha/neha-maheen-mahfin-uzdftSQIuRo-unsplash.jpg')"/>
    <img src="../images/kedarkantha/samrat-khadka-wrfl3DeoTIw-unsplash.jpg" alt="" onclick="openModal('../images/kedarkantha/samrat-khadka-wrfl3DeoTIw-unsplash.jpg')"/>
    <img src="../images/kedarkantha/tejashvi-verma-RTq5roWVsN8-unsplash.jpg" alt="" onclick="openModal('../images/kedarkantha/tejashvi-verma-RTq5roWVsN8-unsplash.jpg')"/>
    <img src="../images/manali/abhishek-donda-7h7NCXp9eZ0-unsplash.jpg" alt="" onclick="openModal('../images/manali/abhishek-donda-7h7NCXp9eZ0-unsplash.jpg')"/>
    <img src="../images/manali/aditya-prakash-H4sDlXvni84-unsplash.jpg" alt="" onclick="openModal('../images/manali/aditya-prakash-H4sDlXvni84-unsplash.jpg')"/>
    <img src="../images/manali/anuchand-c-p-baS2ZXRr48E-unsplash.jpg" alt="" onclick="openModal('../images/manali/anuchand-c-p-baS2ZXRr48E-unsplash.jpg')"/>
    <img src="../images/manali/harsh-patel-Wce7Y1ZCZko-unsplash.jpg" alt="" onclick="openModal('../images/manali/harsh-patel-Wce7Y1ZCZko-unsplash.jpg')"/>
    <img src="../images/manali/raj-mathur-0vuW7F-47Oo-unsplash.jpg" alt="" onclick="openModal('../images/manali/raj-mathur-0vuW7F-47Oo-unsplash.jpg')"/>
    <img src="../images/manali/tejashvi-verma-cyWRGbQx3pE-unsplash.jpg" alt="" onclick="openModal('../images/manali/tejashvi-verma-cyWRGbQx3pE-unsplash.jpg')"/>
    <img src="../images/nainital/nainital (2).jpg" alt="" onclick="openModal('../images/nainital/nainital (2).jpg')"/>
    <img src="../images/nainital/nainital (3).jpg" alt="" onclick="openModal('../images/nainital/nainital (3).jpg')"/>
    <img src="../images/nainital/nainital.jpg" alt="" onclick="openModal('../images/nainital/nainital.jpg')"/>
    <img src="../images/nainital/nainital00.jpg" alt="" onclick="openModal('../images/nainital/nainital00.jpg')"/>
    <img src="../images/rishikesh/baatcheet-films-E9Pca0ZNS-w-unsplash.jpg" alt="" onclick="openModal('../images/rishikesh/baatcheet-films-E9Pca0ZNS-w-unsplash.jpg')"/>
    <img src="../images/rishikesh/cem-sagisman-bLS61-FdP8E-unsplash.jpg" alt="" onclick="openModal('../images/rishikesh/cem-sagisman-bLS61-FdP8E-unsplash.jpg')"/>
    <img src="../images/rishikesh/narinder-pal-Vv0oZQ_v48Y-unsplash.jpg" alt="" onclick="openModal('../images/rishikesh/narinder-pal-Vv0oZQ_v48Y-unsplash.jpg')"/>
    <img src="../images/rishikesh/siddharth-aUNOU-BL9Q0-unsplash.jpg" alt="" onclick="openModal('../images/rishikesh/siddharth-aUNOU-BL9Q0-unsplash.jpg')"/>
    <img src="../images/udaipur/udaipur (2).jpg" alt="" onclick="openModal('../images/udaipur/udaipur (2).jpg')"/>
    <img src="../images/udaipur/udaipur (3).jpg" alt="" onclick="openModal('../images/udaipur/udaipur (3).jpg')"/>

    </div>
  
</div>

<div id="myModal" onclick="closeModal()">
    <span class="close" onclick="closeModal()">&times;</span>
    <img class="modal-content" id="modalImg" height="500px" width="500px">
</div>
<section style="margin-bottom: 300px;"></section>
    <%@include file="footer.jsp" %>
<script>
    function openModal(imgSrc) {
        document.getElementById('myModal').style.display = 'flex';
        document.getElementById('modalImg').src = imgSrc;
    }

    function closeModal() {
        document.getElementById('myModal').style.display = 'none';
    }
</script>

</body>
</html>
