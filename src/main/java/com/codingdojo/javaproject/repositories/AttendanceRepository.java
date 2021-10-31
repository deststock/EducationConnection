package com.codingdojo.javaproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.javaproject.models.Attendance;

public interface AttendanceRepository extends CrudRepository <Attendance, Long>{
	List<Attendance> findAll();
	List<Attendance> findAllByStudentId(Long id);
}
