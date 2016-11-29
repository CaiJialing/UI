package com.szu.subject.ui.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szu.subject.domains.Course;
import com.szu.subject.domains.User;

@FeignClient("account")
public interface AccountService {

	@RequestMapping(method = RequestMethod.POST, value = "/remove-courses",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public int removeCourse(Map idMap);

	@RequestMapping(method = RequestMethod.POST, value = "/add-courses",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public int addCourse(Map idMap);

	@RequestMapping(method = RequestMethod.POST, value = "/get-courses",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Course> getCourses(Long id);

	@RequestMapping(method = RequestMethod.POST, value = "/get-courses-by-pk",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public User getByPK(Long id) ;
}
