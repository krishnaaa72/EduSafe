
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduSafe Unique Logo Design</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f0f4ff 0%, #e6e9ff 100%);
            color: #2c3e50;
            line-height: 1.6;
            padding: 20px;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        h1 {
            font-size: 2.8rem;
            color: #2c3e50;
            margin-bottom: 15px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        
        .subtitle {
            color: #5d7592;
            font-size: 1.3rem;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .logo-showcase {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 50px;
        }
        
        .main-logo {
            width: 220px;
            height: 220px;
            margin: 0 auto 25px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        
        .logo-badge {
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            box-shadow: 0 15px 35px rgba(67, 97, 238, 0.2);
            transition: all 0.4s ease;
        }
        
        .logo-badge:hover {
            transform: rotate(5deg) scale(1.05);
            box-shadow: 0 20px 40px rgba(67, 97, 238, 0.3);
        }
        
        .logo-badge::before {
            content: '';
            position: absolute;
            width: 240px;
            height: 240px;
            border: 2px dashed rgba(67, 97, 238, 0.3);
            border-radius: 50%;
            animation: rotate 30s linear infinite;
        }
        
        .logo-icon {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            z-index: 2;
        }
        
        .logo-icon i {
            font-size: 5rem;
            margin-bottom: 10px;
            text-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .logo-icon span {
            font-weight: 700;
            font-size: 1.2rem;
            letter-spacing: 2px;
        }
        
        .logo-name {
            text-align: center;
            margin-top: 20px;
        }
        
        .logo-text {
            font-size: 3.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #3a0ca3 0%, #4361ee 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 5px;
            letter-spacing: -1px;
        }
        
        .logo-tagline {
            color: #5d7592;
            font-size: 1.2rem;
            font-weight: 500;
            letter-spacing: 3px;
        }
        
        .logo-variations {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }
        
        .variation {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
            text-align: center;
            padding: 30px 20px;
        }
        
        .variation:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
        }
        
        .variation-logo {
            width: 120px;
            height: 120px;
            margin: 0 auto 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .var-1 {
            background: linear-gradient(135deg, #4361ee 0%, #4cc9f0 100%);
            border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
            color: white;
            font-size: 2.5rem;
        }
        
        .var-2 {
            background: linear-gradient(135deg, #7209b7 0%, #f72585 100%);
            clip-path: polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%);
            color: white;
            font-size: 2.5rem;
        }
        
        .var-3 {
            background: linear-gradient(135deg, #f9c74f 0%, #f8961e 100%);
            border-radius: 20px;
            color: white;
            font-size: 2.5rem;
            transform: rotate(45deg);
        }
        
        .var-3 i {
            transform: rotate(-45deg);
        }
        
        .var-4 {
            background: linear-gradient(135deg, #2a9d8f 0%, #264653 100%);
            border-radius: 40% 60% 60% 40% / 60% 30% 70% 40%;
            color: white;
            font-size: 2.5rem;
        }
        
        .variation-name {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        
        .variation-desc {
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        .logo-usage {
            text-align: center;
            margin: 60px 0 40px;
        }
        
        .usage-title {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 700;
        }
        
        .usage-examples {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }
        
        .example {
            width: 180px;
            height: 120px;
            border-radius: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-weight: 700;
            font-size: 1.1rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        
        .example-app {
            background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%);
        }
        
        .example-web {
            background: linear-gradient(135deg, #7209b7 0%, #f72585 100%);
        }
        
        .example-print {
            background: linear-gradient(135deg, #f9c74f 0%, #f8961e 100%);
        }
        
        .example-merch {
            background: linear-gradient(135deg, #2a9d8f 0%, #264653 100%);
        }
        
        .cta-section {
            text-align: center;
            margin-top: 50px;
        }
        
        .btn {
            display: inline-block;
            padding: 15px 40px;
            background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%);
            color: white;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            box-shadow: 0 10px 25px rgba(67, 97, 238, 0.3);
        }
        
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(67, 97, 238, 0.4);
        }
        
        footer {
            text-align: center;
            margin-top: 70px;
            color: #7f8c8d;
            font-size: 0.9rem;
            padding: 20px;
            border-top: 1px solid #eaeaea;
        }
        
        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        
        @media (max-width: 768px) {
            .logo-variations {
                grid-template-columns: 1fr;
            }
            
            .logo-text {
                font-size: 2.5rem;
            }
            
            h1 {
                font-size: 2.2rem;
            }
            
            .usage-examples {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
    <script>
    setTimeout(function() {
        window.location.href = "Startpage.jsp"; 
    }, 5000); 
</script>
    
</head>
<body>
    <div class="container">
        <header>
            
            <p class="subtitle">A distinctive emblem representing the fusion of education and safety</p>
        </header>
        
        <div class="logo-showcase">
            <div class="main-logo">
                <div class="logo-badge">
                    <div class="logo-icon">
                        <i class="fas fa-graduation-cap"></i>
                        <span>SAFE</span>
                    </div>
                </div>
            </div>
            
            <div class="logo-name">
                <div class="logo-text">EduSafe</div>
                <div class="logo-tagline">KNOWLEDGE • PROTECTION • GROWTH</div>
            </div>
        </div>
        
           <script>
        document.querySelectorAll('.variation-logo').forEach(logo => {
            logo.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.1)';
            });
            
            logo.addEventListener('mouseleave', function() {
                this.style.transform = '';
            });
        });

        setTimeout(function() {
            window.location.href = "Startpage.jsp"; L
        }, 5000);


        document.querySelectorAll('.variation-logo').forEach(logo => {
            logo.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.1)';
            });
            
            logo.addEventListener('mouseleave', function() {
                this.style.transform = '';
            });
        });
    </script>
</body>
</html>