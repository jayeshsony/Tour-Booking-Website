<%-- 
    Document   : thankspage
    Created on : 10-Feb-2024, 2:43:45 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-cache , no-store");
    int x=0;
    if (session == null || session.getAttribute("loguser") == null) {
        x=1;
    } 
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body
        {
            margin: 0;
            font-family: 'raleway';
            background-color: aliceblue;
        }

        .centered-div
        {
            width: 24%;
            height: 400px;
            background-color: #a5faf4;
            animation: translateIn 1.5s ease;
            margin: auto;
            box-shadow: 0px 7px 13px 0px rgba(0,0,0,0.7);
        }

        @keyframes translateIn {
            from{
                transform: translateY(-100%);
            }
            to{
                transform: translateY(0);
            }
        }

        .button1
        {
            display:inline-block;
            background-color: #162e44;
            border-radius: 5px;
            padding: 10px;
            color: white;
            text-decoration: none;
            letter-spacing: 1.5px;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <%if(x==1){
    response.sendRedirect("login.jsp");
        }else{%>
    <div class="div" style="margin-top: 20vh !important;">
        <div class="card" style="display: block; width: 25%; margin:auto; border:5px solid grey; border-radius: 5px; height: 10px; background-color: black;">

        </div>
    </div>

    <div style="overflow: hidden; margin-top: -10px; height: 450px;">
        <div class="centered-div" style="text-align: center;">
         
            <center><img src="../gifs/verified.gif" alt="" height="120px" width="130px" style="mix-blend-mode: multiply; margin:5vh auto ;"></center>
            <p style=" width: 90%; margin:auto;color: #162e44;font-weight: 700; font-size: 18px;">Payment Done, Adventure Awaits!!</p>
            <p style="width: 85%; padding-left: 25px; color: #162e44; font-weight: 600; font-size: 16px;">Your Ticket to Extraordinary Moments with Adventour has been confirmed!</p>

            <div class="buttons">
                <a class="button1" href="../index.jsp">HOME</a>
                <a class="button1" href="invoice.jsp">INVOICE</a>
            </div>
        </div>
    </div>
    <%}%>
</body>
</html>
