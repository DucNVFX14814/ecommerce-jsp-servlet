<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Manager</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
		<a class="navbar-brand"
			href="${pageContext.servletContext.contextPath}/home"> <img
			alt="Logo"
			src="${pageContext.servletContext.contextPath}/image/logo.png"
			style="height: 50px; width: auto;">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="admin.jsp"><i class="fa fa-adn" aria-hidden="true"></i>Admin<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-product-hunt" aria-hidden="true"></i>Products</a></li>
			</ul>
			<ul class="navbar-nav mr">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-user" aria-hidden="true"></i>${acc.getName()}</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.servletContext.contextPath}/logout"><i
						class="fa fa-sign-in" aria-hidden="true"></i>Log Out</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-shopping-cart" aria-hidden="true"></i>Cart</a></li>
			</ul>
		</div>
	</nav>

	<h2>Hello admin: ${acc.getName()}</h2>
</body>
</html>