<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduSafe - Emergency Drill</title>
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
        
        
        /* Emergency Drill Container */
        .drill-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .drill-header {
            background: var(--danger);
            color: white;
            text-align: center;
            padding: 25px;
            position: relative;
        }
        
        .alert-icon {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 2rem;
            animation: pulse 1.5s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        .drill-header h1 {
            font-size: 1.8rem;
            margin-bottom: 10px;
        }
        
        .drill-header p {
            font-size: 1rem;
            opacity: 0.9;
        }
        
        .drill-body {
            padding: 30px;
        }
        
        .warning-box {
            background-color: #fff3f3;
            border-left: 4px solid var(--danger);
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 4px;
        }
        
        .warning-box h4 {
            color: var(--danger);
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            gap: 10px;
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
        
        .form-control, .form-select {
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
        
        .form-control:focus, .form-select:focus {
            border-color: var(--danger);
            box-shadow: 0 0 0 3px rgba(249, 65, 68, 0.15);
            outline: none;
        }
        
        /* Batch Selection */
        .batch-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 10px;
        }
        
        .batch-option {
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .batch-option:hover {
            border-color: var(--danger);
            background-color: #fff3f3;
        }
        
        .batch-option.selected {
            border-color: var(--danger);
            background-color: rgba(249, 65, 68, 0.1);
        }
        
        .batch-option i {
            font-size: 2rem;
            margin-bottom: 10px;
            color: var(--danger);
        }
        
        .batch-option h4 {
            margin-bottom: 5px;
        }
        
        .batch-option p {
            font-size: 0.85rem;
            color: var(--text-light);
        }
        
        .btn-emergency {
            display: inline-block;
            padding: 15px 25px;
            background: var(--danger);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            font-size: 1.1rem;
            margin-top: 15px;
        }
        
        .btn-emergency:hover {
            background: #e02d30;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(249, 65, 68, 0.3);
        }
        
        /* Confirmation Modal */
        .confirmation-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 2000;
            justify-content: center;
            align-items: center;
        }
        
        .modal-content {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            max-width: 500px;
            width: 90%;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .modal-icon {
            font-size: 3rem;
            color: var(--danger);
            margin-bottom: 20px;
        }
        
        .modal-buttons {
            display: flex;
            gap: 15px;
            margin-top: 25px;
        }
        
        .modal-btn {
            flex: 1;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .modal-confirm {
            background: var(--danger);
            color: white;
            border: none;
        }
        
        .modal-cancel {
            background: var(--light-bg);
            color: var(--text-dark);
            border: 1px solid var(--border-color);
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
            
            .batch-options {
                grid-template-columns: 1fr;
            }
            
            .modal-buttons {
                flex-direction: column;
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
            
            .drill-body {
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
            <a href="EmergencyDrill.jsp" class="menu-item active">
                <i class="fas fa-exclamation-triangle"></i>
                <span class="menu-text">Emergency Drill</span>
            </a>
            <a href="BatchDevition.jsp" class="menu-item">
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
                <h1>Emergency Drill</h1>
                <p>Initiate real emergency alerts and safety measures</p>
            </div>
            
            
        </div>
        
        <!-- Emergency Drill Container -->
        <div class="drill-container">
            <div class="drill-header">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <h1><i class="fas fa-shield-alt"></i> Emergency Drill Activation</h1>
                <p>This will send real alerts to all selected users</p>
            </div>
            
            <div class="drill-body">
                <div class="warning-box">
                    <h4><i class="fas fa-exclamation-triangle"></i> Important Warning</h4>
                    <p>This emergency drill will send real-time alerts to all selected users. Only proceed if this is an actual emergency or authorized test.</p>
                </div>
                
                <form id="emergencyForm" action="EmergencyDrillServe" method="post">
                	<input type="hidden" name="drill_type" value="emergency" />
                    <div class="form-group">
                        <label for="disasterName">Emergency Type *</label>
                        <div class="input-with-icon">
                            <i class="fas fa-tools input-icon"></i>
                            <select class="form-select" id="disasterName" name="disasterName" required>
                                <option value="">Select emergency type</option>
                                <option value="Earthquake">Earthquake</option>
                                <option value="Flood">Flood</option>
                                <option value="Cyclone">Cyclone</option>
                                <option value="Tsunami">Tsunami</option>
                                <option value="Landslide">Landslide</option>
                                <option value="Fire">Fire</option>
                                <option value="Chemical Leak">Chemical Leak</option>
                                <option value="Heatwave">Heatwave</option>
                                <option value="Drought">Drought</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Select Batches to Alert *</label>
                        <div class="batch-options">
                            <div class="batch-option" onclick="toggleSelection(this)">
                                <i class="fas fa-users"></i>
                                <h4>Batch A</h4>
                                <p>24 Users</p>
                            </div>
                            <div class="batch-option" onclick="toggleSelection(this)">
                                <i class="fas fa-users"></i>
                                <h4>Batch B</h4>
                                <p>18 Users</p>
                            </div>
                            <div class="batch-option" onclick="toggleSelection(this)">
                                <i class="fas fa-users"></i>
                                <h4>Batch C</h4>
                                <p>15 Users</p>
                            </div>
                            <div class="batch-option" onclick="toggleSelection(this)">
                                <i class="fas fa-globe"></i>
                                <h4>All Batches</h4>
                                <p>57 Users</p>
                            </div>
                        </div>
                    </div>

                    <!-- Hidden fields -->
                    <input type="hidden" name="drillType" value="emergency">
		            <input type="hidden" name="drillDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
		            <input type="hidden" name="drillTime" value="<%= new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date()) %>">
		            <input type="hidden" name="notes" value="Emergency drill initiated">

                    <button type="button" class="btn-emergency" onclick="showConfirmation()">
                        <i class="fas fa-bullhorn"></i> Activate Emergency Drill
                    </button>
                </form>
            </div>
        </div>
    </div>

    <!-- Confirmation Modal -->
	<div class="confirmation-modal" id="confirmationModal">
	    <div class="modal-content">
	        <div class="modal-icon">
	            <i class="fas fa-exclamation-triangle"></i>
	        </div>
	        <h2>Confirm Emergency Drill</h2>
	        <p>Are you sure you want to activate the emergency drill? This will send real alerts to all selected users.</p>
	        <div class="modal-buttons">
	            <button class="modal-btn modal-cancel" onclick="hideConfirmation()">Cancel</button>
	            <button class="modal-btn modal-confirm" onclick="submitForm()">Confirm Activation</button>
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
        
        function toggleSelection(element) {
            element.classList.toggle('selected');
        }
        
        function showConfirmation() {
            // Validate form first
            const disasterName = document.getElementById('disasterName').value;
            const selectedBatches = document.querySelectorAll('.batch-option.selected');
            
            if (!disasterName) {
                alert('Please select an emergency type.');
                return;
            }
            
            if (selectedBatches.length === 0) {
                alert('Please select at least one batch to alert.');
                return;
            }
            
            document.getElementById('confirmationModal').style.display = 'flex';
        }
        
        function hideConfirmation() {
            document.getElementById('confirmationModal').style.display = 'none';
        }
        
        function submitForm() {
            document.getElementById('emergencyForm').submit();
        }
        
        // Add emergency type change handler to update hidden note field
        document.getElementById('disasterName').addEventListener('change', function() {
            document.getElementsByName('notes')[0].value = this.value + ' emergency drill initiated';
        });
        function submitForm() {
            const form = document.getElementById('emergencyForm');

            // Clear any previous batch inputs
            document.querySelectorAll('input[name="batches"]').forEach(e => e.remove());

            const selectedBatches = document.querySelectorAll('.batch-option.selected');
            if (selectedBatches.length === 0) {
                alert('Please select at least one batch to alert.');
                return;
            }

            selectedBatches.forEach(batch => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'batches';
                input.value = batch.querySelector('h4').textContent.trim();
                form.appendChild(input);
            });

            form.submit();
        }

    </script>
</body>
</html>