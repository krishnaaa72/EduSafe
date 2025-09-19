<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edusafe</title>
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
      background: #f0f2f5;
      color: #333;
      line-height: 1.6;
      background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><rect width="100" height="100" fill="%23f8f9fa"/><path d="M0,0 L100,100 M100,0 L0,100" stroke="%23e9ecef" stroke-width="0.5"/></svg>');
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }
    
    header {
      background: var(--gradient-primary);
      color: white;
      padding: 20px;
      text-align: center;
      border-radius: 0 0 20px 20px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      margin-bottom: 30px;
    }
    
    .logo {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 15px;
      margin-bottom: 10px;
    }
    
    .logo-icon {
      font-size: 2.5rem;
      background: white;
      width: 60px;
      height: 60px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--primary);
    }
    
    h1 {
      font-size: 2.5rem;
      margin-bottom: 10px;
    }
    
    .disclaimer {
      background: white;
      border-radius: 15px;
      padding: 25px;
      margin-bottom: 30px;
      box-shadow: var(--card-shadow);
      border-left: 5px solid var(--warning);
    }
    
    .disclaimer h2 {
      color: var(--secondary);
      margin-bottom: 15px;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    
    .disclaimer-list {
      list-style: none;
    }
    
    .disclaimer-list li {
      padding: 10px 0;
      border-bottom: 1px solid #f1f1f1;
      display: flex;
      align-items: flex-start;
      gap: 10px;
    }
    
    .disclaimer-list li:last-child {
      border-bottom: none;
    }
    
    .disclaimer-icon {
      color: var(--accent);
      font-size: 1.2rem;
      margin-top: 3px;
    }
    
    .cartoon-section {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      gap: 20px;
      margin-bottom: 40px;
    }
    
    .cartoon-item {
      flex: 1;
      min-width: 250px;
      text-align: center;
      background: white;
      border-radius: 15px;
      padding: 20px;
      box-shadow: var(--card-shadow);
      transition: transform 0.3s ease;
    }
    
    .cartoon-item:hover {
      transform: translateY(-5px);
    }
    
    .cartoon-img {
      width: 120px;
      height: 120px;
      margin: 0 auto 15px;
      background: var(--gradient-success);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 3rem;
      color: white;
    }
    
    .access-cards {
      display: flex;
      justify-content: center;
      gap: 30px;
      flex-wrap: wrap;
      margin-bottom: 40px;
    }
    
    .access-card {
      background: white;
      border-radius: 15px;
      padding: 30px;
      width: 280px;
      text-align: center;
      box-shadow: var(--card-shadow);
      transition: all 0.3s ease;
      cursor: pointer;
      border: 3px solid transparent;
    }
    
    .access-card:hover {
      transform: translateY(-10px);
      box-shadow: var(--hover-shadow);
      border-color: var(--primary);
    }
    
    .access-card.user {
      border-top: 5px solid var(--success);
    }
    
    .access-card.admin {
      border-top: 5px solid var(--warning);
    }
    
    .access-card.super-admin {
      border-top: 5px solid var(--accent);
    }
    
    .access-icon {
      font-size: 3rem;
      margin-bottom: 20px;
    }
    
    .user .access-icon {
      color: var(--success);
    }
    
    .admin .access-icon {
      color: var(--warning);
    }
    
    .super-admin .access-icon {
      color: var(--accent);
    }
    
    .access-card h3 {
      margin-bottom: 15px;
      color: var(--secondary);
    }
    
    .access-card p {
      color: #666;
      margin-bottom: 20px;
    }
    
    .btn {
      display: inline-block;
      padding: 10px 20px;
      background: var(--gradient-primary);
      color: white;
      border-radius: 50px;
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    
    .btn:hover {
      transform: scale(1.05);
      box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
    }
    
    .contact-section {
      text-align: center;
      padding: 30px;
      background: white;
      border-radius: 15px;
      box-shadow: var(--card-shadow);
      margin-bottom: 30px;
    }
    
    .contact-section h2 {
      color: var(--secondary);
      margin-bottom: 20px;
    }
    
    .contact-buttons {
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
    }
    
    .contact-btn {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      padding: 12px 25px;
      background: var(--light);
      border-radius: 50px;
      text-decoration: none;
      color: var(--dark);
      font-weight: 600;
      transition: all 0.3s ease;
    }
    
    .contact-btn:hover {
      background: var(--gradient-primary);
      color: white;
      transform: translateY(-3px);
    }
    
    footer {
      text-align: center;
      padding: 20px;
      color: #666;
      border-top: 1px solid #eee;
    }
    
    @media (max-width: 768px) {
      .access-cards {
        flex-direction: column;
        align-items: center;
      }
      
      .cartoon-section {
        flex-direction: column;
      }
      
      h1 {
        font-size: 2rem;
      }
    }
  </style>
</head>
<body>
  <header>
    <div class="logo">
      <div class="logo-icon">
        <i class="fas fa-house-damage"></i>
      </div>
      <h1>EduSafe</h1>
    </div>
    <p>Be Prepared, Stay Safe!</p>
  </header>

  <div class="container">
    <div class="disclaimer">
      <h2><i class="fas fa-exclamation-triangle"></i> Important Disclaimer</h2>
      <ul class="disclaimer-list">
       
        <li>
          <span class="disclaimer-icon"><i class="fas fa-."></i></span>
          <span>This app is not a substitute for authorities. Always contact disaster management teams during crises.</span>
        </li>
        <li>
          <span class="disclaimer-icon"><i class="fas fa-."></i></span>
          <span>Safety tips here are for guidance. In emergencies, rely on official instructions and emergency services.</span>
        </li>
        
      </ul>
    </div>

    <div class="cartoon-section">
      <div class="cartoon-item">
        <div class="cartoon-img">
          <i class="fas fa-house-user"></i>
        </div>
        <h3>Safe Evacuation</h3>
        <p>Learn the safest ways to evacuate during different disaster scenarios</p>
      </div>
      <div class="cartoon-item">
        <div class="cartoon-img">
          <i class="fas fa-first-aid"></i>
        </div>
        <h3>Emergency Preparedness</h3>
        <p>Be ready with essential supplies and knowledge</p>
      </div>
      <div class="cartoon-item">
        <div class="cartoon-img">
          <i class="fas fa-bullhorn"></i>
        </div>
        <h3>Alert Systems</h3>
        <p>Understand how emergency alert systems work</p>
      </div>
    </div>

    <div class="access-cards">
      <div class="access-card user">
        <div class="access-icon">
          <i class="fas fa-user-graduate"></i>
        </div>
        <h3>Student Access</h3>
        <p>Access learning materials, videos, and interactive quizzes</p>
        <a href="Login.jsp" class="btn">Enter as Student</a>
      </div>
      
      <div class="access-card admin">
        <div class="access-icon">
          <i class="fas fa-user-tie"></i>
        </div>
        <h3>Admin Access</h3>
        <p>Manage content, users, and track progress</p>
        <a href="LoginUserAdmin.jsp" class="btn">Enter as Admin</a>
      </div>
      
      <div class="access-card super-admin">
        <div class="access-icon">
          <i class="fas fa-user-shield"></i>
        </div>
        <h3>Super Admin</h3>
        <p>Full system access and configuration</p>
        <a href="LoginSuparAdmin.jsp" class="btn">Enter as Super Admin</a>
      </div>
    </div>

    <div class="contact-section">
      <h2>Need Help? Contact Us</h2>
      <div class="contact-buttons">
        <a href="mailto:support@disasterprep.org" class="contact-btn">
          <i class="fas fa-envelope"></i> Email Us
        </a>
        <a href="tel:+18001234567" class="contact-btn">
          <i class="fas fa-phone"></i> Call Support
        </a>
        <a href="#" class="contact-btn">
          <i class="fas fa-comment-dots"></i> Live Chat
        </a>
      </div>
    </div>
  </div>

  <footer>
    <p>&copy; 2025 EduSafe. All rights reserved. All other trademarks and copyrights are the property of their respective holders</p>
  </footer>

  <script>
    // Simple animation for access cards
    document.querySelectorAll('.access-card').forEach(card => {
      card.addEventListener('mouseenter', () => {
        card.querySelector('.access-icon').style.transform = 'scale(1.2)';
      });
      
      card.addEventListener('mouseleave', () => {
        card.querySelector('.access-icon').style.transform = 'scale(1)';
      });
    });
    
    // Add click functionality to access cards
    document.querySelectorAll('.access-card').forEach(card => {
      card.addEventListener('click', function() {
        const role = this.classList[1]; // user, admin, or super-admin
        alert(Redirecting to ${role} portal...);
        // In a real application, this would redirect to the appropriate page
      });
    });
  </script>
</body>
</html>