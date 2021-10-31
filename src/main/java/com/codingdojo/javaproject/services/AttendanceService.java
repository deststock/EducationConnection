package com.codingdojo.javaproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.javaproject.models.Attendance;
import com.codingdojo.javaproject.repositories.AttendanceRepository;
import com.codingdojo.javaproject.repositories.StudentRepository;

@Service
public class AttendanceService {
	@Autowired
	AttendanceRepository attRepo;
	@Autowired
	StudentRepository studentRepo;
	
	// RETURNS ALL 
	public List<Attendance> allAttendance(){
		List<Attendance> attendances = attRepo.findAll();
		return attendances;
	}
	
	// CREATE NEW 
	public Attendance newAttendance(Attendance a) {
		return attRepo.save(a);
	}
	
	
}
