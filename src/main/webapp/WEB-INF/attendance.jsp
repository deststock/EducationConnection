<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Attendance</title>
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
						<c:forEach var="s" items="${students}">
							<tr>
								<td>${s.firstName} ${s.lastName}</td>

								<c:forEach var="a" items="${s.getAttendances()}">
									<td><c:if test="${a.status  == 'h'}">
											<span class="here">${a.date.month+1}/${a.date.date}</span>
										</c:if> <c:if test="${a.status  == 'a'}">
											<span class="absent">${a.date.month+1}/${a.date.date}</span>
										</c:if></td>
								</c:forEach>

							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="" class="bottomform">
					<h2>Add Attendance Record</h2>

					<form:form action="/attendance" method="post"
						modelAttribute="attendance">
						<div class="errors">
							<form:errors path="status" class="errors" />
							<form:errors path="date" class="errors" />
						</div>
						<div class="inputs">
							<form:select path="student" value="${s}">
								<c:forEach var="s" items="${students}">
									<form:option path="student" value="${s}" onchange="">${s.firstName } </form:option>
								</c:forEach>
							</form:select>
							<%-- <form:input type="hidden" path="student" value="${s.id}" /> --%>
							<form:input path="status" placeholder="Here(h) or Absent(a)" />
							<form:input type="date" path="date" placeholder="" />
						</div>
						<input type="submit" value="Add" class="button" />
					</form:form>
				</div>
			</div>
			<div id="modalBackDrop"></div>

		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<%! final static String DATE_FORMAT_NOW = "dd/MM/yy"; %>
	<%
	SimpleDateFormat df = new SimpleDateFormat(DATE_FORMAT_NOW);
	%>
	<!-- <script type="text/javascript" src="js/atten.js"></script> -->
</body>
</html>