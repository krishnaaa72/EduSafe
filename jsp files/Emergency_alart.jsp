<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Emergency Alert - EduSafe</title>
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
            min-height: 100vh;
            overflow: hidden;
        }
        
        .chat-background {
            position: relative;
            height: 100vh;
            overflow: hidden;
            filter: blur(5px);
        }
        
        .chat-container {
            max-width: 800px;
            margin: 0 auto;
            height: 100vh;
            display: flex;
            flex-direction: column;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.7);
        }
        
        .chat-header {
            background: var(--primary);
            color: white;
            padding: 15px 20px;
            border-radius: 10px 10px 0 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
            background: white;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .message {
            max-width: 70%;
            padding: 12px 15px;
            border-radius: 18px;
            position: relative;
        }
        
        .message.received {
            align-self: flex-start;
            background: #f1f1f1;
            border-bottom-left-radius: 5px;
        }
        
        .message.sent {
            align-self: flex-end;
            background: var(--primary-light);
            color: var(--primary);
            border-bottom-right-radius: 5px;
        }
        
        .message-time {
            font-size: 0.7rem;
            color: var(--text-light);
            margin-top: 5px;
            text-align: right;
        }
        
        .chat-input {
            display: flex;
            padding: 15px;
            background: white;
            border-top: 1px solid var(--border-color);
        }
        
        .chat-input input {
            flex: 1;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            outline: none;
        }
        
        .chat-input button {
            background: var(--primary);
            color: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-left: 10px;
            cursor: pointer;
        }
        
        .emergency-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        
        .emergency-alert {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            width: 90%;
            max-width: 450px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            animation: alertPulse 2s infinite;
            text-align: center;
        }
        
        @keyframes alertPulse {
            0% { box-shadow: 0 10px 30px rgba(249, 65, 68, 0.3); }
            50% { box-shadow: 0 10px 30px rgba(249, 65, 68, 0.7); }
            100% { box-shadow: 0 10px 30px rgba(249, 65, 68, 0.3); }
        }
        
        .alert-header {
            background: var(--danger);
            color: white;
            padding: 25px;
        }
        
        .alert-icon {
            font-size: 3rem;
            margin-bottom: 15px;
            animation: pulse 1.5s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        .alert-header h2 {
            font-size: 1.8rem;
            margin-bottom: 10px;
        }
        
        .alert-body {
            padding: 30px;
        }
        
        .alert-body p {
            margin-bottom: 25px;
            color: var(--text-dark);
            font-size: 1.1rem;
        }
        
        .alert-buttons {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .alert-btn {
            padding: 15px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 1.1rem;
        }
        
        .btn-safe {
            background: var(--success);
            color: white;
        }
        
        .btn-help {
            background: var(--danger);
            color: white;
        }
        
        .alert-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn-safe:hover {
            background: #3bb5db;
        }
        
        .btn-help:hover {
            background: #e02d30;
        }
    </style>
</head>
<body>
    <div class="chat-background">
        <div class="chat-container">
            <div class="chat-header">
                <i class="fas fa-user-circle fa-2x"></i>
                <div>
                    <h3>Class Group Chat</h3>
                    <p>24 participants</p>
                </div>
            </div>
            <div class="chat-messages">
                <div class="message received">
                    <p>Has anyone started the assignment yet?</p>
                    <div class="message-time">10:05 AM</div>
                </div>
                <div class="message sent">
                    <p>I'm working on it now. The instructions are a bit confusing though.</p>
                    <div class="message-time">10:07 AM</div>
                </div>
                <div class="message received">
                    <p>Can someone explain question 3?</p>
                    <div class="message-time">10:12 AM</div>
                </div>
                <div class="message received">
                    <p>I think we need to use the formula from chapter 5</p>
                    <div class="message-time">10:15 AM</div>
                </div>
                <div class="message sent">
                    <p>Yes, that's what I thought too. Let me try that approach.</p>
                    <div class="message-time">10:17 AM</div>
                </div>
                <div class="message received">
                    <p>When is the assignment due again?</p>
                    <div class="message-time">10:20 AM</div>
                </div>
                <div class="message received">
                    <p>Next Friday I believe</p>
                    <div class="message-time">10:21 AM</div>
                </div>
            </div>
            <div class="chat-input">
                <input type="text" placeholder="Type a message...">
                <button><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>
    </div>
    
    <div class="emergency-overlay">
        <div class="emergency-alert">
            <div class="alert-header">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <h2>EMERGENCY DRILL ACTIVATED</h2>
            </div>
            <div class="alert-body">
                <p>An emergency drill is in progress. Please indicate your status:</p>
                <div class="alert-buttons">
                    <button class="alert-btn btn-safe">
                        <i class="fas fa-check-circle"></i> I AM SAFE
                    </button>
                    <button class="alert-btn btn-help">
                        <i class="fas fa-life-ring"></i> I NEED HELP
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.querySelectorAll('.alert-btn').forEach(button => {
            button.addEventListener('click', function() {
                if (this.classList.contains('btn-safe')) {
                    this.innerHTML = '<i class="fas fa-check-circle"></i> STATUS CONFIRMED - SAFE';
                    this.style.background = '#4CAF50';
                    setTimeout(() => {
                        alert('Your safe status has been recorded. Authorities have been notified.');
                        window.location.href = "SuperAdmin.jsp"; // Redirect after OK
                    }, 300);
                } else {
                    this.innerHTML = '<i class="fas fa-life-ring"></i> HELP REQUESTED';
                    this.style.background = '#FF9800';
                    setTimeout(() => {
                        alert('Help is on the way! Please remain in a safe location if possible.');
                        window.location.href = "Rescue_Mission_Tracking.jsp"; // Redirect after OK
                    }, 300);
                }
                document.querySelectorAll('.alert-btn').forEach(btn => {
                    btn.disabled = true;
                });
            });
        });

        setInterval(() => {
            const chatMessages = document.querySelector('.chat-messages');
            const newMessage = document.createElement('div');
            newMessage.classList.add('message');
            if (Math.random() > 0.5) {
                newMessage.classList.add('received');
                newMessage.innerHTML = '<p>Did you hear about the emergency drill?</p><div class="message-time">' +
                                      getCurrentTime() + '</div>';
            } else {
                newMessage.classList.add('sent');
                newMessage.innerHTML = '<p>Yes, I just responded to the alert</p><div class="message-time">' +
                                      getCurrentTime() + '</div>';
            }
            chatMessages.appendChild(newMessage);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }, 10000);

        function getCurrentTime() {
            const now = new Date();
            return now.getHours() + ':' + (now.getMinutes() < 10 ? '0' : '') + now.getMinutes();
        }
    </script>
</body>
</html>
