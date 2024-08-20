<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <div class="form-container">
        <form action="Register" method="post">
            <h1>Signup</h1>
            <div class="inputbox">
                <input type="text" name="name" required>
                <label>Name</label>
            </div>
            <div class="inputbox">
                <input type="email" name="email" required>
                <label>Email</label>
            </div>
            <div class="inputbox">
                <input type="password" name="password" required>
                <label>Password</label>
            </div>
            <button>Sign Up</button>
            <div class="register">
                <p>Already have a account? <a href="login.jsp">Login</a></p>
            </div>
        </form>
    </div>
</body>

</html>