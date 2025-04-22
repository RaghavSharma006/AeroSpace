<!DOCTYPE html>
<html>
<head>
  <title>Login / Signup - AeroBook</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-box {
      background-color: rgba(0, 0, 0, 0.4);
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 0 15px rgba(0,0,0,0.5);
      text-align: center;
    }

    .login-box h2 {
      margin-bottom: 25px;
    }

    .login-box input {
      width: 250px;
      padding: 10px;
      margin: 10px 0;
      border-radius: 8px;
      border: none;
    }

    .login-box button {
      padding: 10px 30px;
      background-color: #ffffff;
      color: #2c5364;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      font-weight: bold;
      margin-top: 15px;
    }

    .login-box button:hover {
      background-color: #ddd;
    }
  </style>
</head>
<body>

  <div class="login-box">
    <h2>Login or Sign Up</h2>
    <form action="LoginServlet" method="post">
      <input type="text" name="username" placeholder="Username" required><br>
      <input type="password" name="password" placeholder="Password" required><br>
      <button type="submit">Submit</button>
    </form>
  </div>

</body>
</html>
