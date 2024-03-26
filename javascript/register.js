
        
        function getage()
        {
            var age = document.getElementById('age').value; 
            var errorMessage=document.getElementById("error-email");
            errorMessage.innerHTML="";
            if(age <18 )
            {
                errorMessage.innerHTML="*age must be 18+";
            }
            if(age > 100)
            {
                 errorMessage.innerHTML="*age must be <100 ";
            }

        }
        
        function getpassword()
        {
           var confirmPassword = document.getElementById('confirmPassword').value;
           var password= document.getElementById('password').value;
            var errorMessage1=document.getElementById("errorMessage1");
            errorMessage1.innerHTML="";
           if (password !== confirmPassword) {
                  errorMessage1.innerHTML="*Password don't match";
            }
        }
        
        var commonvalues = {
            gujarat: ["Banaskantha", "Ahmedabad", "Surat", "Vadodara", "Jamnagar"],
            rajasthan: ["Jodhpur", "Udaipur", "Chittorgarh","Jaipur"],
            maharashtra:["Mumbai","Thane","Amravati","Andheri","Kandivali"],
            uttarpradesh:["Lucknow","Prayagraj","Agra","Varanasi","Ayodhya"]
        };

        function changedropdownvalue(value) {
            if (value.length === 0) {
                document.getElementById("category").innerHTML = "<option value='' disabled selected>Select City</option>";
            } else {
                var commonOptions = "";

                for (var i = 0; i < commonvalues[value].length; i++) {
                    commonOptions += "<option style='color:black;' value='" + commonvalues[value][i] + "'>" + commonvalues[value][i] + "</option>";
                }

                document.getElementById("category").innerHTML = commonOptions;
            }
        }

       

        document.getElementById('registrationForm').addEventListener('input', function () {
            validateForm();
        });

        function validateForm() {
            var fname = document.getElementById('fname').value;
            var lname = document.getElementById('lname').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var age = document.getElementById('age').value;
            var security = document.getElementById('security').value;

            var isValid = true;

           
            if (fname === '' || lname === '' || !validateEmail(email) || password === '' || confirmPassword === '' || age === '' || security==='') {
                isValid = false;
            }

            if (password !== confirmPassword) {
                isValid = false;
            }

            if(age <18)
            {
                isValid = false;
            }

            // Enable/disable the submit button based on validation
            var submitBtn = document.getElementById('submitBtn');
            if (isValid) {
                submitBtn.disabled = false;
            } else {
                submitBtn.disabled = true;
            }
        }

        function validateEmail(email) {
            // A simple email validation regex
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }
  

