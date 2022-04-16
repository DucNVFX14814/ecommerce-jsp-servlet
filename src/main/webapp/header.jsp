<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="jumbotron text-center header">
	<h1>My Website</h1>
	<p>something or banner...</p>
</header>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<a class="navbar-brand" href="home"> <img alt="Logo"
		src="image/logo.png" style="height: 48px; width: auto;">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home"><i
					class="fa fa-home" aria-hidden="true"></i>Home<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#"><i
					class="fa fa-product-hunt" aria-hidden="true"></i>Products</a></li>
			<li class="nav-item"><a class="nav-link" href="#footer"><i
					class="fa fa-link" aria-hidden="true"></i>About Us</a></li>
		</ul>

		<ul class="navbar-nav mr">
			<c:if test="${acc != null}">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-user" aria-hidden="true"></i>${acc.getName()}</a></li>
				<li class="nav-item"><a class="nav-link" href="logout"><i
						class="fa fa-sign-in" aria-hidden="true"></i>Log Out</a></li>
			</c:if>
			<c:if test="${acc == null}">
				<li class="nav-item"><a class="nav-link" href="login"><i
						class="fa fa-user" aria-hidden="true"></i>Log In</a></li>
				<li class="nav-item"><a class="nav-link" href="register"><i
						class="fa fa-sign-in" aria-hidden="true"></i>Register</a></li>
			</c:if>
			<li class="nav-item"><a class="nav-link" href="cart.jsp"><i
					class="fa fa-shopping-cart" aria-hidden="true"></i>Cart</a></li>
		</ul>
		<form action="search" method="post" class="form-inline my-2 my-lg-0">
			<input name="search" value="${text}" class="form-control mr-sm-2"
				type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				<i class="fa fa-search" aria-hidden="true"></i>
			</button>
		</form>
	</div>
</nav>