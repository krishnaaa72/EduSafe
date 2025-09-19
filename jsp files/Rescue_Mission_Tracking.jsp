<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rescue Mission Tracking - EduSafe</title>
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
        
        /* Rescue Mission Tracking */
        .mission-container {
            display: grid;
            grid-template-columns: 1fr 350px;
            gap: 25px;
        }
        
        .mission-map {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            height: 600px;
            position: relative;
        }
        
        .map-overlay {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.95);
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            z-index: 10;
            width: 250px;
        }
        
        .map-overlay h3 {
            margin-bottom: 15px;
            color: var(--secondary);
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 10px;
        }
        
        .map-legend-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .legend-color {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        .color-safe {
            background-color: var(--success);
        }
        
        .color-warning {
            background-color: var(--warning);
        }
        
        .color-danger {
            background-color: var(--danger);
        }
        
        .color-rescue {
            background-color: var(--primary);
        }
        
        /* Mission Status Sidebar */
        .mission-status {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            height: 600px;
            display: flex;
            flex-direction: column;
        }
        
        .status-header {
            background: var(--secondary);
            color: white;
            padding: 20px;
            text-align: center;
        }
        
        .status-header h2 {
            margin-bottom: 5px;
        }
        
        .status-content {
            padding: 20px;
            overflow-y: auto;
            flex: 1;
        }
        
        .emergency-info {
            background: #fff5f5;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            border-left: 4px solid var(--danger);
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--border-color);
        }
        
        .info-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        
        .info-label {
            font-weight: 600;
            color: var(--text-dark);
        }
        
        .info-value {
            color: var(--text-light);
        }
        
        .status-section {
            margin-bottom: 25px;
        }
        
        .status-section h3 {
            margin-bottom: 15px;
            color: var(--secondary);
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 10px;
        }
        
        .response-team {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 8px;
            background: var(--light-bg);
        }
        
        .team-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            margin-right: 15px;
        }
        
        .team-info {
            flex: 1;
        }
        
        .team-name {
            font-weight: 600;
            margin-bottom: 3px;
        }
        
        .team-status {
            font-size: 0.85rem;
            color: var(--text-light);
        }
        
        .team-status.en-route {
            color: var(--warning);
        }
        
        .team-status.on-site {
            color: var(--success);
        }
        
        /* Rescue Progress */
        .progress-container {
            background: var(--light-bg);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .progress-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .progress-bar {
            height: 10px;
            background: #e9ecef;
            border-radius: 5px;
            overflow: hidden;
        }
        
        .progress-fill {
            height: 100%;
            background: var(--success);
            border-radius: 5px;
            width: 65%;
            transition: width 0.5s ease;
        }
        
        /* Map Visualization */
        .map-visualization {
            height: 100%;
            background: #eef2ff;
            position: relative;
            overflow: hidden;
        }
        
        .building {
            position: absolute;
            background: white;
            border: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            z-index: 2;
        }
        
        .building-a {
            width: 120px;
            height: 80px;
            top: 100px;
            left: 50px;
            border-radius: 8px;
        }
        
        .building-b {
            width: 150px;
            height: 100px;
            top: 220px;
            left: 200px;
            border-radius: 8px;
        }
        
        .building-c {
            width: 100px;
            height: 120px;
            top: 350px;
            left: 80px;
            border-radius: 8px;
        }
        
        .person {
            position: absolute;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 0.7rem;
            animation: pulse 2s infinite;
            transform-origin: center;
            z-index: 3;
        }
        
        .person-safe {
            background: var(--success);
        }
        
        .person-warning {
            background: var(--warning);
        }
        
        .person-danger {
            background: var(--danger);
        }
        
        .rescue-team {
            position: absolute;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1rem;
            border: 2px solid white;
            box-shadow: 0 0 0 3px var(--primary);
            animation: move 20s infinite alternate;
            z-index: 4;
        }
        
        @keyframes move {
            0% { top: 400px; left: 50px; }
            25% { top: 150px; left: 200px; }
            50% { top: 300px; left: 300px; }
            75% { top: 200px; left: 400px; }
            100% { top: 400px; left: 500px; }
        }
        
        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 25px;
        }
        
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
        }
        
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 1.5rem;
        }
        
        .icon-safe {
            background: rgba(76, 201, 240, 0.2);
            color: var(--success);
        }
        
        .icon-warning {
            background: rgba(249, 199, 79, 0.2);
            color: var(--warning);
        }
        
        .icon-danger {
            background: rgba(249, 65, 68, 0.2);
            color: var(--danger);
        }
        
        .icon-rescue {
            background: rgba(67, 97, 238, 0.2);
            color: var(--primary);
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: var(--text-light);
        }
        
        /* Responsive */
        @media (max-width: 1200px) {
            .mission-container {
                grid-template-columns: 1fr;
            }
        }
        
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
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .top-bar {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }
            
            .map-overlay {
                top: 10px;
                right: 10px;
                width: 200px;
            }
            
            .building-a {
                top: 120px;
                left: 30px;
            }
            
            .building-b {
                top: 250px;
                left: 180px;
            }
            
            .building-c {
                top: 380px;
                left: 60px;
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
            
            .map-overlay {
                position: relative;
                width: 100%;
                top: 0;
                right: 0;
                margin-bottom: 15px;
            }
            
            .mission-map {
                height: auto;
                padding: 15px;
            }
            
            .map-visualization {
                height: 400px;
            }
            
            .building-a,
            .building-b,
            .building-c {
                position: relative;
                top: auto;
                left: auto;
                margin: 10px auto;
                width: 80%;
                height: 60px;
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
            <a href="conduct_drill.jsp" class="menu-item">
                <i class="fas fa-bullhorn"></i>
                <span class="menu-text">Conduct Drills</span>
            </a>
            <a href="EmergencyDrill.jsp" class="menu-item">
                <i class="fas fa-exclamation-triangle"></i>
                <span class="menu-text">Emergency Drill</span>
            </a>
            <a href="Rescue_Mission_Tracking.jsp" class="menu-item active">
                <i class="fas fa-helicopter"></i>
                <span class="menu-text">Rescue Mission</span>
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
                <h1>Rescue Mission Tracking</h1>
                <p>Live monitoring of emergency response efforts</p>
            </div>
            <div class="emergency-alert">
                <span class="alert-badge" style="background: var(--danger); color: white; padding: 8px 15px; border-radius: 20px;">
                    <i class="fas fa-exclamation-circle"></i> ACTIVE EMERGENCY
                </span>
            </div>
        </div>
        
        <!-- Stats Overview -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon icon-safe">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="stat-number">42</div>
                <div class="stat-label">Confirmed Safe</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon icon-warning">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <div class="stat-number">15</div>
                <div class="stat-label">Needs Assistance</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon icon-danger">
                    <i class="fas fa-crosshairs"></i>
                </div>
                <div class="stat-number">8</div>
                <div class="stat-label">In Immediate Danger</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon icon-rescue">
                    <i class="fas fa-first-aid"></i>
                </div>
                <div class="stat-number">3</div>
                <div class="stat-label">Rescue Teams Deployed</div>
            </div>
        </div>
        
        <!-- Mission Tracking -->
        <div class="mission-container">
            <div class="mission-map">
                <div class="map-overlay">
                    <h3>Legend</h3>
                    <div class="map-legend-item">
                        <div class="legend-color color-safe"></div>
                        <span>Safe</span>
                    </div>
                    <div class="map-legend-item">
                        <div class="legend-color color-warning"></div>
                        <span>Needs Help</span>
                    </div>
                    <div class="map-legend-item">
                        <div class="legend-color color-danger"></div>
                        <span>In Danger</span>
                    </div>
                    <div class="map-legend-item">
                        <div class="legend-color color-rescue"></div>
                        <span>Rescue Team</span>
                    </div>
                </div>
                
                <div class="map-visualization">
                <h4 style="text-align:center; color: Red;font-size:1cm;">Live Tracking</h4>
                    <!-- Buildings -->
                    <div class="building building-a">Building A</div>
                    <div class="building building-b">Building B</div>
                    <div class="building building-c">Building C</div>
                    
                    <!-- People -->
                    <div class="person person-safe" style="top: 120px; left: 80px;">S</div>
                    <div class="person person-safe" style="top: 160px; left: 130px;">S</div>
                    <div class="person person-warning" style="top: 250px; left: 230px;">H</div>
                    <div class="person person-danger" style="top: 280px; left: 250px;">D</div>
                    <div class="person person-warning" style="top: 380px; left: 130px;">H</div>
                    <div class="person person-safe" style="top: 400px; left: 170px;">S</div>
                    <div class="person person-danger" style="top: 320px; left: 400px;">D</div>
                    
                    <!-- Rescue Teams -->
                    <div class="rescue-team" style="top: 400px; left: 30px;">
                        <i class="fas fa-first-aid"></i>
                    </div>
                    <div class="rescue-team" style="top: 150px; left: 380px;">
                        <i class="fas fa-ambulance"></i>
                    </div>
                </div>
            </div>
            
            <div class="mission-status">
                <div class="status-header">
                    <h2>Emergency Response</h2>
                    <p>Earthquake Drill - In Progress</p>
                </div>
                
                <div class="status-content">
                    <div class="emergency-info">
                        <h3><i class="fas fa-exclamation-circle"></i> Emergency Details</h3>
                        <div class="info-item">
                            <span class="info-label">Type:</span>
                            <span class="info-value">Earthquake</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Initiated:</span>
                            <span class="info-value">Today, 10:23 AM</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Location:</span>
                            <span class="info-value">Main Campus</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Severity:</span>
                            <span class="info-value" style="color: var(--danger);">High</span>
                        </div>
                    </div>
                    
                    <div class="status-section">
                        <h3>Response Teams</h3>
                        
                        <div class="response-team">
                            <div class="team-avatar">T1</div>
                            <div class="team-info">
                                <div class="team-name">Medical Team Alpha</div>
                                <div class="team-status on-site"><i class="fas fa-map-marker-alt"></i> On Site - Building A</div>
                            </div>
                            <div class="team-action">
                                <i class="fas fa-radio" style="color: var(--primary);"></i>
                            </div>
                        </div>
                        
                        <div class="response-team">
                            <div class="team-avatar">T2</div>
                            <div class="team-info">
                                <div class="team-name">Rescue Team Bravo</div>
                                <div class="team-status en-route"><i class="fas fa-car-side"></i> En Route - ETA 5min</div>
                            </div>
                            <div class="team-action">
                                <i class="fas fa-radio" style="color: var(--primary);"></i>
                            </div>
                        </div>
                        
                        <div class="response-team">
                            <div class="team-avatar">T3</div>
                            <div class="team-info">
                                <div class="team-name">Fire Team Charlie</div>
                                <div class="team-status on-site"><i class="fas fa-map-marker-alt"></i> On Site - Building B</div>
                            </div>
                            <div class="team-action">
                                <i class="fas fa-radio" style="color: var(--primary);"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="status-section">
                        <h3>Rescue Progress</h3>
                        <div class="progress-container">
                            <div class="progress-header">
                                <span>Evacuation Completion</span>
                                <span>65%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-fill" style="width: 65%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Simulate live updates
        setInterval(() => {
            // Randomly update person statuses
            const persons = document.querySelectorAll('.person');
            persons.forEach(person => {
                if (Math.random() > 0.7) {
                    if (person.classList.contains('person-danger')) {
                        person.classList.remove('person-danger');
                        person.classList.add('person-warning');
                        person.textContent = 'H';
                    } else if (person.classList.contains('person-warning')) {
                        person.classList.remove('person-warning');
                        person.classList.add('person-safe');
                        person.textContent = 'S';
                    }
                }
            });
            
            // Update stats
            const safeCount = document.querySelectorAll('.person-safe').length;
            const warningCount = document.querySelectorAll('.person-warning').length;
            const dangerCount = document.querySelectorAll('.person-danger').length;
            
            document.querySelectorAll('.stat-number')[0].textContent = safeCount;
            document.querySelectorAll('.stat-number')[1].textContent = warningCount;
            document.querySelectorAll('.stat-number')[2].textContent = dangerCount;
            
            // Update progress bar
            const total = safeCount + warningCount + dangerCount;
            const progress = Math.min(100, Math.round((safeCount / total) * 100));
            document.querySelector('.progress-fill').style.width = ${progress}%;
            document.querySelector('.progress-header span:last-child').textContent = ${progress}%;
            
        }, 3000);
        
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