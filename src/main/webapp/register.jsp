<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

	<div id="form">
		<h1>Register</h1>

		<span class="error" style="text-align: center; font-size: 16px;">
			${errorMess} </span> <br>

		<form action="register" method="post">

			<input name="username" type="text" class="email-password"
				id="user-name" placeholder="Enter User Name"> <br> <span
				id="username-error" class="error"></span> <br> <input
				name="email" type="email" class="email-password" id="email"
				placeholder="Enter Email"> <br> <span id="email-error"
				class="error"></span> <br> <input name="password"
				type="password" class="email-password" id="password"
				placeholder="Enter Password"> <br> <span
				id="password-error" class="error"></span> <br> <input
				name="repeat-password" type="password" class="email-password"
				id="repeat-password" placeholder="Enter Repeat Password"> <br>
			<span id="repeat-password-error" class="error"></span> <br> <input
				name="address" type="text" class="email-password" id="address"
				placeholder="Enter Address"> <br> <span
				id="address-error" class="error"></span> <br> <input
				name="phone" type="text" class="email-password" id="phone"
				placeholder="Enter Phone"> <br> <span id="phone-error"
				class="error"></span> <br>
			<div>
				<button type="button" class="btn-login" id="btn-register">Register</button>
			</div>

			<div>
				<p>
					Have an account? <a href="login.jsp">Log in</a>
				</p>
			</div>
		</form>
	</div>

	<script type="text/javascript" src="script/validate_register.js"></script>
</body>
</html>
