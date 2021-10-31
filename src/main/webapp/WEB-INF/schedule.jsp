<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Schedule</title>
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
						<a href="/schedule" class="links active">Schedule</a>
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
			<section class="container3">
				<div id="header">
					<button id="backButton">  </button>
					<div id="monthDisplay"></div>
					<button id="nextButton">  </button>
				</div>

				<div id="weekdays">
					<div>SUN</div>
					<div>MON</div>
					<div>TUE</div>
					<div>WED</div>
					<div>THUR</div>
					<div>FRI</div>
					<div>SAT</div>
				</div>
				<div id="calendar"></div>
			</section>
			</div>

			<div id="newEventModal">
				<h2>New Event</h2>

				<input id="eventTitleInput" placeholder="Event Title" />
				<div>
				<button id="saveButton">Save</button>
				<button id="cancelButton">Cancel</button>
				</div>
			</div>

			<div id="deleteEventModal">
				<h2>Event</h2>

				<p id="eventText"></p>
				<div>
				<button id="deleteButton">Delete</button>
				<button id="closeButton">Close</button>
				</div>
			</div>



			<div id="modalBackDrop"></div>
		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script type="text/javascript" src="/js/calendar.js"></script>
</body>
</html>