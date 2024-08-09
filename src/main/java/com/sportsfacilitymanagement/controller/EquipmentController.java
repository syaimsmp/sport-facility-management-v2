package com.sportsfacilitymanagement.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sportsfacilitymanagement.dao.BookedEquipmentDao;
import com.sportsfacilitymanagement.dao.EquipmentDao;
import com.sportsfacilitymanagement.dao.FacilityDao;
import com.sportsfacilitymanagement.dao.ReviewEquipmentDao;
import com.sportsfacilitymanagement.dao.StaffDao;
import com.sportsfacilitymanagement.dao.StudentDao;
import com.sportsfacilitymanagement.model.BookedEquipment;
import com.sportsfacilitymanagement.model.BookedFacility;
import com.sportsfacilitymanagement.model.Equipment;
import com.sportsfacilitymanagement.model.Facility;
import com.sportsfacilitymanagement.model.ReviewEquipment;
import com.sportsfacilitymanagement.model.ReviewFacility;
import com.sportsfacilitymanagement.model.Student;
import com.sportsfacilitymanagement.utility.Helper;
import com.sportsfacilitymanagement.utility.Constants.FacilityBanStatus;
import com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus;

@Controller
public class EquipmentController {

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private StaffDao staffDao;

	@Autowired
	private FacilityDao facilityDao;

	@Autowired
	private EquipmentDao equipmentDao;

	@Autowired
	private ReviewEquipmentDao reviewEquipmentDao;

	@Autowired
	private BookedEquipmentDao bookedEquipmentDao;

	@Value("${com.sportsfacilitymanagement.image.folder.path}")
	private String sportsImageFolderPath;

	@GetMapping("/addEquipment")
	public String addEquipment() {
		return "addequipment";
	}

	@PostMapping("/addEquipment")
	public ModelAndView addEquipment(HttpServletRequest request, HttpSession session)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView();

		String name = request.getParameter("name");
		Integer totalQuantity = Integer.parseInt(request.getParameter("totalQuantity"));
		String category = request.getParameter("category");
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

		Equipment equipment = new Equipment();

		equipment.setName(name);
		equipment.setCategory(category);
		equipment.setTotalQuantity(totalQuantity);
		equipment.setImagePath(fileName);
		equipment.setStatus(FacilityOrEquipmentStatus.AVAILABLE.value());

		Equipment savedEquipment = equipmentDao.save(equipment);

		if (savedEquipment != null) {
			mv.addObject("status", "Equipment Added Successfully.");
		}

		else {
			mv.addObject("status", "Failed to add equipment.");
		}
		mv.setViewName("index");

		return mv;
	}

	@GetMapping("/updateEquipment")
	public ModelAndView updateFacility(@RequestParam("equipmentId") Integer equipmentId) {
		ModelAndView mv = new ModelAndView();

		Equipment equipment = this.equipmentDao.findById(equipmentId).get();
		mv.addObject("equipment", equipment);
		mv.setViewName("updateequipment");

		return mv;
	}

	@PostMapping("/updateequipment")
	public ModelAndView updateFacility(HttpServletRequest request, HttpSession session)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView();

		Integer equipmentId = Integer.parseInt(request.getParameter("equipmentId"));

		String name = request.getParameter("name");
		Integer totalQuantity = Integer.parseInt(request.getParameter("totalQuantity"));
		String category = request.getParameter("category");
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

		Equipment equipment = this.equipmentDao.findById(equipmentId).get();

		equipment.setName(name);
		equipment.setCategory(category);
		equipment.setTotalQuantity(totalQuantity);
		equipment.setImagePath(fileName);
		equipment.setStatus(FacilityOrEquipmentStatus.AVAILABLE.value());

		Equipment savedEquipment = equipmentDao.save(equipment);

		if (savedEquipment != null) {
			mv.addObject("status", "Equipment Updated Successfully.");
		}

		else {
			mv.addObject("status", "Failed to update equipment.");
		}
		mv.setViewName("index");

		return mv;

	}

	@GetMapping("/viewequipments")
	public ModelAndView viewTickets() {
		ModelAndView mv = new ModelAndView();

		List<Equipment> equipments = this.equipmentDao.findAll();

		mv.addObject("equipments", equipments);
		mv.setViewName("viewequipments");

		return mv;
	}

	@GetMapping("/viewavailableequipments")
	public ModelAndView viewAvailableEquipments() {
		ModelAndView mv = new ModelAndView();

		List<Equipment> equipments = this.equipmentDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());
		mv.addObject("equipments", equipments);
		mv.setViewName("viewavailableequipments");

		return mv;
	}

	@GetMapping("/updateEquipmentStatus")
	public ModelAndView updateFacilityStatus(@RequestParam("equipmentId") Integer equipmentId) {
		ModelAndView mv = new ModelAndView();

		Equipment equipment = this.equipmentDao.findById(equipmentId).get();
		mv.addObject("equipment", equipment);
		mv.setViewName("updateequipmentstatus");

		return mv;
	}

	@GetMapping("/updateequipmentStatus")
	public ModelAndView updateFacilityStatus(HttpServletRequest request, HttpSession session) throws ServletException {
		ModelAndView mv = new ModelAndView();

		Integer equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
		String status = request.getParameter("status");

		Equipment equipment = this.equipmentDao.findById(equipmentId).get();
		equipment.setStatus(status);

		Equipment savedEquipment = equipmentDao.save(equipment);

		if (savedEquipment != null) {
			mv.addObject("status", "Equipment Status Updated Successfully.");
		}

		else {
			mv.addObject("status", "Failed to update Equipment status.");
		}
		List<Equipment> equipments = this.equipmentDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());
		mv.addObject("equipments", equipments);
		mv.setViewName("viewavailableequipments");

		return mv;
	}

	@GetMapping("/bookequipment")
	public ModelAndView bookFacility(@RequestParam("equipmentId") Integer equipmentId,
			@RequestParam("userId") Integer userId, @RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();
		Equipment equipment = this.equipmentDao.findById(equipmentId).get();
		mv.addObject("equipment", equipment);
		mv.addObject("role", role);
		mv.addObject("userId", userId);
		mv.setViewName("bookequipment");

		return mv;
	}

	@GetMapping("/bookEquipment")
	public ModelAndView bookFacility(@RequestParam("equipmentId") Integer equipmentId,
			@RequestParam("userId") Integer userId, @RequestParam("role") String role,
			@RequestParam("date") String date) {
		ModelAndView mv = new ModelAndView();

		String monthYear = Helper.getCurrentYearMonth(date);

		Student sudent = null;

		if (role.equals("student")) {

			Student student = this.studentDao.findById(userId).get();

			if (student.getFacilityBan().equals(FacilityBanStatus.YES.value())) {
				mv.addObject("error", "You are banned from using any facility!!!");
				List<Equipment> equipments = this.equipmentDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());
				mv.addObject("equipments", equipments);
				mv.setViewName("viewavailableequipments");
				return mv;
			}

		}

		List<BookedEquipment> thisMonthsBookings = this.bookedEquipmentDao
				.findByParticipantIdAndRoleAndDateContainingIgnoreCase(userId, role, monthYear);

		if (thisMonthsBookings != null && thisMonthsBookings.size() >= 4) {
			mv.addObject("error", "Can't book the equipment more than 4 times in a month!!!");
			List<Equipment> equipments = this.equipmentDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());
			mv.addObject("equipments", equipments);
			mv.setViewName("viewavailableequipments");
			return mv;
		}

		Equipment equipment = this.equipmentDao.findById(equipmentId).get();
		int balance = equipment.getTotalQuantity() -1;
		if(balance < 0){
			mv.addObject("error", "Equipment quantity insufficient.");
			List<Equipment> equipments = this.equipmentDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());
			mv.addObject("equipments", equipments);
			mv.setViewName("viewavailableequipments");
			return mv;
		}
		else{
			equipment.setTotalQuantity(balance);
			equipmentDao.save(equipment);	
		}

		BookedEquipment bookedEquipment = new BookedEquipment();
		bookedEquipment.setRole(role);
		bookedEquipment.setParticipantId(userId);
		bookedEquipment.setDate(date);
		bookedEquipment.setEquipmentId(equipmentId);
		bookedEquipment.setBookingTime(
				String.valueOf(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()));

		BookedEquipment savedBooking = bookedEquipmentDao.save(bookedEquipment);

		if (savedBooking != null) {
			mv.addObject("status", "Equipment Booked Successful!!!");
		}

		else {
			mv.addObject("error", "Failed to book equipment.");
		}

		List<Equipment> equipments = this.equipmentDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());
		mv.addObject("equipments", equipments);
		mv.setViewName("viewavailableequipments");

		return mv;
	}

	@GetMapping("/addEquipmentReview")
	public ModelAndView addfacilityreview(@RequestParam("equipmentId") Integer equipmentId,
			@RequestParam("userId") Integer userId, @RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();
		Equipment equipment = this.equipmentDao.findById(equipmentId).get();
		mv.addObject("equipment", equipment);
		mv.addObject("role", role);
		mv.addObject("userId", userId);
		mv.setViewName("addequipmentreview");

		return mv;
	}

	@GetMapping("/addequipmentreview")
	public ModelAndView addequipmentreview(@RequestParam("equipmentId") Integer equipmentId,
			@RequestParam("userId") Integer userId, @RequestParam("role") String role,
			@RequestParam("review") String review) {
		ModelAndView mv = new ModelAndView();

		ReviewEquipment reviewEquipment = new ReviewEquipment();
		reviewEquipment.setAddedTime(
				String.valueOf(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()));
		reviewEquipment.setEquipmentId(equipmentId);
		reviewEquipment.setParticipantId(userId);
		reviewEquipment.setReview(review);
		reviewEquipment.setRole(role);

		ReviewEquipment savedReview = this.reviewEquipmentDao.save(reviewEquipment);

		if (savedReview != null) {
			mv.addObject("status", "Review added successful!!!");
		}

		else {
			mv.addObject("status", "Failed to add review");
		}

		List<Equipment> equipments = this.equipmentDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value());
		mv.addObject("equipments", equipments);
		mv.setViewName("viewavailableequipments");

		return mv;
	}

	@GetMapping("/viewequipmentreviews")
	public ModelAndView viewFacilityReview(@RequestParam("equipmentId") Integer equipmentId) {
		ModelAndView mv = new ModelAndView();

		List<ReviewEquipment> reviews = this.reviewEquipmentDao.findAll();

		mv.addObject("reviews", reviews);
		mv.setViewName("viewequipmentreviews");
		return mv;
	}

	@GetMapping("/viewAllBookedEquipments")
	public ModelAndView viewAllBookedEquipments() {
		ModelAndView mv = new ModelAndView();

		List<BookedEquipment> bookedEquipments = this.bookedEquipmentDao.findAll();

		mv.addObject("bookedEquipments", bookedEquipments);
		mv.setViewName("viewallbookedequipments");
		return mv;
	}

	@GetMapping("/viewmybookedEquipments")
	public ModelAndView viewmybookedFacility(@RequestParam("userId") Integer userId,
			@RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();

		List<BookedEquipment> bookedEquipments = this.bookedEquipmentDao.findByParticipantIdAndRole(userId, role);

		mv.addObject("bookedEquipments", bookedEquipments);
		mv.setViewName("viewmybookedequipments");
		return mv;
	}

}
