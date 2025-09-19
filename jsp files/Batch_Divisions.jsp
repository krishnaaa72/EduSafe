<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Batch Division - EduSafe</title>
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
    .row {
      display: flex;
      gap: 10px;
      align-items: center;
      flex-wrap: wrap;
      margin-bottom: 20px;
    }
    input[type="file"] {
      padding: 6px;
    }
    button {
      padding: 8px 14px;
      border-radius: 6px;
      border: 1px solid #ccc;
      background: #f72585;
      color: #fff;
      cursor: pointer;
    }
    button:hover {
      background: #d61c70;
    }
    .notice {
      background: #fff3cd;
      padding: 10px;
      border-radius: 6px;
      margin-bottom: 15px;
    }
    .back-btn {
      display: inline-block;
      margin-bottom: 15px;
      background: #4895ef;
      color: #fff;
      padding: 10px 15px;
      border-radius: 6px;
      text-decoration: none;
    }
    .batch-card {
      background: #fff;
      border-radius: 10px;
      padding: 15px;
      margin-bottom: 20px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .batch-card h2 {
      margin: 0 0 10px;
      color: #3a0ca3;
    }
    table {
      border-collapse: collapse;
      width: 100%;
      margin-top: 10px;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 6px;
      text-align: left;
    }
    th {
      background: #f8f9fa;
    }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js"></script>
</head>
<body>
  <a href="index.html" class="back-btn">⬅ Back to Home</a>

  <header>
    <h1>Batch Division Tool</h1>
    <p>Assign up to 10 students per teacher</p>
  </header>

  <div class="row">
    <label>Students (.xlsx): <input id="studentsFile" type="file" accept=".xlsx,.xls" /></label>
    <label>Teachers (.csv or .xlsx): <input id="teachersFile" type="file" accept=".csv,.xlsx,.xls" /></label>
    <button id="generateBtn">Generate Batches</button>
  </div>

  <div class="notice" id="status">Status: waiting for files...</div>

  <h3>Batches</h3>
  <div id="batches"></div>

  <script>
    const studentsInput = document.getElementById('studentsFile');
    const teachersInput = document.getElementById('teachersFile');
    const btn = document.getElementById('generateBtn');
    const status = document.getElementById('status');
    const batchesDiv = document.getElementById('batches');

    let students = [];
    let teachers = [];

    function readFile(file) {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onload = e => {
          const data = new Uint8Array(e.target.result);
          const wb = XLSX.read(data, { type: 'array' });
          const sheet = wb.Sheets[wb.SheetNames[0]];
          const json = XLSX.utils.sheet_to_json(sheet, { defval: '' });
          resolve(json);
        };
        reader.onerror = err => reject(err);
        reader.readAsArrayBuffer(file);
      });
    }

    studentsInput.addEventListener('change', async e => {
      const f = e.target.files[0];
      if (!f) return;
      status.textContent = "Reading students file...";
      students = await readFile(f);
      status.textContent = "Students loaded: " + students.length;
    });

    teachersInput.addEventListener('change', async e => {
      const f = e.target.files[0];
      if (!f) return;
      status.textContent = "Reading teachers file...";
      teachers = await readFile(f);
      status.textContent = "Teachers loaded: " + teachers.length;
    });

    function getField(obj, candidates, fallback="") {
      for (const key of Object.keys(obj)) {
        for (const c of candidates) {
          if (key.toLowerCase().includes(c.toLowerCase())) return obj[key];
        }
      }
      return fallback;
    }

    btn.addEventListener('click', () => {
      if (students.length === 0 || teachers.length === 0) {
        status.textContent = "Please load both files first.";
        return;
      }
      status.textContent = "Generating batches...";
      generateBatches();
      status.textContent = "Batches created successfully!";
    });

    function generateBatches() {
      batchesDiv.innerHTML = '';
      let batchNumber = 1;
      let studentIndex = 0;

      for (let i = 0; i < teachers.length; i++) {
        const teacherName = getField(teachers[i], ["name", "teacher"], "Teacher " + (i+1));
        const batchStudents = students.slice(studentIndex, studentIndex + 10);
        if (batchStudents.length === 0) break;

        renderBatch(batchNumber, teacherName, batchStudents);
        batchNumber++;
        studentIndex += 10;
      }

      if (studentIndex < students.length) {
        renderBatch(batchNumber, "No Teacher Assigned", students.slice(studentIndex));
      }
    }

    function renderBatch(batchNumber, teacherName, batchStudents) {
      const card = document.createElement('div');
      card.className = "batch-card";
      card.innerHTML = "<h2>Batch " + batchNumber + "</h2><p><strong>Teacher:</strong> " + teacherName + "</p>";

      let html = "<table><thead><tr><th>ID</th><th>Name</th><th>Father Name</th><th>Student Phone</th><th>Parent Phone No.</th><th>Address</th></tr></thead><tbody>";

      batchStudents.forEach(st => {
        html += "<tr>" +
          "<td>" + getField(st, ["id","roll","student_id","sr no","srno"], "") + "</td>" +
          "<td>" + getField(st, ["name","student","full name"], "") + "</td>" +
          "<td>" + getField(st, ["father","parent name","guardian"], "N/A") + "</td>" +
          "<td>" + getField(st, ["student_phone","student phone","student no","contact"], "N/A") + "</td>" +
          "<td>" + getField(st, ["parent_phone","parent phone","parent no","parents number","parent_mobile","guardian phone","contact","mobile"], "N/A") + "</td>" +
          "<td>" + getField(st, ["address","home","residence","location"], "N/A") + "</td>" +
          "</tr>";
      });

      html += "</tbody></table>";
      card.innerHTML += html;
      batchesDiv.appendChild(card);
    }
  </script>
</body>
</html>
