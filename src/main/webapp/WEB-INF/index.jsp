<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Login & Registration</title>
</head>
<body>
	<main>
		<section class="glass">
				<div class="dashboard2">
					<div class="top">
						<h1>Education Connection</h1>
					</div>

				</div>
			<div class="container1">
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div class="title">
						<h1 class="login">Register</h1>
					</div>
					<div>	
					</div>
					<div>
						<form:input path="firstName" placeholder="First Name" />
					</div>
						<form:errors path="firstName" class="errors" /> <br/>
					<div>
						<form:input path="lastName" placeholder="Last Name" />
					</div>
						<form:errors path="lastName" class="errors" /> <br/>
					<div>
						<form:input path="email" placeholder="Email" />
					</div>
						<form:errors path="email" class="errors" /> <br/>
					<div>
						<form:password path="password" placeholder="Password" />
					</div>
						<form:errors path="password" class="errors" /> <br/>
					<div>
						<form:password path="confirm" placeholder="Confirm Password" />
					</div>
						<form:errors path="confirm" class="errors" /> <br/>
					<input type="submit" value="Register" class="button" />
				</form:form>

				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="title">
						<h1 class="login">Sign in</h1>
					</div>
					<div class="form-group">
						<form:input path="email" placeholder="Email" />
					</div>
						<form:errors path="email" class="errors" /> <br/>
					<div>
						<form:password path="password" placeholder="Password" />
					</div>
						<form:errors path="password" class="errors" /> <br/>
					<input type="submit" value="Login" class="button" />
				</form:form>
			</div>
		</section>
		<div class="circle1"></div>
	<div class="circle2"></div>
	</main>

</body>
</html>