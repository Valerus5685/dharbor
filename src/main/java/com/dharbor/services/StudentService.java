package com.dharbor.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dharbor.models.Student;
import com.dharbor.repositories.StudentRepository;

@Service
public class StudentService {

	@Autowired
	private StudentRepository studentRepository;
	
	public List<Student> findAll(){
		List<Student> result = studentRepository.findAll();		
		return result;
	}
	
	public Student findById(Integer studentId) {
		return studentRepository.findById(studentId.intValue());
	}
	
	public Student create(Student student) {
		return studentRepository.save(student);
	}
	
	public Student update(Integer studentId, Student student) {
		Student studentUpdated = studentRepository.findById(studentId.intValue());
		studentUpdated.setFirstname(student.getFirstname());
		studentUpdated.setLastname(student.getLastname());
		studentRepository.save(studentUpdated);
		return student;
	}
	
	public Boolean delete(Integer studentId) {
		Student student = studentRepository.findById(studentId.intValue());	
		studentRepository.delete(student);
		return true;
	}
	
}
