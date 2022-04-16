<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Log In</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/login.css">
<!-- Tự động chuyển đến Home nếu đã đăng nhập trong session hiện tai -->
<!--   <script type="text/javascript">
	if(${isLoggedIn} === true) {
 		window.location.href="home";
	}
</script> -->
</head>
<body>

	<div id="form">
		<h1>Log In</h1>

		<span class="error" style="text-align: center;"> ${errorMess} </span> <br>

		<form action="login" method="post">
			<label for="email">Email Address</label> <input name="email"
				value="${email}" type="email" class="email-password" id="email"
				placeholder="Enter Email"> <br> <span id="email-error"
				class="error"></span> <br> <label for="password">Password</label>
			<input name="password" value="${password}" type="password"
				class="email-password" id="password" placeholder="Enter Password">
			<br> <span id="password-error" class="error"></span> <br>

			<div class="rem-for">
				<p>
					<input name="rememberMe" type="checkbox">Remember Me
				</p>
				<a href="#">Forgot Password?</a>
			</div>

			<div>
				<button type="button" class="btn-login" id="btn-login">Log
					In</button>
			</div>

			<div>
				<p>
					Don't have an account? <a href="register.jsp">Register</a>
				</p>
			</div>
		</form>
	</div>

	<script type="text/javascript" src="script/validate_login.js"></script>
</body>
</html>
