package com.szu.subject.ui.service;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.szu.subject.domains.ClassTime;
import com.szu.subject.domains.Comment;
import com.szu.subject.domains.Course;
import com.szu.subject.domains.Department;
import com.szu.subject.domains.Selection;

@FeignClient("courses")
public interface CourseService {

	@RequestMapping(method = RequestMethod.POST, value = "course/get-departments",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Department> getAllDepartment();

	@RequestMapping(method = RequestMethod.POST, value = "course/get-courses-by-department",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Course> getByDepartment(Long id);

	@RequestMapping(method = RequestMethod.POST, value = "course/get-comment",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Comment> getComment(Long id) ;

	@RequestMapping(method = RequestMethod.POST, value = "course/get-selection",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Selection> getSelection(Long id) ;

	@RequestMapping(method = RequestMethod.POST, value = "course/get-course-by-pk",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public Course getByPK(Long id) ;

	@RequestMapping(method = RequestMethod.GET, value = "course/get-all-class-time",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<ClassTime> getAllClassTime();


}
