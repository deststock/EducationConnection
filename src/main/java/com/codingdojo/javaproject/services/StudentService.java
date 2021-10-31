package com.codingdojo.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.javaproject.models.Student;
import com.codingdojo.javaproject.repositories.StudentRepository;
import com.codingdojo.javaproject.repositories.UserRepository;

@Service
public class StudentService {
	@Autowired
	StudentRepository studentRepo;
	@Autowired
	UserRepository userRepo;
	
	// RETURNS ALL STUDENTS
	public List<Student> allStudents() {
		List<Student> students = studentRepo.findAll();
		return students;
	}
	
	// RETURNS ONE TEACHERS STUDENTS 
	public List<Student> myStudents(Long id) {
		List<Student> students = studentRepo.findAllByUserId(id);
		return students;
	}
	
	// CREATES A STUDENT 
	public Student newStudent(Student s) {
		return studentRepo.save(s);
	}
	
	// DELETES A STUDENT
	public void deleteStudent(Long id) {
		studentRepo.deleteById(id);
	}
	
	// RETURNS A STUDENT 
	public Student findStudent(Long id) {
		Optional<Student> stud = studentRepo.findById(id);
		if (stud.isPresent()) {
			return stud.get();
		} else {
			return null;
		}
	}
}
