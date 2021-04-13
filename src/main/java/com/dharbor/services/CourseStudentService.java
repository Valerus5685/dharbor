package com.dharbor.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dharbor.models.Student;
import com.dharbor.models.Course;
import com.dharbor.repositories.CourseRepository;
import com.dharbor.repositories.StudentRepository;


@Service
public class CourseStudentService {
	
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private CourseRepository courseRepository;
	
	public Boolean registerStudentInClass(Integer studentId, Integer courseId) {

		Student student = studentRepository.findById(studentId.intValue());	
		Course course = courseRepository.findById(courseId.intValue());
		
		student.getCourses().add(course);
		studentRepository.save(student);
			

		return true;
	}
	
	public boolean loadTestData(){
		
		String[] courses = {"Astronomy","Earth Sciences","Forensic science","Materials Sciences","Physics","Sports Science","General Sciences","Biomedical Sciences","Physical Geography","Life Sciences"};
		String[] firstnames = {"James","Mary","John","Patricia","Robert","Jennifer","Michael","Linda","William","Elizabeth","David","Barbara","Richard","Susan","Joseph","Jessica","Thomas","Sarah","Charles","Karen","Christopher","Nancy","Daniel","Lisa","Matthew","Margaret","Anthony","Betty","Donald","Sandra","Mark","Ashley","Paul","Dorothy","Steven","Kimberly","Andrew","Emily","Kenneth","Donna"};
		String[] lastnames = {"Smith","Johnson","Williams","Brown","Jones","Garcia","Miller","Davis","Rodriguez","Martinez","Hernandez","Lopez","Gonzalez","Wilson","Anderson","Thomas","Taylor","Moore","Jackson","Martin","Lee","Perez","Thompson","White","Harris","Sanchez","Clark","Ramirez","Lewis","Robinson","Walker","Young","Allen","King","Wright","Scott","Torres","Nguyen","Hill","Flores","Green","Adams","Nelson","Baker","Hall","Rivera","Campbell","Mitchell","Carter","Roberts"};
		for(int courseNumber = 0; courseNumber<10; courseNumber++) {
			Course course = new Course();
			course.setTitle(courses[courseNumber]);
			course.setDescription("descripcion");
			courseRepository.save(course);
			for(int studentNumber = 0; studentNumber < Math.round(Math.random() * 25); studentNumber++ ) {
				
				int indexRandomFirstname = (int) Math.round(Math.random() * 39);
				int indexRandomLastname1 = (int) Math.round(Math.random() * 49);
				int indexRandomLastname2 = (int) Math.round(Math.random() * 49);
				Student student = new Student();
				student.setFirstname(firstnames[indexRandomFirstname]);
				student.setLastname(lastnames[indexRandomLastname1] +" "+lastnames[indexRandomLastname2]);
				student.getCourses().add(course);
				studentRepository.save(student);
			}
		}
		return true;
	}

}
