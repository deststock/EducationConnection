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
<title>Education Connection Dashboard</title>
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
						<a href="/home" class="links active">Dashboard</a>
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
						<a href="/attendance" class="links">Attendance</a>
					</div>
					<div class="link">
						<a href="/logout" class="links">Logout</a>
					</div>
				</div>

			</div>
			<div class="main">
				<div class="greeting">
					<h2>
						<span id="hello"></span>, ${thisUser.firstName } ${thisUser.lastName }!
					</h2>
				</div>
				<div class="cards">
					<div class="card">
						<h3>
							The word of the day is <span id = "randWord"> </span>
						</h3>
							<div id="randGen" class="button"> Get New Word</div>
					</div>
					<div class="card">
						<h3>
							Today is <span id='date-time'></span>
						</h3>
						<div class="attendance">
							<p>It looks like you haven't taken attendance today...</p>
							<a href="/attendance" class="button">Take Attendance!</a>
						</div>
					</div>

				</div>
			</div>

		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>