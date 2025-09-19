<%@ page import="MASTER.DAO.DrillDao, MASTER.DTO.DrillDto, java.util.List" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>EduSafe - Drill Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
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
        
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 20px;
            transition: all 0.3s ease;
        }
        
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
        
        .drill-table-container {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            text-align: left;
        }
        
        th {
            background: var(--primary);
            color: white;
        }
        
        tr:hover {
            background: var(--primary-light);
        }
        
        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
            }
            .logo-text, .menu-text {
                display: none;
            }
            .main-content {
                margin-left: 70px;
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
            <a href="UserAdmin.jsp" class="menu-item"><i class="fas fa-home"></i><span class="menu-text">Dashboard</span></a>
            <a href="DrillDetails.jsp" class="menu-item active"><i class="fas fa-list"></i><span class="menu-text">Drill Details</span></a>
            <a href="Startpage.jsp" class="menu-item"><i class="fas fa-sign-out-alt"></i><span class="menu-text">Logout</span></a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="top-bar">
            <div class="greeting">
                <h1>Drill Details</h1>
                <p>View all drills recorded in the system</p>
            </div>
        </div>

        <div class="drill-table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Disaster Name</th>
                        <th>Notes</th>
                        <th>Created At</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DrillDao dao = new DrillDao();
                        List<DrillDto> drills = dao.getAllDrills();
                        for (DrillDto drill : drills) {
                    %>
                    <tr>
                        <td><%= drill.getId() %></td>
                        <td><%= drill.getDrillType() %></td>
                        <td><%= drill.getDrillDate() %></td>
                        <td><%= drill.getDrillTime() %></td>
                        <td><%= drill.getDisasterName() == null ? "N/A" : drill.getDisasterName() %></td>
                        <td><%= drill.getNotes() == null ? "N/A" : drill.getNotes() %></td>
                        <td><%= drill.getCreatedAt() %></td>
                    </tr>
                    <%
                        }
                        if (drills.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="7" style="text-align: center;">No drill records found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
