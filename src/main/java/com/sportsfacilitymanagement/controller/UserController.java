package com.sportsfacilitymanagement.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sportsfacilitymanagement.dao.StaffDao;
import com.sportsfacilitymanagement.dao.StudentDao;
import com.sportsfacilitymanagement.model.Staff;
import com.sportsfacilitymanagement.model.Student;
import com.sportsfacilitymanagement.utility.Constants.FacilityBanStatus;

@Controller
public class UserController {

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private StaffDao staffDao;

	@GetMapping("/student/login")
	public String goToLoginPage() {
		return "studentlogin";
	}

	@GetMapping("/staff/login")
	public String goToStaffLoginPage() {
		return "stafflogin";
	}

	@GetMapping("/student/register")
	public String goToRegisterPage() {
		return "studentregister";
	}

	@GetMapping("/staff/register")
	public String goToRegisterStaffPage() {
		return "staffregister";
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		session.removeAttribute("active-user");
		session.removeAttribute("user-login");
		mv.addObject("status", "Logged out Successfully");
		mv.setViewName("index");

		return mv;
	}

	@PostMapping("/student/register")
	public ModelAndView registerAdmin(@ModelAttribute Student user) {
		ModelAndView mv = new ModelAndView();
		user.setFacilityBan(FacilityBanStatus.NO.value());
		if (this.studentDao.save(user) != null) {
			mv.addObject("status", user.getFirstname() + " Successfully Registered!");
			mv.setViewName("studentlogin");
		}

		return mv;
	}

	@PostMapping("/staff/register")
	public ModelAndView registerStaff(@ModelAttribute Staff staff) {
		ModelAndView mv = new ModelAndView();
		if (this.staffDao.save(staff) != null) {
			mv.addObject("status", staff.getFirstname() + " Successfully Registered!");
			mv.setViewName("stafflogin");
		}

		else {
			mv.addObject("status", staff.getFirstname() + " Failed to Registered User!");
			mv.setViewName("staffregister");

		}

		return mv;
	}

	@PostMapping("/forgetpassword")
	public ModelAndView forgetpassword(@ModelAttribute Student forgetPassDetail) {
		ModelAndView mv = new ModelAndView();

		Student user = studentDao.findByEmailidAndMobileno(forgetPassDetail.getEmailid(),
				forgetPassDetail.getMobileno());

		if (user != null) {
			user.setPassword(forgetPassDetail.getPassword());
			studentDao.save(user);

			mv.addObject("status", "Password Changed");
			mv.setViewName("userlogin");
		}

		else {
			mv.addObject("status", "No User found!");
			mv.setViewName("userregister");
		}

		return mv;
	}

	@PostMapping("/student/login")
	public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam("emailid") String emailId,
			@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();

		Student user = studentDao.findByEmailidAndPassword(emailId, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", user);
			session.setAttribute("user-login", "student");
			mv.addObject("status", user.getFirstname() + " Successfully Logged In!");
			mv.setViewName("index");
		}

		else {
			mv.addObject("status", "Failed to login!");
			mv.setViewName("index");
		}

		return mv;
	}

	@PostMapping("/staff/login")
	public ModelAndView loginStaff(HttpServletRequest request, @RequestParam("emailid") String emailId,
			@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();

		Staff staff = staffDao.findByEmailidAndPassword(emailId, password);

		if (staff != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", staff);
			session.setAttribute("user-login", "staff");
			mv.addObject("status", staff.getFirstname() + " Successfully Logged In!");
			mv.setViewName("index");
		}

		else {
			mv.addObject("status", "Failed to login!");
			mv.setViewName("index");
		}

		return mv;
	}

	@GetMapping("/viewstudents")
	public ModelAndView goToViewStudentsPage() {
		ModelAndView mv = new ModelAndView();

		List<Student> students = this.studentDao.findAll();

		mv.addObject("students", students);
		mv.setViewName("viewstudents");

		return mv;
	}

	@GetMapping("/viewstaffs")
	public ModelAndView goToViewStaffPage() {
		ModelAndView mv = new ModelAndView();

		List<Staff> staffs = this.staffDao.findAll();

		mv.addObject("staffs", staffs);
		mv.setViewName("viewstaffs");

		return mv;
	}

	@GetMapping("/updateStudentBanStatus")
	public ModelAndView updateStudentBanStatus(@RequestParam("studentId") Integer studentId,
			@RequestParam("status") String status) {
		ModelAndView mv = new ModelAndView();

		Student student = this.studentDao.findById(studentId).get();
		student.setFacilityBan(status);

		Student savedStudent = this.studentDao.save(student);

		mv.addObject("status", "Student Facility Ban status updated successful!!!");
		mv.setViewName("index");

		return mv;
	}

}
