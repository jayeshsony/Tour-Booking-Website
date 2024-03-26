//js  for sidebar menu statrs
     function toggleSidebar() 
     {
           const body = document.body;
           const sidebar = document.getElementById("sidebar");
           const content = document.getElementById("content");
           const blur = document.getElementById("blur");

     
             // If the window width is greater than 768 pixels (considered not mobile)
             if (sidebar.style.width === "250px") 
             {
               sidebar.style.width = "0";
               blur.style.display = "none";
             } else {
               sidebar.style.width = "250px";
              // blur.style.display = "block";
             }
           
     }
    //js for sidebar menu ends


