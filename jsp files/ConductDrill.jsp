<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduSafe - Conduct Drill</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #eef2ff;
            --secondary: #3a0ca3;
            --accent: #f72585;
            --success: #4cc9f0;
            --warning: #f9c74f;
            --danger: #f94144;
            --light-bg: #f8f9fa;
            --text-dark: #212529;
            --text-light: #6c757d;
            --border-color: #dee2e6;
            --sidebar-width: 250px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fb;
            color: var(--text-dark);
            line-height: 1.6;
            display: flex;
            min-height: 100vh;
        }
        
        /* Sidebar */
        .sidebar {
            width: var(--sidebar-width);
            background: var(--primary);
            color: white;
            height: 100vh;
            position: fixed;
            transition: all 0.3s ease;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
        
        .logo-container {
            padding: 25px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .logo-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
        }
        
        .logo-text {
            font-size: 1.5rem;
            font-weight: 700;
        }
        
        .sidebar-menu {
            padding: 20px 0;
            
        }
        
        .menu-item {
            padding: 15px 25px;
            display: flex;
            align-items: center;
            gap: 15px;
            transition: all 0.3s ease;
            cursor: pointer;
            color: white;
            text-decoration: none;
        }
        
        .menu-item:hover, .menu-item.active {
            background: rgba(255, 255, 255, 0.1);
            border-left: 4px solid white;
        }
        
        .menu-item i {
            width: 20px;
            text-align: center;
        }
        
        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 20px;
            transition: all 0.3s ease;
        }
        
        /* Top Bar */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 25px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 25px;
        }
        
        .greeting h1 {
            font-size: 1.8rem;
            color: var(--text-dark);
            margin-bottom: 5px;
        }
        
        .greeting p {
            color: var(--text-light);
        }
        
        
        /* Drill Selection Cards */
        .drill-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 50px;
        }
        
        .drill-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 320px;
            text-align: center;
            cursor: pointer;
        }
        
        .drill-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .drill-header {
            padding: 25px 20px;
            font-size: 1.3rem;
            font-weight: 600;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            color: white;
        }
        
        .emergency-header {
            background: var(--danger);
        }
        
        .mock-header {
            background: var(--warning);
        }
        
        .drill-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            background: rgba(255, 255, 255, 0.2);
        }
        
        .drill-content {
            padding: 25px 20px;
        }
        
        .drill-description {
            color: var(--text-light);
            margin-bottom: 25px;
            line-height: 1.6;
        }
        
        .btn-drill {
            display: inline-block;
            padding: 12px 25px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            width: 100%;
        }
        
        .btn-emergency {
            background: var(--danger);
        }
        
        .btn-emergency:hover {
            background: #e02d30;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(249, 65, 68, 0.3);
        }
        
        .btn-mock {
            background: var(--warning);
            color: var(--text-dark);
        }
        
        .btn-mock:hover {
            background: #f7bc2d;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(249, 199, 79, 0.3);
        }
        
        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
                overflow: hidden;
            }
            
            .logo-text, .menu-text {
                display: none;
            }
            
            .main-content {
                margin-left: 70px;
            }
            
            .logo {
                justify-content: center;
            }
            
            .drill-container {
                flex-direction: column;
                align-items: center;
            }
        }
        
        @media (max-width: 768px) {
            .top-bar {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }
        }
        
        @media (max-width: 576px) {
            .sidebar {
                width: 0;
            }
            
            .main-content {
                margin-left: 0;
                padding: 15px;
            }
            
            .drill-card {
                width: 100%;
                max-width: 320px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo-container">
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <div class="logo-text">EduSafe</div>
            </div>
        </div>
        
        <div class="sidebar-menu">
            <a href="SuperAdmin.jsp" class="menu-item">
                <i class="fas fa-home"></i>
                <span class="menu-text">Dashboard</span>
            </a>
            <a href="Register_Student.jsp" class="menu-item">
                <i class="fas fa-user-plus"></i>
                <span class="menu-text">Add Users</span>
            </a>
            <a href="Register_User_Admin.jsp" class="menu-item">
            	<i class="fas fa-user-cog"></i>
            	<span class="menu-text">Add Admin</span>
            </a>
            <a href="ConductDrill.jsp" class="menu-item active">
                <i class="fas fa-bullhorn"></i>
                <span class="menu-text">Conduct Drills</span>
            </a>
            <a href="batch_divisions.html" class="menu-item">
                <i class="fas fa-users"></i>
                <span class="menu-text">Batch Divisions</span>
            </a>
            <a href="reports.html" class="menu-item">
                <i class="fas fa-chart-bar"></i>
                <span class="menu-text">Reports</span>
            </a>
            <a href="settings.html" class="menu-item">
                <i class="fas fa-cog"></i>
                <span class="menu-text">Settings</span>
            </a>
            <a href="Login.jsp" class="menu-item">
                <i class="fas fa-sign-out-alt"></i>
                <span class="menu-text">Logout</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="top-bar">
            <div class="greeting">
                <h1>Conduct Drills</h1>
                <p>Select the type of drill you want to conduct</p>
            </div>
            
            
        </div>
        
        <!-- Drill Selection Cards -->
        <div class="drill-container">
            <!-- Emergency Drill Card -->
            <div class="drill-card">
                <div class="drill-header emergency-header">
                    <div class="drill-icon">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>
                    <h3>Emergency Drill</h3>
                </div>
                <div class="drill-content">
                    <p class="drill-description">
                        Initiate an actual emergency drill to test response procedures and alert all users.
                        This will send real-time notifications to all participants.
                    </p>
                    <form action="EmergencyDrill.jsp" method="get">
                        <button type="submit" class="btn-drill btn-emergency">Start Emergency Drill</button>
                    </form>
                </div>
            </div>
            
            <!-- Mock Drill Card -->
            <div class="drill-card">
                <div class="drill-header mock-header">
                    <div class="drill-icon">
                        <i class="fas fa-running"></i>
                    </div>
                    <h3>Mock Drill</h3>
                </div>
                <div class="drill-content">
                    <p class="drill-description">
                        Conduct a practice drill for training purposes without sending actual emergency alerts.
                        Perfect for training new staff and testing procedures.
                    </p>
                    <form action="MockDrill.jsp" method="get">
                        <button type="submit" class="btn-drill btn-mock">Start Mock Drill</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Add active class to the current menu item
        document.querySelectorAll('.menu-item').forEach(item => {
            if (item.href === window.location.href) {
                item.classList.add('active');
            }
            
            item.addEventListener('click', function() {
                document.querySelectorAll('.menu-item').forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>