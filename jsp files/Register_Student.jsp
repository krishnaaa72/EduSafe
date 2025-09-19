<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EduSafe - Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    :root {
        --primary: #4361ee;
        --secondary: #3a0ca3;
        --accent: #f72585;
        --success: #4cc9f0;
        --light-bg: #f8f9fa;
        --text-dark: #212529;
        --text-light: #6c757d;
        --border-color: #dee2e6;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: var(--light-bg);
        color: var(--text-dark);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    .register-container {
        max-width: 800px;
        width: 100%;
        background: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        border: 1px solid var(--border-color);
    }

    .register-header {
        background: var(--primary);
        color: #fff;
        text-align: center;
        padding: 25px;
    }

    .logo-container {
        display: flex;
        justify-content: center;
        margin-bottom: 15px;
    }

    .logo {
        width: 70px;
        height: 70px;
        background: #fff;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2rem;
        color: var(--primary);
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }

    .register-header h1 { font-size: 1.7rem; margin-bottom: 5px; }
    .register-header p { opacity: 0.9; font-size: 0.95rem; }

    .register-body { padding: 30px; }

    .form-group { margin-bottom: 20px; }
    .form-group label { font-weight: 600; font-size: 0.95rem; }

    .input-with-icon { position: relative; }
    .input-icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-light);
    }

    .form-control, .form-select {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    .form-control { padding-left: 45px; }
    .form-control:focus, .form-select:focus {
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
        outline: none;
    }

    .form-select {
        appearance: none;
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 12px center;
        background-size: 16px 12px;
        padding-right: 45px;
    }

    .btn-register {
        width: 100%;
        padding: 12px;
        background: var(--primary);
        color: #fff;
        border: none;
        border-radius: 8px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 10px;
    }

    .btn-register:hover {
        background: var(--secondary);
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(67,97,238,0.25);
    }

    .login-link { text-align: center; margin-top: 20px; }
    .login-link a { color: var(--primary); text-decoration: none; font-weight: 500; display: inline-flex; align-items: center; gap: 5px; }
    .login-link a:hover { color: var(--accent); }

    .error-message { color: #dc3545; font-size: 0.85rem; margin-top: 5px; display: block; }

    @media (max-width: 768px) {
        body { padding-top: 40px; align-items: flex-start; }
    }
</style>
</head>
<body>

<div class="register-container">
    <div class="register-header">
        <div class="logo-container">
            <div class="logo"><i class="fas fa-shield-alt"></i></div>
        </div>
        <h1>Create Your Account</h1>
        <p>Join EduSafe</p>
    </div>

    <div class="register-body">
        <form action="RegisterServe" method="post" onsubmit="return validateForm();">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="user_id">User ID *</label>
                    <div class="input-with-icon">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="Enter User ID" required>
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="student_name">Full Name *</label>
                    <div class="input-with-icon">
                        <i class="fas fa-signature input-icon"></i>
                        <input type="text" class="form-control" id="student_name" name="student_name" placeholder="Enter Full Name" required>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="father_name">Father's Full Name</label>
                    <div class="input-with-icon">
                        <i class="fas fa-user-friends input-icon"></i>
                        <input type="text" class="form-control" id="father_name" name="father_name" placeholder="Enter Father's Full Name">
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="student_phone">Student Phone No. *</label>
                    <div class="input-with-icon">
                        <i class="fas fa-phone input-icon"></i>
                        <input type="text" class="form-control" id="student_phone" name="student_phone" maxlength="12" placeholder="Enter Student Phone No." required>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="parent_phone">Parent Phone No.</label>
                    <div class="input-with-icon">
                        <i class="fas fa-phone-alt input-icon"></i>
                        <input type="text" class="form-control" id="parent_phone" name="parent_phone" maxlength="12" placeholder="Enter Parent Phone No.">
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="occupation">Occupation</label>
                    <select class="form-select" id="occupation" name="occupation">
                        <option value="">Select Occupation</option>
                        <option value="Student">Student</option>
                        <option value="Worker">Worker</option>
                        <option value="Self Employment">Self Employment</option>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label for="working_area" id="workingAreaLabel">Working Area</label>
                <div class="input-with-icon">
                    <i class="fas fa-briefcase input-icon"></i>
                    <input type="text" class="form-control" id="working_area" name="working_area" placeholder="Enter Working Area">
                </div>
            </div>

            <div class="mb-3">
                <label for="home_address">Home Address</label>
                <textarea class="form-control" id="home_address" name="home_address" rows="3" placeholder="Enter Home Address"></textarea>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="password">Password *</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" id="password" name="password" maxlength="25" placeholder="Enter Password" required>
                    </div>
                    <span id="passwordError" class="error-message"></span>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="confirm_password">Confirm Password *</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" id="confirm_password" name="confirm_password" maxlength="25" placeholder="Confirm Password" required>
                    </div>
                    <span id="confirmPasswordError" class="error-message"></span>
                </div>
            </div>
            <!-- Terms -->
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="terms" required>
                <label class="form-check-label" for="terms">
                    I agree to the <a href="#">terms and conditions</a>
                </label>
            </div>
            

            <button type="submit" class="btn-register">Sign Up</button>
        </form>

        <div class="login-link">
            <a href="Login.jsp"><i class="fas fa-sign-in-alt"></i> Already have an account? Sign in</a>
        </div>
    </div>
</div>

<script>
    // Dynamically update Working Area label
    document.getElementById('occupation').addEventListener('change', function() {
        var label = document.getElementById('workingAreaLabel');
        var input = document.getElementById('working_area');
        if (this.value === 'Student') {
            label.textContent = 'School/College Name';
            input.placeholder = 'Enter School/College Name';
        } else {
            label.textContent = 'Working Area';
            input.placeholder = 'Enter Working Area';
        }
    });

    // Password validation
    function validateForm() {
        var password = document.getElementById("password").value.trim();
        var confirmPassword = document.getElementById("confirm_password").value.trim();
        var passwordError = document.getElementById("passwordError");
        var confirmPasswordError = document.getElementById("confirmPasswordError");

        passwordError.textContent = "";
        confirmPasswordError.textContent = "";

        var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,25}$/;

        if (!passwordPattern.test(password)) {
            passwordError.textContent = "Password must be 8-25 characters, including letters, numbers, and special characters.";
            return false;
        }

        if (password !== confirmPassword) {
            confirmPasswordError.textContent = "Passwords do not match.";
            return false;
        }

        return true;
    }
</script>
</body>
</html>
