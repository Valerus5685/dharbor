package com.dharbor.apirest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dharbor.models.Course;
import com.dharbor.services.CourseService;

@RestController
@RequestMapping("api/course")
public class CourseRest {
	
	@Autowired
	private CourseService courseService;
	
	@PostMapping("/create")
	private Course create(@RequestBody Course course) {
		return courseService.create(course);
	}
	
	@PutMapping("/update/{courseId}")
	private Course update(@PathVariable Integer courseId, @RequestBody Course course) {
		System.out.println("llgueua  asdsdsd");
		return courseService.update(courseId, course);
	}
	
	@GetMapping("/list")
	private List<Course> list(){
		return courseService.findAllOnlyCourse();
	}
	
	@DeleteMapping("/delete/{courseId}")
	private void delete(@PathVariable Integer courseId) {
		courseService.delete(courseId);
	}
}
