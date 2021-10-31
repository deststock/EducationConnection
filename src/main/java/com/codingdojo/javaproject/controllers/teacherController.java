package com.codingdojo.javaproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.javaproject.models.Assignment;
import com.codingdojo.javaproject.models.Attendance;
import com.codingdojo.javaproject.models.Student;
import com.codingdojo.javaproject.models.User;
import com.codingdojo.javaproject.services.AssignmentService;
import com.codingdojo.javaproject.services.AttendanceService;
import com.codingdojo.javaproject.services.StudentService;
import com.codingdojo.javaproject.services.UserService;

@Controller
public class teacherController {
	@Autowired
	StudentService studentServ;
	@Autowired
	UserService userServ;
	@Autowired
	AssignmentService assignServ;
	@Autowired 
	AttendanceService attServ;

	
	// LOG IN OR REGISTER TEACHER 
	@RequestMapping("/") 
	public String index() {
		return "index.jsp";
	}
	
	// TEACHER DASHBOARD
	@RequestMapping("/dashboard")
	public String dashboard() {
		return "dashboard.jsp";
	}

	// ALL STUDENTS AND THEIR GRADES
	@RequestMapping("/grades")
	public String grades(HttpSession session, Model model, @ModelAttribute("student") Student student ) {
		Long userId = (Long) session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		List<Student> students = studentServ.myStudents(userId);
		model.addAttribute("students", students);
		return "allGrades.jsp";
	}

	// ONE STUDENTS GRADES AND ASSIGNMENTS PAGE
	@RequestMapping("/grades/{id}")
	public String studentGrades(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("assignment") Assignment assignment) {
		Long userId = (Long) session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		Student student = studentServ.findStudent(id);
		model.addAttribute("student", student);
		List<Assignment> assignments = assignServ.stuAssignments(id);
		model.addAttribute("assignments", assignments);
		Double avg = assignServ.average(id);
		model.addAttribute("avg", avg);
		return "studentGrades.jsp";
	}
	
	// ADD ASSIGNMENT TO A STUDENT METHOD 
	@RequestMapping(value="/grades/{id}", method = RequestMethod.POST)
	public String newAssignment(@Valid @ModelAttribute("assignment") Assignment assignment, BindingResult result, Model model, HttpSession session, @PathVariable("id") Long id){
		Long userId = (Long) session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		Student student = studentServ.findStudent(id);
		model.addAttribute("student", student);
		List<Assignment> assignments = assignServ.stuAssignments(id);
		model.addAttribute("assignments", assignments);
		if (result.hasErrors()){
			return "studentGrades.jsp";
		} else {
			assignServ.newAssignment(assignment);
			return "redirect:/grades/{id}";
		}
	}
	// ATTENDANCE
	@RequestMapping("/attendance")
	public String attendance(HttpSession session, Model model, @ModelAttribute("student") Student student, @ModelAttribute("attendance") Attendance attendance ) {
		Long userId = (Long) session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		List<Student> students = studentServ.myStudents(userId);
		model.addAttribute("students", students);
		List<Attendance> attens = attServ.allAttendance();
		model.addAttribute("attens", attens);
		return "attendance.jsp";
	}
	
	// ATTENDANCE METHOD 
	@RequestMapping(value="/attendance/{id}", method = RequestMethod.POST)
	public String takeAtten(@Valid @ModelAttribute("attendance") Attendance attendance, BindingResult result, Model model, HttpSession session, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		Student student = studentServ.findStudent(id);
		model.addAttribute("student", student);
		List<Attendance> attens = attServ.allAttendance();
		model.addAttribute("attens", attens);
		if (result.hasErrors()){
			return "attendance.jsp";
		} else {
			attServ.newAttendance(attendance);
			return "redirect:/attendance";
		}
	}
	
	// TEACHERS STUDENTS 
	@RequestMapping("/students")
	public String allStudents(HttpSession session, Model model, @ModelAttribute("student") Student student ) {
		Long userId = (Long) session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		List<Student> students = studentServ.myStudents(userId);
		model.addAttribute("students", students);
		return "students.jsp";
	}
	
	// ADD STUDENT TO TEACHER 
	@RequestMapping(value="/students", method=RequestMethod.POST) 
	public String newStudent(@Valid @ModelAttribute("student") Student student, BindingResult result, Model model, HttpSession session){
		Long userId = (Long) session.getAttribute("user_id");
		User thisUser = userServ.findOne(userId);
		model.addAttribute("thisUser", thisUser);
		List<Student> students = studentServ.myStudents(userId);
		model.addAttribute("students", students);
		if (result.hasErrors()){
			return "students.jsp";
		} else {
			studentServ.newStudent(student);
			return "redirect:/students";
		}
	}
	
	// DELETE STUDENT 
	@RequestMapping("/students/{id}/delete")
	public String deleteStudent(@PathVariable("id") Long id) {
		studentServ.deleteStudent(id);
		return "redirect:/students";
	}
	
	// DELETE A STUDENTS ASSIGNMENT 
	@RequestMapping("grades/{stuid}/assignments/{id}/delete")
	public String deleteAssignment(@PathVariable("id") Long id, @PathVariable("stuid") Long stuid) {
		assignServ.deleteAssignment(id);
		return "redirect:/grades/{stuid}";
	}
	
	// SCHEDULE 
	@RequestMapping("/schedule")
	public String schedule() {
		return "schedule.jsp";
	}
}
