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
<title>One Students Grades</title>
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
					<h2>${student.firstName}'s Grades</h2>
					<p>Average Grade: ${avg} </p>
				</div>
				<div class="tablecont">
					<table class="table table-striped">
						<tr>
							<th>Assignment</th>
							<th>Grade</th>
							<th>Actions</th>
						</tr>
						<!-- calculating average grade here  -->
						<c:set var="gradeTotal" value = "${0}"/>
						<c:forEach var="s" items="${assignments}">
						<c:set var="gradeTotal" value = "${gradeTotal + s.grade}"/>
							<tr>
								<td>${s.name} </td>
								<td id="grades"> ${s.grade} </td>
								<td><a href="/grades/${student.id}/assignments/${s.id}/delete"> Delete </a></td>
							</tr>
						</c:forEach>
					</table>
				</div>	
				<div class="bottomform">
					<h2>Add Assignment</h2>
					<form:form action="/grades/${student.id}" method="post"
						modelAttribute="assignment">
						<div class="errors">
							<form:errors path="name" class="errors" />
							<form:errors path="grade" class="errors" />
						</div>
						<div class="inputs">
							<form:input type="hidden" path="student" value="${student.getId()}" />
							<form:input path="name" placeholder="Name" />
							<form:input type="double" path="grade" placeholder="Grade" />
						</div>
						<input type="submit" value="Add" class="button" />
					</form:form>
				</div>
			</div>

		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script type="text/javascript" src="/js/average.js"></script>
</body>
</html>