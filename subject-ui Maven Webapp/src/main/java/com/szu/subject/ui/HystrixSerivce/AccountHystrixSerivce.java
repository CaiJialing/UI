package com.szu.subject.ui.HystrixSerivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.szu.subject.domains.Course;
import com.szu.subject.domains.User;
import com.szu.subject.ui.service.AccountService;
@Service
public class AccountHystrixSerivce {

	@Autowired
	private AccountService accountService;
	
	
	public int removeCourse(Map idMap) {
		return accountService.removeCourse(idMap);
	}

	public int addCourse(Map idMap) {
		return accountService.addCourse(idMap);
	}

	public List<Course> getCourses(Long id) {
		return accountService.getCourses(id);
	}

	public User getByPK(Long id) {
		return accountService.getByPK(id);
	}
}
