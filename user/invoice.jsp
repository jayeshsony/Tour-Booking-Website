<%-- 
    Document   : invoice
    Created on : 05-Feb-2024, 4:27:37 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="newpackage.*" %>


<%
    response.setHeader("Cache-Control", "no-cache , no-store");
    int x=0;
    if (session == null || session.getAttribute("loguser") == null) {
        x=1;
    } 
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="../bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/html2pdf.bundle.min.js" type="text/javascript"></script>
    <title>Document</title>
    <style>
        body
        {
            font-family: Arial,sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            cursor: default;
            font-family: raleway;
            font-weight: 600;
            letter-spacing: 1.1px;
        }

        .invoice
        {
            width: 90%;
            border: 1px solid #ccc;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: #fff;
            margin: 5vh auto;
        }

        .invoice-header h1
        {
            color: #333;
            font-family: 'elnath';
        }

        .invoice-items th,.invoice-items td
        {
            border-right: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .invoice-items td
        {
            border-bottom: 0px;
        }

        .description-column
        {
            width: 70%;
        }

        .section
        {
            margin-top: 20px;
            padding: 15px;
            background-color: #f2f2f2;
            border-radius: 5px;
        }

        .section p
        {
            font-size: 16px;
            margin:0;
        }

        .sub-table
        {
            width: 100%;
        }
        .sub-table td
        {
            padding: 5px 10px;
            border:0;
            border-bottom: 1px solid #ccc;
        }

        .sub-table td:first-child
        {
            border-right: 1px solid #ddd;
        }

        #downloadBtn
        {
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border:none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            text-transform: uppercase;
        }

        .backlink
        {
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            width: fit-content;
            margin-left: 20px;
        }

        .backlink:hover
        {
            color: white;
        }
    </style>
</head>
<body>
    <%if(x==1){
    response.sendRedirect("login.jsp");
        }else{
        
   
    String pk_name=null;
    int duration=0;
    int price=0;
    String f_name=null;
    String l_name=null;
    String from_date=null;
    String to_date=null;
    String pick_city=null;
    String pick_point=null;
    String email=null;
    int passenger=0;
    int tprice=0;
    String bus_no=null;
    String bus_contact=null;
    int tseat=0;
    int seat_to=0;
    int seat_from=0;
    int b_id=0;
    
    HttpSession setId=request.getSession();
    int pk_id=(int)setId.getAttribute("pk_id");
    
    
    try {
            Connection con=connection.getconnection();
            
            String sql1="select * from package where pk_id=?";
            
            PreparedStatement pts1=con.prepareStatement(sql1);
            pts1.setInt(1, pk_id);
            
            ResultSet rs1=pts1.executeQuery();
            
            if(rs1.next())
            {
                pk_name=rs1.getString("pk_name");
                duration=rs1.getInt("pk_duration");
                price=rs1.getInt("pk_price");
            }
            
            String sql2="select * from booking order by b_id desc limit 1";
            
            PreparedStatement pts2=con.prepareStatement(sql2);
            ResultSet rs2=pts2.executeQuery();
            
            if(rs2.next())
            {
                b_id=rs2.getInt("b_id");
                f_name=rs2.getString("f_name");
                l_name=rs2.getString("l_name");
                from_date=rs2.getString("from_date");
                to_date=rs2.getString("to_date");
                pick_city=rs2.getString("pick_city");
                pick_point=rs2.getString("pick_point");
                email=rs2.getString("email");
                passenger=rs2.getInt("passenger");
                tprice=rs2.getInt("tprice");
            }
            
            String sql3="select * from transport where location=?";
            
            PreparedStatement pts3=con.prepareStatement(sql3);
            pts3.setString(1, pick_city);
            
            ResultSet rs3=pts3.executeQuery();
            
            if(rs3.next())
            {
                bus_no=rs3.getString("v_num");
                bus_contact=rs3.getString("v_contact");
                tseat=rs3.getInt("seat_no");
            }
            
            seat_from=tseat-passenger+1;
            seat_to=tseat;
        } catch (Exception e) {
        }


    %>
    <div class="invoice" id="invoiceContent">
        <div class="invoice-header text-center">
            <h1>
                ADVENTOUR
            </h1>
            <hr>
        </div>  
        
        <head>
                <div class="invoice-details mb-3">
            <div class="row">
                <div class="col-6">
                    <strong>Invoice Number:</strong>INV-2024<%=b_id%><br>
                    <strong>Date:<span id="todaysDate"></span></strong>
                </div>
                <div class="col-6" style="padding-left: 50px;">
                    <strong>Billed to:</strong><%=f_name%> <%=l_name%><br>
                    <strong>Contact:</strong><%=email%><br>
                    <strong>Bus Number:</strong><%=bus_no%><br>
                    <strong>Bus Contact:</strong><%=bus_contact%>
                    <%if(passenger==0){%>
                    <strong>Seat No:</strong><%=tseat%><br>
                    <%}else{%>
                    <strong>Seat From:</strong><%=seat_from%>
                    <strong>to:</strong><%=seat_to%>
                    <%}%>
                </div>
            </div>
        </div>
        <hr>

        <table class="table invoice-items">
            <thead>
                <tr>
                    <th class="description-column">Tour Description</th>
                    <th>Package Price</th>
                    <th style="border-right: none;">Total Tourist</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="description-column">
                        <table class="sub-table">
                            <tr>
                                <td>Tour Name:</td>
                                <td><%=pk_name%></td>
                            </tr>
                            <tr>
                                <td>Duration:</td>
                                <td><%=duration%></td>
                            </tr>
                            <tr>
                                <td>From Date:</td>
                                <td><%=from_date%></td>
                            </tr>
                            <tr>
                                <td>to date:</td>
                                <td><%=to_date%></td>
                            </tr>
                            <tr>
                                <td>Departure city:</td>
                                <td><%=pick_city%>,<%=pick_point%></td>
                            </tr>
                        </table>
                    </td>
                    <td><svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg> <span class="pp" id="totalprice"><%=price%></td>
                    <td style="border-right: none;"><%=passenger%></td>
                    
                </tr>
            </tbody>
        </table>

        <hr>
        <div class="invoice-total row"> 
            <div class="col-8">

            </div>
            <div class="col-4" style="padding-left: 50px;">
                <p><strong>Total:</strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg> <span class="pp" id="totalprice"><%=tprice%></p>
            </div>
        </div>

        <hr>

        <div class="section">
            <p>Thank you for choosing our tour package named <%=pk_name%>! Your adventure awaits with our specially curated Adventure Package.The tour spans <%=duration%> days, from <%=from_date%> to <%=to_date%>, starting from the city of <%=pick_city%>, country. The total Cost for this unforgettable experience is <svg xmlns="http://www.w3.org/2000/svg" width="20" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg> <span class="pp" id="totalprice"><%=tprice%>.</p>
            <p>We value your privacy and assure you that your personal information will be handled with the utmost care and confidentiality. For any questions or concerns , feel free to contact our customer support at support@gmail.com .</p>
            <p><strong>Detailed information about your package will be sent to you via email. We look forward to providing you with a seamless and enjoyable travel experience.</strong></p>
        </div>
    </div>
            <div style="font-family: 'raleway'; font-weight: 500;">   
    <center><button id="downloadBtn" class="mb-5" >Download Invoice</button><a href="../index.jsp" class="backlink" >HOME</a></center>
</div>
    <script>
        document.getElementById('downloadBtn').addEventListener('click',function(){var element=document.getElementById('invoiceContent');
        html2pdf(element,{margin:10,filename:'Adventour_invoice.pdf',image:{type:'jpeg',quality:0.98},html2canvas:{scale:2},jsPDF:{unit:'mm',format:'a4',orientation:'portrait'}});});

        var today=new Date();

        var formattedDate=today.getDate().toString().padStart(2,'0')+'-'+(today.getMonth()+1).toString().padStart(2,'0')+'-'+today.getFullYear();

        document.getElementById('todaysDate').innerText=formattedDate;
    </script>
    <%}%>
</body>
</html>