<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <div class="form-container">
        <form action="AdminLogin" method="post">
            <h1>Admin Login</h1>
            <div class="inputbox">
                <input type="text" name="name" required>
                <label>Name</label>
            </div>
            <div class="inputbox">
                <input type="password" name="password" required>
                <label>Password</label>
            </div>
            <button>Log in</button>
        </form>
    </div>
</body>

</html>