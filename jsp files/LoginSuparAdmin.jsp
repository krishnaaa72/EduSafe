<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduSafe- Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3a0ca3;
            --accent: #f72585;
            --success: #4cc9f0;
            --warning: #f9c74f;
            --light: #f8f9fa;
            --dark: #212529;
            --gradient-primary: linear-gradient(135deg, #4361ee, #3a0ca3);
            --gradient-accent: linear-gradient(135deg, #f72585, #b5179e);
            --gradient-success: linear-gradient(135deg, #4cc9f0, #4895ef);
            --card-shadow: 0 10px 20px rgba(0, 0, 0, 0.12);
            --hover-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: white;
            color: #333;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
           }
        
        .blur-bg {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            
            background-size: cover;
            background-position: center;
            filter: blur(3px);
            z-index: -1;
        }
        
        .login-container {
            max-width: 450px;
            width: 100%;
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: all 0.3s ease;
        }
        
        .login-container:hover {
            box-shadow: var(--hover-shadow);
            transform: translateY(-5px);
        }
        
        .login-header {
            background: var(--gradient-primary);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .logo-container {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }
        
        .logo {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            color: var(--primary);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .login-header h1 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }
        
        .login-header p {
            opacity: 0.9;
        }
        
        .login-body {
            padding: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--secondary);
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            transition: all 0.3s ease;
            font-size: 1rem;
        }
        
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }
        
        .btn-login {
            width: 100%;
            padding: 12px;
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        
        .btn-login:hover {
            background: var(--gradient-success);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }
        
        .login-links {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        
        .login-links a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .login-links a:hover {
            color: var(--accent);
            transform: translateY(-2px);
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 25px 0;
            color: #6c757d;
        }
        
        .divider::before,
        .divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: #e9ecef;
        }
        
        .divider span {
            padding: 0 15px;
            font-size: 0.9rem;
        }
        
        .alert-notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: white;
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 10px;
            transform: translateX(100%);
            opacity: 0;
            transition: all 0.5s ease;
            z-index: 1000;
            border-left: 4px solid var(--success);
        }
        
        .alert-notification.show {
            transform: translateX(0);
            opacity: 1;
        }
        
        .alert-icon {
            font-size: 1.5rem;
            color: var(--success);
        }
        
        @media (max-width: 576px) {
            .login-container {
                max-width: 100%;
            }
            
            .login-links {
                flex-direction: column;
                gap: 10px;
            }
            
            .login-links a {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="blur-bg"></div>
    
    <div class="login-container">
        <div class="login-header">
            <div class="logo-container">
                <div class="logo">
                    <i class="fas fa-house-damage"></i>
                </div>
            </div>
            <h1>EduSafe</h1>
            <p>Student Login</p>
        </div>
        
        <div class="login-body">
            <form action="SuparAdminLoginServe" method="post">
                <div class="form-group">
                    <label for="uname">USERNAME</label>
                    <div class="input-with-icon">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter your username" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="pass">PASSWORD</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter your password" required>
                    </div>
                </div>
                
                <button type="submit" class="btn-login">LOGIN</button>
            </form>
            
            <div class="login-links">
                
                <a href="PasswordUpdate.jsp">
                    <i class="fas fa-key"></i> Forgot Password?
                </a>
            </div>
        </div>
    </div>
    
    <div class="alert-notification" id="successAlert">
        <i class="fas fa-check-circle alert-icon"></i>
        <div>
            <strong id="alertTitle">Success</strong>
            <p id="alertMessage">Operation completed successfully!</p>
        </div>
    </div>

    <script>
        // Show alert if URL has success parameter
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const alert = document.getElementById('successAlert');
            const alertTitle = document.getElementById('alertTitle');
            const alertMessage = document.getElementById('alertMessage');
            
            if (urlParams.get('success') === '1') {
                alertTitle.textContent = 'Registration Successful';
                alertMessage.textContent = 'Your account has been created successfully!';
                alert.style.borderLeftColor = '#4cc9f0';
                alert.querySelector('.alert-icon').style.color = '#4cc9f0';
                showAlert();
            }
            if (urlParams.get('success') === '2') {
                alertTitle.textContent = 'Password Changed';
                alertMessage.textContent = 'Your password has been updated successfully!';
                alert.style.borderLeftColor = '#39ff14';
                alert.querySelector('.alert-icon').style.color = '#39ff14';
                showAlert();
            }
            
            function showAlert() {
                alert.classList.add('show');
                setTimeout(() => {
                    alert.classList.remove('show');
                }, 5000);
            }
        }
    </script>
</body>
</html>