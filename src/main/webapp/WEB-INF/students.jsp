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
<title>My Students </title>
</head>
<body>
	<main>
		<section class="glass">
			<div class="dashboard">
				<div class="top">
					<h1>Education Connection</h1>
				</div>
				<div class="links">
					<div class="link">
						<a href="/home" class="links">Dashboard</a>
					</div>
					<div class="link">
						<a href="/schedule" class="links">Schedule</a>
					</div>
					<div class="link">
						<a href="/students" class="links active">My Students</a>
					</div>
					<div class="link">
						<a href="/grades" class="links">Grades</a>
					</div>
					<div class="link">
						<a href="/attendance" class="links">Attendance</a>
					</div>
					<div class="link">
						<a href="/logout" class="links">Logout</a>
					</div>
				</div>

			</div>
			<div class="main">
				<div class="greeting"></div>
				<div class="tablecont">
					<table class="table table-striped">
						<tr>
							<th>Name</th>
							<th>Birthday</th>
							<th>Actions</th>
						</tr>
						<c:forEach var="s" items="${students}">
							<tr>
								<td>${s.firstName} ${s.lastName}</td>
								<td>${s.birthday.month+1}/${s.birthday.date}/<c:if test="${s.birthday.year > 99}">${s.birthday.year-100 + 2000}</c:if><c:if test="${s.birthday.year < 100}">${s.birthday.year+1900}</c:if></td>
								<td><a href="/students/${s.id}/delete"> Delete </a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="bottomform">
					<h2>Add Student</h2>
					<form:form action="/students" method="post"
						modelAttribute="student">
						<div class="errors">
							<form:errors path="firstName" class="errors" />
							<form:errors path="lastName" class="errors" />
							<form:errors path="birthday" class="errors" />
						</div>
						<div class="inputs">
							<form:input type="hidden" path="user" value="${thisUser.getId() }" />
							<form:input path="firstName" placeholder="First Name" />
							<form:input path="lastName" placeholder="Last Name" />
							<form:input type="date" path="birthday" />
						</div>
						<input type="submit" value="Add" class="button" />
					</form:form>
				</div>
			</div>

		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>