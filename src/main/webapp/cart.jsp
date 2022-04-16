<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart Information</title>
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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<c:if test="${cart.getItems().size() > 0}">
		<div class="shopping-cart">
			<div class="px-4 px-lg-0">

				<div class="pb-5">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

								<!-- Shopping cart table -->
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col" class="border-0 bg-light">
													<div class="p-2 px-3">Product</div>
												</th>
												<th scope="col" class="border-0 bg-light">
													<div class="py-2">Price</div>
												</th>
												<th scope="col" class="border-0 bg-light">
													<div class="py-2">Number</div>
												</th>
												<th scope="col" class="border-0 bg-light">
													<div class="py-2">Delete</div>
												</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${cart.getItems()}" var="p">
												<tr>
													<th scope="row">
														<div class="p-2">
															<img src="${p.getSrc()}" alt="" width="70"
																class="img-fluid rounded shadow-sm">
															<div class="ml-2 d-inline-block align-middle">
																<h5 class="mb-0">
																	<a href="#" class="text-dark d-inline-block">${p.getName()}</a>
																</h5>
																<span class="text-muted font-weight-normal font-italic"></span>
															</div>
														</div>
													</th>
													<td class="align-middle"><strong>${p.getPrice()}</strong></td>
													<td class="align-middle"><strong>${p.getNumber()}</strong></td>
													<td class="align-middle"><a
														href="add-cart?id=${p.getId()}&action=delete"
														class="text-dark">
															<button type="button" class="btn btn-danger">Delete</button>
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- End -->
							</div>
						</div>

						<div
							class="row bg-primary rounded-pill px-4 py-3 font-weight-bold">PAYMENT</div>

						<div class="p-4">
							<ul class="list-unstyled mb-4">
								<c:set var="transportFee" scope="session" value="1" />
								<c:set var="vat" scope="session"
									value="${Math.round(cart.getMoney() * 10.0) / 100.0}" />
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Product money</strong><strong>${cart.getMoney()}
										$</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Transport fee</strong><strong>${transportFee}
										$</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">VAT</strong><strong>${vat} $</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Total payment</strong><strong>${Math.round((cart.getMoney() + transportFee + vat) * 100.0) / 100.0}
										$</strong></li>
							</ul>
							<div class="form-group">
								<h4 id="form-cart-error" class="text-warning text-center"
									style="display: none">
									<i class='fa fa-exclamation'></i> Invalid Information
								</h4>
								<form action="pay" method="post">
									<input name="customerEmail" id="email" type="email"
										class="form-control" placeholder="Customer email"> <input
										name="customerAddress" id="address" type="text"
										class="form-control" placeholder="Customer address"> <input
										name="customerPhone" id="phone" type="text"
										class="form-control" placeholder="Customer phone"> <input
										name="discount" type="text" class="form-control"
										placeholder="Discount code(if any)">
									<button onclick="validateFormCart()" type="button"
										id="btn-form-cart"
										class="btn btn-dark rounded-pill btn-block my-4">Buy
										Now</button>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${cart.getItems().size() == 0 || cart == null}">
		<h2 class="m-5 text-warning text-center">
			<i class='fa fa-exclamation'></i> No Product in Cart
		</h2>
	</c:if>
	<script type="text/javascript">
     	function validateFormCart() {
    		const email = document.querySelector("#email").value;
    		const address = document.querySelector("#address").value;
    		const phone = document.querySelector("#phone").value;
    	    const error = document.querySelector("#form-cart-error");
    		
    		if (email.trim() == "" || email == null || (!email.match("\\w+@\\w+\\.\\w+"))
    	    || address.trim() == "" || address == null || phone.trim() == "" || phone == null) {
    			error.style.display = "block";
    		} else {
    			document.querySelector("#btn-form-cart").setAttribute("type", "submit");
    	        error.style.display = "none";
    	    }
    	}
     </script>
</body>
</html>