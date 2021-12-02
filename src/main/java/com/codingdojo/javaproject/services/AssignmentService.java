package com.codingdojo.javaproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.javaproject.models.Assignment;
import com.codingdojo.javaproject.models.Attendance;
import com.codingdojo.javaproject.repositories.AssignmentRepository;
import com.codingdojo.javaproject.repositories.StudentRepository;

@Service
public class AssignmentService {
	@Autowired 
	AssignmentRepository assignmentRepo;
	@Autowired
	StudentRepository studentRepo;
	
	// RETURNS ALL ASSIGNMENTS 
	public List<Assignment> allAssignments(){
		List<Assignment> assignments = assignmentRepo.findAll();
		return assignments;
	}
	
	// RETURNS ONE STUDENTS ASSIGNMENTS 
	public List<Assignment> stuAssignments(Long id){
		List<Assignment> assignments = assignmentRepo.findAllByStudentId(id);
		return assignments;
	}
	
	// RETURNS ONE STUDENTS AVERAGE 
	public Double average(Long id) {
		List<Assignment>assignments = stuAssignments(id);
		Double sum = 0.0;
		for (int i=0; i<assignments.size(); i++) {
			Assignment assignment = assignments.get(i);
			sum = sum + assignment.getGrade();
		}
		Double avg = sum/assignments.size();
		avg = Math.floor(avg * 100)/100;
		return avg;
	}
	
	// CREATES AN ASSIGNMENT 
	public Assignment newAssignment(Assignment a) {
		return assignmentRepo.save(a);
	}
	
	// DELETES AN ASSIGNMENT 
	public void deleteAssignment(Long id) {
		assignmentRepo.deleteById(id);
	}
	
	// DELETE ALL FOR ONE STUDENT 
		public void deleteAll(Long id) {
			List<Assignment> assignments = assignmentRepo.findAllByStudentId(id);
			assignmentRepo.deleteAll(assignments);
		}

	
}
