<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disaster Management Quiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .quiz-container {
            max-width: 800px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .question {
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="quiz-container">
        <h2 class="text-center mb-4">📝 Disaster Management Quiz</h2>
        <form action="SubmitQuiz.jsp" method="post">
            
            <!-- Q1 -->
            <div class="mb-4">
                <p class="question">1. What is the safest place to go during an earthquake?</p>
                <div>
                    <input type="radio" name="q1" value="a"> Under a strong table<br>
                    <input type="radio" name="q1" value="b"> Near windows<br>
                    <input type="radio" name="q1" value="c"> In an elevator<br>
                    <input type="radio" name="q1" value="d"> On the rooftop<br>
                </div>
            </div>

            <!-- Q2 -->
            <div class="mb-4">
                <p class="question">2. Which natural disaster is measured on the Richter scale?</p>
                <div>
                    <input type="radio" name="q2" value="a"> Floods<br>
                    <input type="radio" name="q2" value="b"> Earthquakes<br>
                    <input type="radio" name="q2" value="c"> Cyclones<br>
                    <input type="radio" name="q2" value="d"> Droughts<br>
                </div>
            </div>

            <!-- Q3 -->
            <div class="mb-4">
                <p class="question">3. What should you do if a fire breaks out in your building?</p>
                <div>
                    <input type="radio" name="q3" value="a"> Use the elevator<br>
                    <input type="radio" name="q3" value="b"> Call emergency services<br>
                    <input type="radio" name="q3" value="c"> Jump from the window<br>
                    <input type="radio" name="q3" value="d"> Hide under a bed<br>
                </div>
            </div>

            <!-- Q4 -->
            <div class="mb-4">
                <p class="question">4. What is the primary aim of disaster management?</p>
                <div>
                    <input type="radio" name="q4" value="a"> To increase panic<br>
                    <input type="radio" name="q4" value="b"> To reduce the impact of disasters<br>
                    <input type="radio" name="q4" value="c"> To predict exact disaster dates<br>
                    <input type="radio" name="q4" value="d"> To spend more money<br>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100">Submit Quiz</button>
        </form>
    </div>
</body>
</html>