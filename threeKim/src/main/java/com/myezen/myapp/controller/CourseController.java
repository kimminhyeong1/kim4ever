package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myezen.myapp.service.CourseService;
import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/course")
public class CourseController {
CourseService cs;
	
	@RequestMapping(value="/courseIntro.do")
	public String memberJoin() {
		
		return "course/courseIntro";
	}
	@RequestMapping(value="/course1.do")
	public String course1() {
	    return "course/course1";
	}
	@RequestMapping(value="/course2.do")
	public String course2() {
	    return "course/course2";
	}
	@RequestMapping(value="/course3.do")
	public String course3() {
	    return "course/course3";
	}
	@RequestMapping(value="/course4.do")
	public String course4() {
	    return "course/course4";
	}
	@RequestMapping(value="/course5.do")
	public String course5() {
	    return "course/course5";
	}
}
