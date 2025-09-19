<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>SOS Alert - EduSafe</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f0f2f5;
      margin: 20px;
    }
    header {
      background: linear-gradient(135deg, #4361ee, #3a0ca3);
      color: #fff;
      padding: 15px;
      text-align: center;
      border-radius: 8px;
      margin-bottom: 20px;
    }
    h1 {
      margin: 0;
      font-size: 22px;
    }
    .card {
      background: #fff;
      border-radius: 10px;
      padding: 20px;
      max-width: 400px;
      margin: 0 auto;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    .card h2 {
      color: #3a0ca3;
      margin-top: 0;
    }
    select, button {
      width: 100%;
      padding: 10px;
      margin-top: 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 16px;
    }
    button {
      background: #f72585;
      color: #fff;
      cursor: pointer;
      border: none;
    }
    button:hover {
      background: #d61c70;
    }
  </style>
</head>
<body>

  <header>
    <h1>SOS Alert System</h1>
    <p>Send emergency messages during disasters</p>
  </header>

  <div class="card">
    <h2>Send SOS Alert</h2>
    <label for="disasterSelect">Select Disaster</label>
    <select id="disasterSelect">
      <option value="">-- Select Disaster --</option>
      <option value="earthquake">Earthquake</option>
      <option value="flood">Flood</option>
      <option value="cyclone">Cyclone</option>
      <option value="fire">Fire</option>
      <option value="tsunami">Tsunami</option>
      <!-- Add more disasters here or dynamically from your data -->
    </select>
    <button id="sendBtn">Send SMS with SOS Alert</button>
  </div>

  <script>
    const disasterSelect = document.getElementById('disasterSelect');
    const sendBtn = document.getElementById('sendBtn');

    sendBtn.addEventListener('click', () => {
      const disaster = disasterSelect.value;
      if (!disaster) {
        alert("Please select a disaster.");
        return;
      }
      // This is where you'd integrate with your SMS service or API
      alert(`SOS Alert Sms sending...`);
      // Example: sendSMS(disaster);
    });
  </script>

</body>
</html>
