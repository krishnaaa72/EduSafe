<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Safety Check</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 500px; margin-top: 80px; }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Check Your Safety Zone</h2>
        <form action="SafetyServe" method="get" target="_blank">
            <div class="mb-3">
                <label for="lat" class="form-label">Your Latitude *</label>
                <input type="text" class="form-control" id="lat" name="lat" placeholder="Enter latitude" required>
            </div>
            <div class="mb-3">
                <label for="lon" class="form-label">Your Longitude *</label>
                <input type="text" class="form-control" id="lon" name="lon" placeholder="Enter longitude" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Check Safety</button>
            </div>
        </form>
        <p class="text-muted text-center mt-3">Enter your location coordinates to find the nearest Green Zone.</p>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
