<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduSafe - Mock Drill</title>
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
        
        
        
        /* Mock Drill Container */
        .mock-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .mock-header {
            background: var(--warning);
            color: var(--text-dark);
            text-align: center;
            padding: 25px;
        }
        
        .mock-header h1 {
            font-size: 1.8rem;
            margin-bottom: 10px;
        }
        
        .mock-header p {
            font-size: 1rem;
            opacity: 0.9;
        }
        
        .mock-body {
            padding: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--text-dark);
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-light);
        }
        
        .form-control, .form-select, .form-textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 1rem;
        }
        
        .form-control {
            padding-left: 45px;
        }
        
        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px 12px;
            padding-right: 45px;
        }
        
        .form-control:focus, .form-select:focus, .form-textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
            outline: none;
        }
        
        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .btn-mock {
            display: inline-block;
            padding: 12px 25px;
            background: var(--warning);
            color: var(--text-dark);
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            font-size: 1.1rem;
        }
        
        .btn-mock:hover {
            background: #f7bc2d;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(249, 199, 79, 0.3);
        }
        
        /* Drill Type Options */
        .drill-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 10px;
        }
        
        .drill-option {
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .drill-option:hover {
            border-color: var(--warning);
            background-color: var(--primary-light);
        }
        
        .drill-option.selected {
            border-color: var(--warning);
            background-color: rgba(249, 199, 79, 0.1);
        }
        
        .drill-option i {
            font-size: 2rem;
            margin-bottom: 10px;
            color: var(--warning);
        }
        
        .drill-option h4 {
            margin-bottom: 5px;
        }
        
        .drill-option p {
            font-size: 0.85rem;
            color: var(--text-light);
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
        }
        
        @media (max-width: 768px) {
            .top-bar {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }
            
            .drill-options {
                grid-template-columns: 1fr;
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
            
            .mock-body {
                padding: 20px;
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
            <a href="ConductDrill.jsp" class="menu-item">
                <i class="fas fa-bullhorn"></i>
                <span class="menu-text">Conduct Drills</span>
            </a>
            <a href="MockDrill.jsp" class="menu-item active">
                <i class="fas fa-running"></i>
                <span class="menu-text">Mock Drill</span>
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
                <h1>Conduct Mock Drill</h1>
                <p>Practice disaster preparedness without sending real alerts</p>
            </div>
            
            
        </div>
        
        <!-- Mock Drill Container -->
        <div class="mock-container">
            <div class="mock-header">
                <h1><i class="fas fa-running"></i> Mock Drill Setup</h1>
                <p>Configure your practice drill for training purposes</p>
            </div>
            
            <div class="mock-body">
                <form action="MockDrillServe" method="post" onsubmit="return validateForm();">
                	<input type="hidden" name="drill_type" value="mock" />
                    <div class="form-group">
					    <label for="disasterName">Disaster Name *</label>
					    <div class="input-with-icon">
					        <i class="fas fa-exclamation-triangle input-icon"></i>
					        <select id="disasterName" name="disasterName" class="form-select" required>
					            <option value="">--Select Disaster Name--</option>
					            <option value="Fire">Fire</option>
					            <option value="Earthquake">Earthquake</option>
					            <option value="Lockdown">Lockdown</option>
					            <option value="Evacuation">Evacuation</option>
					            <option value="Tsunami">Tsunami</option>
					        </select>
					    </div>
					</div>

                    
                    <div class="form-group">
                        <label>Select Batches *</label>
                        <div class="drill-options">
                            <div class="drill-option" onclick="toggleSelection(this)">
                                <i class="fas fa-users"></i>
                                <h4>Batch A</h4>
                                <p>24 Users</p>
                            </div>
                            <div class="drill-option" onclick="toggleSelection(this)">
                                <i class="fas fa-users"></i>
                                <h4>Batch B</h4>
                                <p>18 Users</p>
                            </div>
                            <div class="drill-option" onclick="toggleSelection(this)">
                                <i class="fas fa-users"></i>
                                <h4>Batch C</h4>
                                <p>15 Users</p>
                            </div>
                            <div class="drill-option" onclick="toggleSelection(this)">
                                <i class="fas fa-globe"></i>
                                <h4>All Batches</h4>
                                <p>57 Users</p>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="drillDate">Drill Date *</label>
                        <div class="input-with-icon">
                            <i class="fas fa-calendar-alt input-icon"></i>
                            <input type="date" id="drillDate" name="drillDate" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="drillTime">Drill Time *</label>
                        <div class="input-with-icon">
                            <i class="fas fa-clock input-icon"></i>
                            <input type="time" id="drillTime" name="drillTime" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="duration">Duration (minutes) *</label>
                        <div class="input-with-icon">
                            <i class="fas fa-hourglass-half input-icon"></i>
                            <input type="number" id="duration" name="duration" class="form-control" min="5" max="120" value="30" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="notes">Notes</label>
                        <textarea id="notes" name="notes" class="form-control form-textarea" rows="3" placeholder="Enter any instructions or notes for this mock drill..."></textarea>
                    </div>

                    <button type="submit" class="btn-mock">
                        <i class="fas fa-play-circle"></i> Start Mock Drill
                    </button>
                </form>
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
        
        function validateForm() {
            var drillType = document.getElementById("drillType").value.trim();
            var drillDate = document.getElementById("drillDate").value.trim();
            var drillTime = document.getElementById("drillTime").value.trim();
            var duration = document.getElementById("duration").value.trim();

            if (!drillType || !drillDate || !drillTime || !duration) {
                alert("Please fill all required fields.");
                return false;
            }
            
            // Check if at least one batch is selected
            var selectedBatches = document.querySelectorAll('.drill-option.selected');
            if (selectedBatches.length === 0) {
                alert("Please select at least one batch for the drill.");
                return false;
            }
            
            return true;
        }
        
        function toggleSelection(element) {
            element.classList.toggle('selected');
        }
        
        // Set minimum date to today
        var today = new Date().toISOString().split('T')[0];
        document.getElementById("drillDate").setAttribute('min', today);
    </script>
</body>
</html>