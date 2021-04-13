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

import com.dharbor.models.Student;
import com.dharbor.services.StudentService;

@RestController
@RequestMapping("api/student")
public class StudentRest {
	
	@Autowired
	private StudentService studentService;
	
	@PostMapping("/create")
	private Student create(@RequestBody Student student) {
		return studentService.create(student);
	}
	
	@PutMapping("/update/{studentId}")
	private Student update(@PathVariable Integer studentId, @RequestBody Student student) {
		return studentService.update(studentId, student);
	}
	
	@GetMapping("/list")
	private List<Student> list(){
		return studentService.findAll();
	}
	
	@DeleteMapping("/delete/{studentId}")
	private void delete(@PathVariable Integer studentId) {
		studentService.delete(studentId);
	}
	
}
