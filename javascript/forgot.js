


function submitForm() {
            // You can add your server-side form submission logic here
            alert('Form submitted successfully!');
        }

        document.getElementById('registrationForm').addEventListener('input', function () {
            validateForm();
        });

        function validateForm() {
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var security = document.getElementById('security').value;

            var isValid = true;

           
            if (!validateEmail(email) || password === '' || confirmPassword === '' || security==='') {
                isValid = false;
            }

            if (password !== confirmPassword) {
                isValid = false;
            }


            // Enable/disable the submit button based on validation
            var submitBtn = document.getElementById('submitBtn');
            if (isValid === true) {
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

    

