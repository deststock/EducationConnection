<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>All Grades</title>
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
						<a href="/grades" class="links active">Grades</a>
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
				<div class="greeting">
					<h2>All Grades</h2>
				</div>
				<div class="tablecont">
					<table class="table table-striped">
						<tr>
							<th>Name</th>
							<th>Average Grade</th>
						</tr>
						<c:forEach var="s" items="${students}">
							<tr>
								<td><a href="/grades/${s.id}" class="namelink">${s.firstName} ${s.lastName}</a></td>
								<td>help</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>

		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
</body>
</html>