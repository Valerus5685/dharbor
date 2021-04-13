package com.dharbor.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.dharbor.models.Course;

import com.dharbor.dto.CourseInterface;

public interface CourseRepository extends CrudRepository<Course, Integer> {
	Course findById(int id);
	List<Course> findAll();
		
	@Query(value="SELECT id, title, description FROM courses", nativeQuery = true)
	List<CourseInterface> coursesAll();
}