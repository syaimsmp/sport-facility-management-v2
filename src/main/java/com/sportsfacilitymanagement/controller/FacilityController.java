package com.sportsfacilitymanagement.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import javax.management.relation.Role;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sportsfacilitymanagement.dao.BookedFacilityDao;
import com.sportsfacilitymanagement.dao.EquipmentDao;
import com.sportsfacilitymanagement.dao.FacilityDao;
import com.sportsfacilitymanagement.dao.ReviewFacilityDao;
import com.sportsfacilitymanagement.dao.StaffDao;
import com.sportsfacilitymanagement.dao.StudentDao;
import com.sportsfacilitymanagement.model.BookedFacility;
import com.sportsfacilitymanagement.model.Facility;
import com.sportsfacilitymanagement.model.ReviewFacility;
import com.sportsfacilitymanagement.model.Student;
import com.sportsfacilitymanagement.utility.Constants.FacilityBanStatus;
import com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus;
import com.sportsfacilitymanagement.utility.Helper;

@Controller
public class FacilityController {

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private StaffDao staffDao;

	@Autowired
	private FacilityDao facilityDao;
	@Autowired
	private EquipmentDao equipmentDao;

	@Autowired
	private ReviewFacilityDao reviewFacilityDao;

	@Autowired
	private BookedFacilityDao bookedFacilityDao;

	@Value("${com.sportsfacilitymanagement.image.folder.path}")
	private String sportsImageFolderPath;

	@GetMapping("/addFacility")
	public String addFacility() {
		return "addfacility";
	}

	@PostMapping("/addFacility")
	public ModelAndView addFacility(HttpServletRequest request, HttpSession session)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView();

		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String location = request.getParameter("location");
		Part part = request.getPart("image");

		String fileName = part.getSubmittedFileName();

		String uploadPath = sportsImageFolderPath + fileName;

		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = part.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		Facility facility = new Facility();

		facility.setName(name);
		facility.setDescription(description);
		facility.setLocation(location);
		facility.setImagePath(fileName);
		facility.setStatus(FacilityOrEquipmentStatus.AVAILABLE.value());

		Facility savedFacility = facilityDao.save(facility);

		if (savedFacility != null) {
			mv.addObject("status", "Facility Added Successfully.");
		}

		else {
			mv.addObject("error", "Failed to add facility.");
		}
		mv.setViewName("index");

		return mv;
	}

	@GetMapping("/viewFacilities")
	public ModelAndView viewTickets() {
		ModelAndView mv = new ModelAndView();

		List<Facility> facilities = this.facilityDao.findAll();

		mv.addObject("facilities", facilities);
		mv.setViewName("viewfacilities");

		return mv;
	}

	@GetMapping("/viewAvailableFacility")
	public ModelAndView viewAvailableFacility() {
		ModelAndView mv = new ModelAndView();

		List<Facility> facilities = this.facilityDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());

		mv.addObject("facilities", facilities);
		mv.setViewName("viewavailablefacilities");

		return mv;
	}

	@GetMapping("/updateFacility")
	public ModelAndView updateFacility(@RequestParam("facilityId") Integer facilityId) {
		ModelAndView mv = new ModelAndView();

		Facility facility = this.facilityDao.findById(facilityId).get();
		mv.addObject("facility", facility);
		mv.setViewName("updatefacility");

		return mv;
	}

	@GetMapping("/updateFacilityStatus")
	public ModelAndView updateFacilityStatus(@RequestParam("facilityId") Integer facilityId) {
		ModelAndView mv = new ModelAndView();

		Facility facility = this.facilityDao.findById(facilityId).get();
		mv.addObject("facility", facility);
		mv.setViewName("updatefacilitystatus");

		return mv;
	}

	@PostMapping("/updateFacility")
	public ModelAndView updateFacility(HttpServletRequest request, HttpSession session)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView();

		Integer facilityId = Integer.parseInt(request.getParameter("facilityId"));
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String location = request.getParameter("location");
		Part part = request.getPart("image");

		String fileName = part.getSubmittedFileName();

		String uploadPath = sportsImageFolderPath + fileName;

		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = part.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		Facility facility = this.facilityDao.findById(facilityId).get();

		facility.setName(name);
		facility.setDescription(description);
		facility.setLocation(location);
		facility.setImagePath(fileName);
		facility.setStatus(FacilityOrEquipmentStatus.AVAILABLE.value());

		Facility savedFacility = facilityDao.save(facility);

		if (savedFacility != null) {
			mv.addObject("status", "Facility Updated Successfully.");
		}

		else {
			mv.addObject("status", "Failed to update facility.");
		}
		mv.setViewName("index");

		return mv;
	}

	@GetMapping("/updatefacilityStatus")
	public ModelAndView updateFacilityStatus(HttpServletRequest request, HttpSession session) throws ServletException {
		ModelAndView mv = new ModelAndView();

		Integer facilityId = Integer.parseInt(request.getParameter("facilityId"));
		String status = request.getParameter("status");

		Facility facility = this.facilityDao.findById(facilityId).get();
		facility.setStatus(status);

		Facility savedFacility = facilityDao.save(facility);

		if (savedFacility != null) {
			mv.addObject("status", "Facility Status Updated Successfully.");
		}

		else {
			mv.addObject("status", "Failed to update facility status.");
		}
		mv.setViewName("index");

		return mv;
	}

	@GetMapping("/bookfacility")
	public ModelAndView bookFacility(@RequestParam("facilityId") Integer facilityId,
			@RequestParam("userId") Integer userId, @RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();
		Facility facility = this.facilityDao.findById(facilityId).get();
		mv.addObject("facility", facility);
		mv.addObject("role", role);
		mv.addObject("userId", userId);
		mv.setViewName("bookfacility");

		return mv;
	}

	
    @GetMapping("/bookFacility")
    public ModelAndView bookFacility(@RequestParam("facilityId") Integer facilityId,
            @RequestParam("userId") Integer userId, @RequestParam("role") String role,
            @RequestParam("date") String date) {
		ModelAndView mv = new ModelAndView();

		String monthYear = Helper.getCurrentYearMonth(date);

		Student sudent = null;

		if (role.equals("student")) {

			Student student = this.studentDao.findById(userId).get();

			if (student.getFacilityBan().equals(FacilityBanStatus.YES.value())) {
				mv.addObject("status", "You Banned to use any Facility!!!");
				mv.setViewName("viewallbookedfacilities");
				return mv;
			}

		}

		List<BookedFacility> thisMonthsBookings = this.bookedFacilityDao
				.findByParticipantIdAndRoleAndDateContainingIgnoreCase(userId, role, monthYear);

		if (thisMonthsBookings != null && thisMonthsBookings.size() >= 4) {
			mv.addObject("error", "Can't book the facility more than 4 times in a month!!!");
			mv.setViewName("index");
			return mv;
		}

		Facility facility = this.facilityDao.findById(facilityId).get();

		BookedFacility bookedFacility = new BookedFacility();
		bookedFacility.setRole(role);
		bookedFacility.setParticipantId(userId);
		bookedFacility.setDate(date);
		bookedFacility.setFacilityId(facility.getId());
		bookedFacility.setBookingTime(
				String.valueOf(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()));

		BookedFacility savedBooking = this.bookedFacilityDao.save(bookedFacility);

		if (savedBooking != null) {
			mv.addObject("status", "Facility Booked Successful!!!");
		}

		else {
			mv.addObject("error", "Failed to book status.");
		}

		mv.addObject("facility", facility);
		mv.addObject("role", role);
		mv.addObject("userId", userId);
		mv.setViewName("bookfacility");

		return mv;
	}

	@GetMapping("/addFacilityReview")
	public ModelAndView addfacilityreview(@RequestParam("facilityId") Integer facilityId,
			@RequestParam("userId") Integer userId, @RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();
		Facility facility = this.facilityDao.findById(facilityId).get();
		mv.addObject("facility", facility);
		mv.addObject("role", role);
		mv.addObject("userId", userId);
		mv.setViewName("addfacilityreview");

		return mv;
	}

	@GetMapping("/addfacilityreview")
	public ModelAndView addfacilityreview(@RequestParam("facilityId") Integer facilityId,
			@RequestParam("userId") Integer userId, @RequestParam("role") String role,
			@RequestParam("review") String review) {
		ModelAndView mv = new ModelAndView();

		ReviewFacility reviewFacility = new ReviewFacility();
		reviewFacility.setAddedTime(
				String.valueOf(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()));
		reviewFacility.setFacilityId(facilityId);
		reviewFacility.setParticipantId(userId);
		reviewFacility.setReview(review);
		reviewFacility.setRole(role);

		ReviewFacility savedReview = this.reviewFacilityDao.save(reviewFacility);

		if (savedReview != null) {
			mv.addObject("status", "Review added successful!!!");
		}

		else {
			mv.addObject("status", "Failed to add review");
		}

		mv.setViewName("index");

		return mv;
	}

	@GetMapping("/viewfacilityreviews")
	public ModelAndView viewFacilityReview(@RequestParam("facilityId") Integer facilityId) {
		ModelAndView mv = new ModelAndView();

		List<ReviewFacility> reviews = this.reviewFacilityDao.findByFacilityId(facilityId);

		mv.addObject("reviews", reviews);
		mv.setViewName("viewfacilityreviews");
		return mv;
	}

	@GetMapping("/viewAllBookedFacilities")
	public ModelAndView viewAllBookedFacilities() {
		ModelAndView mv = new ModelAndView();

		List<BookedFacility> bookedFacilities = this.bookedFacilityDao.findAll();

		mv.addObject("bookedFacilities", bookedFacilities);
		mv.setViewName("viewallbookedfacilities");
		return mv;
	}

	@GetMapping("/viewmybookedFacility")
	public ModelAndView viewmybookedFacility(@RequestParam("userId") Integer userId,
			@RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();

		List<BookedFacility> bookedFacilities = this.bookedFacilityDao.findByParticipantIdAndRole(userId, role);

		mv.addObject("bookedFacilities", bookedFacilities);
		mv.setViewName("viewmybookedfacilities");
		return mv;
	}

}
