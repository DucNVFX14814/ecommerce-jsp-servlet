<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Information</title>
<meta charset="ISO-8859-1">
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
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
.img-big-wrap img {
	height: auto;
	width: 100%;
	display: inline-block;
	cursor: zoom-in;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="card">
			<h3 class="title my-3 mx-auto">${product.name}</h3>
			<hr>
			<div class="row">
				<aside class="col-md-6 border-right">
					<div class="img-big-wrap w-80 mx-auto my-3">
						<a href="#"><img src="${product.src}"></a>
					</div>
				</aside>
				<aside class="col-md-6">
					<article class="card-body p-3">


						<p class="price-detail-wrap">
							<span class="price h3 text-warning"> <span
								class="currency">$</span><span class="num">${product.price}</span>
							</span>
						</p>

						<dl class="item-property">
							<dt>Description</dt>
							<dd>
								<p>${product.description}</p>
							</dd>
						</dl>

						<hr>
						<a href="add-cart?id=${product.id}&action=add"
							class="btn btn-lg btn-outline-primary text-uppercase"> <i
							class="fa fa-shopping-cart"></i> Add to cart
						</a>
					</article>
				</aside>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
