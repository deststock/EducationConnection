package com.codingdojo.javaproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.javaproject.models.Assignment;

@Repository
public interface AssignmentRepository extends CrudRepository<Assignment, Long>  {
	List<Assignment> findAll();
	List<Assignment> findAllByStudentId(Long id);
}
