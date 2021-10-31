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
<title> Attendance </title>
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
						<a href="/students" class="links">My Students</a>
					</div>
					<div class="link">
						<a href="/grades" class="links">Grades</a>
					</div>
					<div class="link">
						<a href="/attendance" class="links active">Attendance</a>
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
							<th>10/18/2021</th>
							<th>10/19/2021</th>
							<th>10/20/2021</th>
							<th>10/21/2021</th>
							<th>10/22/2021</th>
						</tr>
						<c:forEach var="s" items="${students}">
							<tr>
								<td> <span id="atten">${s.firstName} ${s.lastName}</span></td>
								<td> n/a </td>
								<td> n/a </td>
								<td> n/a </td>
								<td> n/a </td>
								<td> n/a </td>

							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="newEventModal">
			<form:form action="/attendance/${s.id}" method="post"
				modelAttribute="attendance">
				<div class="errors">
					<form:errors path="status" class="errors" />
					<form:errors path="date" class="errors" />
				</div>
				<div class="inputs">
					<form:input type="hidden" path="student" value="${s.id }" />
					<form:input path="status" placeholder="Here(h) or Absent(a)" />
					<form:input type="date" path="date" />
				</div>
				<input type="submit" value="Add" class="button" />
			</form:form>
			</div>
			<div id="modalBackDrop"></div>

		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script type="text/javascript" src="js/atten.js"></script>
</body>
</html>