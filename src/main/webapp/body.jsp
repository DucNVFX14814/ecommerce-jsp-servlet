<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main class="container-fluid main">

	<div class="row">

		<div class="col-lg-2 col-md-3 col-sm-12 aside">
			<div class="card-header bg-primary text-white">
				<i class="fa fa-list"></i>Price Range
			</div>
			<ul class="list-group category_block">
				<li class="list-group-item ${param.end == 20 ? 'active' : ''}"><a
					style="color: black;" href="price-range?start=0&end=20">0$ -
						20$</a></li>
				<li class="list-group-item ${param.start == 20 ? 'active' : ''}"><a
					style="color: black;" href="price-range?start=20&end=40">20$ -
						40$</a></li>
				<li class="list-group-item ${param.start == 40 ? 'active' : ''}"><a
					style="color: black;" href="price-range?start=40&end=100">40$ -
						100$</a></li>
			</ul>
		</div>

		<div class="col-lg-10 col-md-9">
			<c:set var="page" scope="page"
				value="${param.page == null ? 1 : param.page}" />
			<c:set var="pageSize" scope="request" value="${12}" />
			<c:set var="listSize" scope="request" value="${listP.size()}" />
			<c:set var="pageNumber" scope="request"
				value="${Integer.valueOf(Math.ceil(listSize / pageSize))}" />
			<c:set var="begin" scope="request" value="${(page - 1) * pageSize}" />
			<c:set var="end" scope="request"
				value="${page * pageSize > listSize ? listSize - 1 : page * pageSize - 1}" />

<%-- 			<c:out value="${acc.getRole() }r"></c:out>
			<c:out value="${begin }b"></c:out>
			<c:out value="${end }e"></c:out>
			<c:out value="${page }p"></c:out>
			<c:out value="${pageSize }ps"></c:out>
			<c:out value="${listSize }ls"></c:out>
			<c:out value="${pageNumber }pn"></c:out> --%>
			
			<c:if test="${listSize > 0}">
				<div class="row">
					<c:forEach begin="${begin}" end="${end}" var="i">
						<div class="col-sm-6 col-lg-4 col-xl-3">
							<div class="card list_product">
								<a href="info-product?id=${listP.get(i).getId()}"
									title="View Product"><img class="card-img-top"
									src="${listP.get(i).getSrc()}" alt="Card image"></a>
								<div class="card-body">
									<h6 class="card-title show_txt">
										<a href="info-product?id=${listP.get(i).getId()}"
											title="View Product">${listP.get(i).getName()}</a>
									</h6>
									<p class="card-text show_txt">${listP.get(i).getDescription()}</p>
									<div class="row">
										<div class="col">
											<p class="btn btn-danger btn-block"
												style="cursor: not-allowed;">${listP.get(i).getPrice()}
												$</p>
										</div>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<c:if test="${pageNumber > 1}">
					<div class="d-flex justify-content-center">
						<ul class="pagination ">
							<c:forEach begin="1" end="${pageNumber}" var="i">
								<li class="page-item ${page == i ? 'active' : ''}"><a
									class="page-link"
									href="?page=${i}&start=${param.start}&end=${param.end}&search=${param.text}">${i}</a></li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
			</c:if>

			<c:if test="${listSize == 0}">
				<h2 class="m-5 text-warning text-center">
					<i class='fa fa-exclamation'></i> No Product
				</h2>
			</c:if>
		</div>

	</div>
</main>