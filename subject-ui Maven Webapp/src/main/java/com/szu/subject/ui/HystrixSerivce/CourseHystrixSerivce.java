package com.szu.subject.ui.HystrixSerivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.szu.subject.domains.ClassTime;
import com.szu.subject.domains.Comment;
import com.szu.subject.domains.Course;
import com.szu.subject.domains.Department;
import com.szu.subject.domains.Selection;
import com.szu.subject.ui.service.CourseService;

@Service
public class CourseHystrixSerivce {
	
	@Autowired
	private CourseService courseService;
	
	@HystrixCommand(fallbackMethod = "getAllDepartment2") //1
	public List<Department> getAllDepartment() {
		return courseService.getAllDepartment();
	}
	
	public List<Department> getAllDepartment2() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Course> getByDepartment(Long id) {
		return courseService.getByDepartment(id);
	}

	public List<Comment> getComment(Long id) {
		return courseService.getComment(id);
	}

	public List<Selection> getSelection(Long id) {
		return courseService.getSelection(id);
	}

	public Course getByPK(Long id) {
		return courseService.getByPK(id);
	}

	public List<ClassTime> getAllClassTime() {
		return courseService.getAllClassTime();
	}
}
