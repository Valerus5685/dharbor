package com.dharbor.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dharbor.repositories.CourseRepository;
import com.dharbor.dto.CourseInterface;
import com.dharbor.models.Course;

@Service
public class CourseService {
	@Autowired
	private CourseRepository courseRepository;
	
	public List<Course> findAll(){
		List<Course> result = courseRepository.findAll();		
		return result;
	}
	
	public List<Course> findAllOnlyCourse(){

		List<Course> courses = new ArrayList<>();
		
		List<CourseInterface> result = courseRepository.coursesAll();
		result.forEach(course -> {
			Course c = new Course(course.getId(),course.getTitle(),course.getDescription());
			courses.add(c);
		});
		return courses;
	}
	
	public Course findById(Integer courseId) {
		return courseRepository.findById(courseId.intValue());
	}
	
	public Course create(Course course) {
		return courseRepository.save(course);
	}
	
	public Course update(Integer courseId, Course course) {
		Course courseUpdated = courseRepository.findById(courseId.intValue());
		courseUpdated.setTitle(course.getTitle());
		courseUpdated.setDescription(course.getDescription());
		courseRepository.save(courseUpdated);
		return courseUpdated;
	}
	
	public Boolean delete(Integer courseId) {
		Course course = courseRepository.findById(courseId.intValue());	
		courseRepository.delete(course);
		return true;
	}
	
}


