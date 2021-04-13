package com.dharbor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dharbor.services.CourseService;

@Controller
@RequestMapping("course")
public class CourseController {
	
	@Autowired
	private CourseService courseServcice;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("courses",courseServcice.findAll());
		return "course/list";
	}
	
	@GetMapping("/{courseId}/students")
	public String courseStudents(@PathVariable Integer courseId, Model model) {
		model.addAttribute("course",courseServcice.findById(courseId));
		return "course/students";
	}

}
