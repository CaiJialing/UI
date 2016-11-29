package com.szu.subject.ui.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.szu.subject.domains.ClassTime;
import com.szu.subject.domains.Comment;
import com.szu.subject.domains.Course;
import com.szu.subject.domains.Department;
import com.szu.subject.domains.Selection;
import com.szu.subject.domains.User;
import com.szu.subject.ui.HystrixSerivce.CourseHystrixSerivce;
import com.szu.subject.ui.HystrixSerivce.AccountHystrixSerivce;
import com.szu.subject.ui.service.CourseService;
import com.szu.subject.ui.service.AccountService;
/**
 * controller层
 * @author ShenXiaolin
 *
 */
@RestController
public class UiController {
	@Autowired
	private AccountHystrixSerivce accountHystrixSerivce;
	@Autowired
	private CourseHystrixSerivce courseHystrixSerivce;
	
	/**
	 * 获得所有的院系
	 * @return
	 */
//	@RequestMapping("course/get-department-all")
	@RequestMapping("get-all-department")
	public List<Department> getAllDepartment(){
		return courseHystrixSerivce.getAllDepartment();
	}
	
	/**
	 * 获得某院系开设的所有课程
	 * @param id 院系id
	 * @return
	 */
//	@RequestMapping("course/get-by-department")
	@RequestMapping("get-courses-by-department")
	public List<Course> getByDepartment(@RequestParam Long id){
		return courseHystrixSerivce.getByDepartment(id);
	}
	
	/**
	 * 根据课程id获得该课程的评论
	 * @param id 课程id
	 * @return
	 */
//	@RequestMapping("course/get-comment")
	@RequestMapping("get-course-comments")
	public List<Comment> getComment(@RequestParam Long id){
		return courseHystrixSerivce.getComment(id);
	}
	
	/**
	 * 根据课程id获得该课程最新的选课情况
	 * @param id
	 * @return
	 */
//	@RequestMapping("course/get-selection")
	@RequestMapping("get-course-selection")
	public List<Selection> getSelection(@RequestParam Long id){
		return courseHystrixSerivce.getSelection(id);
	}

	/**
	 * 根据学生id获得该学生所选的所有课程
	 * @param id 学生id
	 * @return
	 */
//	@RequestMapping("account/courses")
	@RequestMapping("get-courses-by-account")
	public List<Course> getCourses(@RequestParam Long id){
		return accountHystrixSerivce.getCourses(id);
	}
	
	/**
	 * 选课
	 * @param idMap 学生id和课程id
	 * @return
	 */
//	@RequestMapping("account/add-course")
	@RequestMapping("add-account-course")
	public int addCourse(@RequestParam Map idMap){
		return accountHystrixSerivce.addCourse(idMap);
	}
	
	/**
	 * 退课
	 * @param idMap 学生id和课程id
	 * @return
	 */
//	@RequestMapping("account/remove-course")
	@RequestMapping("remove-account-course")
	public int removeCourse(@RequestParam Map idMap){
		return accountHystrixSerivce.removeCourse(idMap);
	}
	
	/**
	 * 根据课程id获得课程信息
	 * @param id 课程id
	 * @return
	 */
//	@RequestMapping("course/get-by-pk")
	@RequestMapping("get-course-by-pk")
	public Course getCourseByPK(@RequestParam Long id){
		return courseHystrixSerivce.getByPK(id);
	}
	
	/**
	 * 根据id获得学生的信息
	 * @param id
	 * @return
	 */
//	@RequestMapping("account/get-by-pk")
	@RequestMapping("get-account-by-pk")
	public User getUserByPK(@RequestParam Long id){
		return accountHystrixSerivce.getByPK(id);
	}
	
	@RequestMapping("get-all-class-time")
	public List<ClassTime> test(){
		return courseHystrixSerivce.getAllClassTime();
	}
}