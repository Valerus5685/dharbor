package com.dharbor.apirest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dharbor.services.CourseStudentService;

@RestController
@RequestMapping("api/register")
public class ClassStudentRest {
	
	@Autowired
	private CourseStudentService courseStudentService;
	
	@PostMapping("/student/{studentId}/course/{courseId}")
	private void register(@PathVariable Integer studentId, @PathVariable Integer courseId){
		courseStudentService.registerStudentInClass(studentId, courseId); 
	}
	
	@PostMapping("/load/test/data")
	private void loadTestData() {
		courseStudentService.loadTestData();
	}
}
