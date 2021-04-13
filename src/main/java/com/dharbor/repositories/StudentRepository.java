package com.dharbor.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import com.dharbor.models.Student;

public interface StudentRepository extends CrudRepository<Student, Integer> {
	Student findById(int id);
	List<Student> findAll();
}
