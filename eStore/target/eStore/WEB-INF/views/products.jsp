<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='/eStore/static/js/jquery-3.5.0.js'></script>

<!DOCTYPE html>
<html>
<script src='/eStore/static/js/jquery-3.5.0.js'></script>
<head>
<title>CoffeeShop</title>
<link href="/eStore/static/styles/bootstrap.css" rel='stylesheet'
	type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/eStore/static/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="/eStore/static/styles/style.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="BOX SHOP Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	

	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 











</script>

<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="/eStore/static/styles/megamenu.css" rel="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="/eStore/static/js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<!-- start slider -->
<!--end slider -->
<link rel="stylesheet" href="/eStore/static/styles/flexslider.css"
	type="text/css" media="screen" />
<script type="text/javascript">
	$(window).load(function() {
		$("#flexiselDemo").flexisel({
			visibleItems : 5,
			animationSpeed : 1000,
			autoPlay : false,
			autoPlaySpeed : 3000,
			pauseOnHover : true,
			enableResponsiveBreakpoints : true,
			responsiveBreakpoints : {
				portrait : {
					changePoint : 480,
					visibleItems : 1
				},
				landscape : {
					changePoint : 640,
					visibleItems : 2
				},
				tablet : {
					changePoint : 768,
					visibleItems : 3
				}
			}
		});

	});
</script>
<script type="text/javascript"
	src="/eStore/static/js/jquery.flexisel.js"></script>
</head>
<body>
	<!-- header-section-starts -->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a href="#">24x7 Customer Care </a></li> |
						<li><a href="order.html"> Track Order</a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li><i class="user"></i> <a href="account.html" id="userName">${sessionScope.currentUserName}</a></li>
						<li><i class="cart"></i> <a href="/eStore/CartController">Shopping
								Cart</a></li>
						<span id='cartQnt' class="last"> <c:if
								test="${sessionScope.CART_VALUE != null}">${sessionScope.CART_VALUE}</c:if>
							<c:if test="${sessionScope.CART_VALUE == null}">0</c:if></span>
						<c:if test="${sessionScope.keyUser != null}">
							<div style='float: left;'>
								<input type="button" class='botton' onclick='logOut(this)'
									id="loginOut" value="LOG OUT">|
								</li>
							</div>

						</c:if>
						<c:if test="${sessionScope.keyUser == null}">
							<form style='float: left;' action='LoginController' method='post'>
								<input type='submit' class='botton' value='Sign In'>|
								</li>
							</form>
						</c:if>
						<form style='float: left;' action='/eStore/RegisterController'
							method='post'>
							<input type='hidden' name='currentSession'
								value="${param['currentSession']}" /> <input type='hidden'
								name='currentName' value="${param['currentName']}" />
							<li class='login'><input type='submit' class='botton'
								value='Sign Up'></li>
						</form>
					</ul>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="wrap">
			<div class="header-bottom">
				<div class="logo">
					<a href="/eStore"><img width='50px' height='50px'
						src="/eStore/static/images/logo.jpg" class="img-responsive" alt="" /></a>
				</div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<div class="wrap">
		<div class="navigation-strip">
			<h4>
				Most Popular<i class="arrow"></i>
			</h4>
			<div class="top-menu">
				<!-- start header menu -->
				<ul class="megamenu skyblue">

					<li><a class="color4" href="/eStore/ProductController">Products</a>

						<div class="megapanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>shop</h4>
										<ul>
											<li><a href="/eStore/ProductController">new arrivals</a></li>
											<li><a href="/eStore/ProductController">accessories</a></li>
											<li><a href="/eStore/ProductController">brands</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>help</h4>
										<ul>
											<li><a href="/eStore/ProductController">trends</a></li>
											<li><a href="/eStore/ProductController">contacts</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>account</h4>
										<ul>
											<li><a href="/eStore/LoginController">login</a></li>
											<li><a href="/eStore/RegisterController">create an
													account</a></li>
											<li><a href="/eStore/LoginController">my shopping
													bag</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col2"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
							</div>
						</div></li>


					<li><a class="color1"
						href="/eStore/ProductController?category=coffee">coffee in the
							bean</a>
						<div class="megapanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>shop</h4>
										<ul>
											<li><a href="/eStore/ProductController">new arrivals</a></li>
											<li><a href="/eStore/ProductController">accessories</a></li>
											<li><a href="/eStore/ProductController">brands</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>help</h4>
										<ul>
											<li><a href="/eStore/ProductController">trends</a></li>
											<li><a href="/eStore/ProductController">contacts</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>account</h4>
										<ul>
											<li><a href="/eStore/LoginController">login</a></li>
											<li><a href="/eStore/RegisterController">create an
													account</a></li>
											<li><a href="/eStore/LoginController">my shopping
													bag</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col2"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
							</div>
						</div></li>
					<li class="grid"><a class="color2"
						href="/eStore/ProductController?category=grinders">grinders</a>
						<div class="megapanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>shop</h4>
										<ul>
											<li><a href="/eStore/ProductController">new arrivals</a></li>
											<li><a href="/eStore/ProductController">accessories</a></li>
											<li><a href="/eStore/ProductController">brands</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>help</h4>
										<ul>
											<li><a href="/eStore/ProductController">trends</a></li>
											<li><a href="/eStore/ProductController">contacts</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>account</h4>
										<ul>
											<li><a href="/eStore/LoginController">login</a></li>
											<li><a href="/eStore/RegisterController">create an
													account</a></li>
											<li><a href="/eStore/LoginController">my shopping
													bag</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col2"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
							</div>
						</div></li>
					<li class="grid"><a class="color3"
						href="/eStore/ProductController?category=machines">espresso
							machine</a>
						<div class="megapanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>shop</h4>
										<ul>
											<li><a href="/eStore/ProductController">new arrivals</a></li>
											<li><a href="/eStore/ProductController">accessories</a></li>
											<li><a href="/eStore/ProductController">brands</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>help</h4>
										<ul>
											<li><a href="/eStore/ProductController">trends</a></li>
											<li><a href="/eStore/ProductController">contacts</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>account</h4>
										<ul>
											<li><a href="/eStore/LoginController">login</a></li>
											<li><a href="/eStore/RegisterController">create an
													account</a></li>
											<li><a href="/eStore/LoginController">my shopping
													bag</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col2"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
							</div>
						</div></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="heading">
						<h3>Feature Products</h3>
					</div>

					<div class="clearfix"></div>
				</div>




				<ul class="products clearfix">


					<c:forEach items="${listProducts}" var="product">
						<li class="product-wrapper">

							<div class="product">
								<a href="/eStore/ProductController?id=${product.id}"><div
										class="product-photo">
										<img height="${imgHeight}"
											src="/eStore/static/images/${product.id}.jpg" alt="" />
									</div></a>
								<h2>${product.name}</h2>
								<c:if test="${product.lenghtName <= 24}">
									<br>
								</c:if>
								<p>${product.description}</p>
								<p>
									<br> <span class="price">${product.price}₴</span>
								</p>
								<br> <br> <img width='25px' height='25px'
									src="/eStore/static/images/minus.png"
									onclick='minus("${product.id}")' /> <input size='2'
									type='text' , id='${product.id}' value='1' /> <img
									width='25px' height='25px' src="/eStore/static/images/plus.png"
									onclick='plus("${product.id}")' /> <input style="float: left;"
									type='button' , value='Add to Cart'
									onclick="buyFunction('${product.id}')" /> <input type='button'
									value='Details' style="color: blue;"
									onclick="javascript:location.href='/eStore/ProductController?id=${product.id}'" />

							</div>

						</li>
					</c:forEach>



				</ul>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	</div>
	<div class="footer">
		<div class="wrap">
			<div class="footer-middle">
				<div class="col-md-6 about-text text-right">
					<h4>About CoffeeShop</h4>
					<p>We are the best!</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="cards text-center">
				<img src="/eStore/static/images/cards.jpg" alt="" />
			</div>
			<div class="copyright text-center">
				<p>Copyright &copy; 2020 All rights reserved | Template by
					ShitCoder</p>
			</div>

		</div>
	</div>

	<script>
		//document.write("something");
		function changeText() {
			var form1 = document.getElementById("form1");
			form1.innerHTML = "The new form";
		}

		function plus(id) {
			var qnt = document.getElementById(id);
			qnt.value = +qnt.value + 1;
		}
		function minus(id) {
			var qnt = document.getElementById(id);
			if (qnt.value > 1) {
				qnt.value = +qnt.value - 1;
			}
		}

		function getProductById(id) {
			$.ajax({
				url : 'ProductController',
				type : 'post',
				data : {
					idProduct : id,
				},
				success : function(data) { // вешаем свой обработчик на функцию success
					document.getElementById('cartQnt').innerHTML = data;
				}
			})
		}

		function buyFunction(id) {
			var qnt = document.getElementById(id).value;
			$.ajax({
				url : 'CartController',
				type : 'post',
				data : {
					productId : id,
					productQnt : qnt,
				},
				success : function(data) { // вешаем свой обработчик на функцию success
					document.getElementById('cartQnt').innerHTML = data;
				}
			})
		}

		function getCategory(category) {
			$.ajax({
				url : 'CartController',
				type : 'post',
				data : {
					category : category,
				},
				success : function(data) { // вешаем свой обработчик на функцию success
					document.getElementById('cartQnt').innerHTML = data;
				}
			})
		}

		function logOut(input) {
			$.ajax({
				url : 'LoginController',
				type : 'post',
				data : {
					loginOut : "loginOut",
				},
				success : function(data) { // вешаем свой обработчик на функцию success
					document.getElementById('userName').innerHTML = "";
					if (input.value == "LOG OUT") {
						input.value = "Sign In";
					} else {
						window.location.href = '/eStore/LoginController';
					}
				}
			})
		}
	</script>


</body>
</html>