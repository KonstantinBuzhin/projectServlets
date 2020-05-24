<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="/eStore/static/js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<!--end slider -->
<link rel="stylesheet" href="/eStore/static/styles/flexslider.css"
	type="text/css" media="screen" />
<script type="text/javascript">
	$(window).load(function() {
		$("#flexiselDemo").flexisel({
			visibleItems : 5,
			animationSpeed : 1000,
			autoPlay : true,
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
						<li><i class="user"></i> <a href="/eStore/LoginController" id="userName">${sessionScope.currentUserName}</a></li>
						<li><i class="cart"></i> <a href="/eStore/CartController">Shopping Cart</a></li>
						<span id='cartQnt' class="last">${sessionScope.CART_VALUE}</span>
						<c:if test="${sessionScope.keyUser != null}">
								<div style='float: left;'>
								<input type="button" class='botton' onclick='logOut(this)' id="loginOut" value="LOG OUT">|
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
		<!-- start login -->
		<section id="main">
			<div class="login-content">
				<div class="pag-nav">
					<ul class="p-list">
						<li><a href="/eStore">Home</a></li> &nbsp;&nbsp;/&nbsp;
						<li class="act">&nbsp;Register</li>
					</ul>
				</div>


				<div class="login-signup-form">


					<form action="index.jsp" method="post">

						<input type='hidden' name='currentSession'
							value="${param['currentSession']}" /> <input type="hidden"
							name="currentName" value="${param['currentName']}" /><br>
						<div class="botton1">
							<input type="submit" class="botton" value="Return">

						</div>
						<br>
					</form>


					<c:set var='registration' value="failt" />
					<c:if test="${param['login'] != null}">

						<c:set var="existError" value="false" />
						<c:set var="errorText" value="" />


						<c:if test="${fn:length(param['login'])== 0}">
							<c:set var="existError" value="true" />
							<c:set var="errorText" value="${errorText}<p>Empty Login</p>" />
						</c:if>

						<c:if test="${fn:length(param['name'])== 0}">
							<c:set var="existError" value="true" />
							<c:set var="errorText" value="${errorText}<p>Empty Name</p>" />
						</c:if>

						<c:if test="${fn:length(param['password'])== 0}">
							<c:set var="existError" value="true" />
							<c:set var="errorText" value="${errorText}<p>Empty Password</p>" />
						</c:if>

						<c:if test="${fn:length(param['repassword'])== 0}">
							<c:set var="existError" value="true" />
							<c:set var="errorText"
								value="${errorText}<p>Empty Re-Password</p>" />
						</c:if>

						<c:if test="${!param['re-password'] eq param['password']}">
							<c:set var="existError" value="true" />
							<c:set var="errorText"
								value="${errorText}<p>Passwords aren`t equals</p>" />
						</c:if>

						<c:if test="${param['gender']== null}">
							<c:set var="existError" value="true" />
							<c:set var="errorText"
								value="${errorText}<p>Choose your gender</p>" />
						</c:if>

						<c:if test="${param['address'] eq 'Choose'}">
							<c:set var="existError" value="true" />
							<c:set var="errorText"
								value="${errorText}<p>Choose your address</p>" />
						</c:if>

						<c:if test="${fn:length(param['comments'])== 0}">
							<c:set var="existError" value="true" />
							<c:set var="errorText" value="${errorText}<p>Empty Comments</p>" />
						</c:if>

						<c:if test="${param['amigo']== null}">
							<c:set var="existError" value="true" />
							<c:set var="errorText"
								value="${errorText}<p>Confirm installation AmigoBrowser</p>" />
						</c:if>

					<c:if test="${existError eq 'true'}">
							<center>
							<h4>Mistake(s)</h4>
						</center>
						<br>

					</c:if>


					<c:if test="${existError eq 'false'}">

						<c:set var='checkLogin' value="${currentDB.checkLogin}" />

						<c:if test="${checkLogin eq 'false'}">


							<c:set var='registration' value="${currentDB.registration}" />

							<br>Successful registration!<br>

						</c:if>

						<c:if test="${checkLogin eq 'true'}">
							<script>
								alert('This e-mail exists!');
							</script>
							<ul>Change this e-mail
							</ul>
						</c:if>

					</c:if>
					


					<c:if test="${!(registration eq 'success')}">

						<form action='' method='post'>

							<div class="cus_info_wrap">

								<label class="labelTop">Login(e-mail)</label> <input type='text'
									, name='login' required='required'
									pattern="[A-Za-z]{2,}@[A-Za-z]{2,}\.[A-Za-z]{2,}"
									value="${param['login']}" />

							</div>

							<div class="cus_info_wrap">
								<label class="labelTop">Name</label> <input type='text'
									, name='name' value="${param['name']}" />
							</div>

							<div class="cus_info_wrap">
								<label class="labelTop">Password</label> <input type='password'
									, name='password'
									pattern="(?=.*[0-9])(?=.*[A-Z]{2,})[0-9a-zA-Z]{8,}" />
							</div>

							<div class="cus_info_wrap">
								<label class="labelTop">Re-Password</label> <input
									type='password' , name='repassword' />
							</div>

							<div class="cus_info_wrap">
								<label class="labelTop">Age(12-100)</label> <input type='number'
									, name='age' min="12" max="100" value="${param['age']}" />

							</div>

							<div class="cus_info_wrap">
								<label class="labelTop">Gender</label> F<input type='radio'
									, name='gender' value='F'
									${((param['gender']!=null)&&(param['gender'] eq 'F')) ? 'checked' : ''} /><br>
								M<input type='radio' , name='gender' value='M'
									${((param['gender']!=null)&&(param['gender'] eq 'M')) ? 'checked' : ''} /><br>

							</div>

							<div class="cus_info_wrap">
								<label class="labelTop">Address</label> <select name='address'>
									<option>Choose</option>
									<option value='DNR'
										${((param['address']!=null)&&(param['address'] eq 'DNR')) ? 'selected' : ''}>DNR</option>
									<option value='LNR'
										${((param['address']!=null)&&(param['address'] eq 'LNR')) ? 'selected' : ''}>LNR</option>
									<option value='Crimea'
										${((param['address']!=null)&&(param['address'] eq 'Crimea')) ? 'selected' : ''}>Crimea</option>
								</select>

							</div>

							<div class="cus_info_wrap">
								<label class="labelTop">Comments</label>
								<textarea name='comments' cols='20' rows='10'>${param['comments']}</textarea>
							</div>



							<div class="cus_info_wrap">
								<label class="labelTop">Amigo</label> <input type='checkbox'
									, name='amigo' ${((param['amigo']!=null)) ? 'checked' : ''} />
							</div>








							<input type='hidden' name='currentSession'
								value="${param['currentSession']}" /> <input type="hidden"
								name="currentName" value="${param['currentName']}" />

							<div class="clearfix"></div>

							<div class="botton1">
								<input type="submit" class="botton" value="Enter">

							</div>
					</c:if>
					</c:if>
					



					<div class="col-md-2 benefits">
						<c:if test="${existError eq 'true'}">
							<h4>Mistake(s)</h4>
							${errorText}
						</c:if>


					</div>



					<div class="clearfix"></div>
				</div>
			</div>
	</div>
	</section>
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

		function logOut(input) {
			$.ajax({
				url : 'LoginController',
				type : 'post',
				data : {
					loginOut : "loginOut",
				},
				success : function(data) { // вешаем свой обработчик на функцию success
					document.getElementById('userName').innerHTML = "";
					if(input.value == "LOG OUT"){
					input.value = "Sign In";
					}else{
						window.location.href = '/eStore/LoginController';
					}
				}
			})
		}
		

	</script>
</body>
</html>