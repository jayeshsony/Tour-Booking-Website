AOS.init();  
  
    // js for parallex scrolling starts...
        const leaf= document.getElementById("leaf");
        const tree= document.getElementById("tree");
        const hill4= document.getElementById("hill4");
        const hill5= document.getElementById("hill5");
        const hill1= document.getElementById("hill1");
        const logo = document.getElementById("logo");

        window.addEventListener('scroll',()=>
        {
            let value = window.scrollY;

            leaf.style.top = value * -1.5 +'px';
            leaf.style.left = value * 1.5 + 'px';
            hill4.style.left = value * -1.5 + 'px';
            hill5.style.left = value * 1.5 + 'px';
            hill1.style.top= value * 
            0.5+ 'px';
            logo.style.top= value * 1 + 'px';
            tree.style.left= value * 1.5 + 'px';
        });
     // js for parallex scrolling starts...


    

    //js information starts
    var panel = document.getElementById('aboutUsPanel');
    var otherpanel = document.getElementById('chooseUsPanel');
           document.querySelector('.a1').style.color = '#01b3a7';
           document.querySelector('.a2').style.color = '#162e44';
           document.querySelector('.a1').style.borderTopColor = '#01b3a7';
           document.querySelector('.a1').style.borderBottomColor = '#01b3a7';
           document.querySelector('.a2').style.borderTopColor = '#162e44';
           document.querySelector('.a2').style.borderBottomColor = '#162e44';


        function toggleSection()
        { 
           document.querySelector('.a1').style.color = '#01b3a7';
           document.querySelector('.a2').style.color = '#162e44';
           document.querySelector('.a1').style.borderTopColor = '#01b3a7';
           document.querySelector('.a1').style.borderBottomColor = '#01b3a7';
           document.querySelector('.a2').style.borderTopColor = '#162e44';
           document.querySelector('.a2').style.borderBottomColor = '#162e44';

           if(otherpanel.style.display === "block")
           {
               otherpanel.style.display = "none";
               panel.style.display="block";
               
           }
        }

        function toggleSection1()
        {
            document.querySelector('.a2').style.color = '#01b3a7';
            document.querySelector('.a1').style.color = '#162e44';
            document.querySelector('.a2').style.borderTopColor = '#01b3a7';
            document.querySelector('.a2').style.borderBottomColor = '#01b3a7';
            document.querySelector('.a1').style.borderTopColor = '#162e44';
            document.querySelector('.a1').style.borderBottomColor = '#162e44';
        
           if(panel.style.display = "block")
           {
               panel.style.display = "none";
               otherpanel.style.display="block";
           }
        }
    //js information ends

    //js for number increasing effect starts
  var triggerHeight = 600;
  var isScrolling = false;

  window.addEventListener('scroll', function () 
  {
    isScrolling = true;

    if (window.scrollTimeout) {
      clearTimeout(window.scrollTimeout);
    }
  
    window.scrollTimeout = setTimeout(function () 
    {
      isScrolling = false;

      if (window.scrollY >= triggerHeight)
      {
        const counterNum = document.querySelectorAll(".counter-numbers");
        const speed = 50;
        
        counterNum.forEach((curElem) => 
        {
            const updateNumber = () => 
            {
               const targetNumber = parseInt(curElem.dataset.number);
               const initialNum = parseInt(curElem.innerText);
               const incrementNumber = Math.trunc(targetNumber / speed);

               if (initialNum < targetNumber) 
               {
                  curElem.innerText = `${initialNum + incrementNumber}+`;
                  setTimeout(updateNumber, 30);
               }
            };
          updateNumber();
        });
      }
    }, 200);
  });

    //js for numberincreasing effect ends

    //typing effect starts
    const text = document.querySelector(".sec-text");

    const textLoad = () => {
    setTimeout(() => {
        text.textContent = "Explore";
    }, 0);
    setTimeout(() => {
        text.textContent = "Imagine";
    }, 4100);
    setTimeout(() => {
        text.textContent = "Just trip";
    }, 8200); //1s = 1000 milliseconds
};

textLoad();
setInterval(textLoad, 12000);
    //typing effect ends

    

