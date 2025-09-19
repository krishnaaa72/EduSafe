<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Live Richter Scale</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .card {
        background-color: white;
        width: 100%;
        max-width: 600px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        overflow: hidden;
        text-align: center;
        padding: 20px;
    }

    .card h1 {
        color: #333;
        margin-bottom: 20px;
    }

    #chart-container {
        width: 100%;
    }

    .info {
        margin-top: 15px;
        font-size: 1.1em;
        color: #555;
        padding: 10px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }

    .alert {
        color: white !important;
        background-color: #f94144 !important;
        font-weight: bold;
    }

    #sosAlert {
        display: none;
        margin-top: 15px;
        padding: 15px;
        background-color: #f94144;
        color: white;
        font-size: 1.2em;
        font-weight: bold;
        border-radius: 6px;
    }

    #actionButtons {
        display: none;
        margin-top: 15px;
    }

    #actionButtons button {
        margin: 5px;
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        font-size: 1em;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    #safeButton {
        background-color: #4CAF50;
        color: white;
    }

    #helpButton {
        background-color: #f94144;
        color: white;
    }

    #safeButton:hover {
        background-color: #45a049;
    }

    #helpButton:hover {
        background-color: #d7373f;
    }
</style>
</head>
<body>

<div class="card">
    <h1>Live Richter Scale</h1>
    <div id="chart-container">
        <canvas id="richterChart"></canvas>
    </div>
    <div class="info" id="info">Waiting for data...</div>
    <div id="sosAlert">SOS ALERT!</div>
    <div id="actionButtons">
        <button id="safeButton">I'm Safe</button>
        <button id="helpButton">I Need Help</button>
    </div>
</div>

<script>
const ctx = document.getElementById('richterChart').getContext('2d');
const info = document.getElementById('info');
const sosAlert = document.getElementById('sosAlert');
const actionButtons = document.getElementById('actionButtons');

const data = {
    labels: [],
    datasets: [{
        label: 'Magnitude',
        data: [],
        backgroundColor: 'rgba(255, 99, 132, 0.7)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1,
        fill: false,
        tension: 0.2
    }]
};

const config = {
    type: 'line',
    data: data,
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                max: 10,
                title: {
                    display: true,
                    text: 'Magnitude'
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Time'
                }
            }
        }
    }
};

const richterChart = new Chart(ctx, config);

function fetchData() {
    const now = new Date().toLocaleTimeString();
    const magnitude = (Math.random() * 5 + 1).toFixed(1); // Random between 1.0 and 6.0

    if (data.labels.length > 10) {
        data.labels.shift();
        data.datasets[0].data.shift();
    }

    data.labels.push(now);
    data.datasets[0].data.push(magnitude);

    if (magnitude > 4) {
        info.textContent = ``;
        info.classList.remove('alert');
        sosAlert.style.display = 'block';
        actionButtons.style.display = 'block';
    } else {
        info.textContent = `Latest Magnitude: ${magnitude}`;
        info.classList.remove('alert');
        sosAlert.style.display = 'none';
        actionButtons.style.display = 'none';
    }

    richterChart.update();
}

setInterval(fetchData, 3000);
fetchData();

// Example handlers for buttons (you can expand these as needed)
document.getElementById('safeButton').addEventListener('click', () => {
    alert("You clicked 'I'm Safe'. Message sent!");
});

document.getElementById('helpButton').addEventListener('click', () => {
    alert("You clicked 'Help Me'. Assistance requested!");
});
</script>

</body>
</html>
