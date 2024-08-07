package com.sportsfacilitymanagement.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.sportsfacilitymanagement.dao.AdminDao;
import com.sportsfacilitymanagement.model.Admin;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/")
	public String goToHomeDuringStart() {
		return "index";
	}
	
	@GetMapping("/home")
	public String goToHome() {
		return "index";
	}
	
	@GetMapping("/login")
	public String goToAdminLoginPage() {
		
		return "login";
	}
	
	@GetMapping("/register")
	public String goToAdminRegisterPage() {
		
		return "/register";
	}
	
	@PostMapping("/register")
	public ModelAndView registerAdmin(@ModelAttribute Admin admin) {
		ModelAndView mv = new ModelAndView();
		if(this.adminDao.save(admin)!= null) {
			mv.addObject("status", admin.getFirstname()+" Successfully Registered as ADMIN");
			mv.setViewName("login");
		}
		
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam("emailid") String emailId, @RequestParam("password") String password ) {
		ModelAndView mv = new ModelAndView();
		
		Admin admin = adminDao.findByEmailidAndPassword(emailId, password);
		
		if(admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", admin);
			session.setAttribute("user-login","admin");
			mv.addObject("status", admin.getFirstname()+" Successfully Logged in as ADMIN!");
			mv.setViewName("index");
			// return "redirect:/";

		}
		
		else {
			mv.addObject("error","Failed to login as Admin!");
			mv.setViewName("login");
		}
		
		return mv;
	}
	
}
