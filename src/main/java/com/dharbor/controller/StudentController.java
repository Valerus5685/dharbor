package com.dharbor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dharbor.services.StudentService;

@Controller
@RequestMapping("student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("students",studentService.findAll());
		return "student/list";
	}
	
	@GetMapping("/{studentId}/courses")
	public String studentCourses(@PathVariable Integer studentId, Model model) {
		model.addAttribute("student",studentService.findById(studentId));
		return "student/courses";
	}
}
