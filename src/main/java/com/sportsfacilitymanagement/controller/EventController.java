package com.sportsfacilitymanagement.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sportsfacilitymanagement.dao.BookedEventDao;
import com.sportsfacilitymanagement.dao.EventDao;
import com.sportsfacilitymanagement.dao.FacilityDao;
import com.sportsfacilitymanagement.dao.ReviewEventDao;
import com.sportsfacilitymanagement.dao.ReviewEventParticipantDao;
import com.sportsfacilitymanagement.dao.StaffDao;
import com.sportsfacilitymanagement.dao.StudentDao;
import com.sportsfacilitymanagement.model.BookedEquipment;
import com.sportsfacilitymanagement.model.BookedEvent;
import com.sportsfacilitymanagement.model.Event;
import com.sportsfacilitymanagement.model.Facility;
import com.sportsfacilitymanagement.model.ReviewEvent;
import com.sportsfacilitymanagement.model.ReviewEventParticipant;
import com.sportsfacilitymanagement.model.ReviewFacility;
import com.sportsfacilitymanagement.utility.Constants.EventBookingStatus;
import com.sportsfacilitymanagement.utility.Constants.OpenForPublicStatus;

@Controller
public class EventController {

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private StaffDao staffDao;

	@Autowired
	private FacilityDao facilityDao;

	@Autowired
	private ReviewEventDao reviewEventDao;

	@Autowired
	private ReviewEventParticipantDao reviewEventParticipantDao;

	@Autowired
	private BookedEventDao bookedEventDao;

	@Autowired
	private EventDao eventDao;

	@GetMapping("/addEvent")
	public String goToAddeventPage() {
		return "addevent";
	}

	@PostMapping("/addEvent")
	public ModelAndView addEvent(@ModelAttribute Event event) {
		ModelAndView mv = new ModelAndView();

		if (this.eventDao.save(event) != null) {
			mv.addObject("status", "Event Added Successful!!");
			List<Event> events = this.eventDao.findAll();
			mv.addObject("events", events);
			mv.setViewName("viewallevents");

			mv.setViewName("index");
		}

		else {
			mv.addObject("status", "Failed to add the event!!!");
			mv.setViewName("index");
		}

		return mv;
	}

	@GetMapping("/viewmyhostedevents")
	public ModelAndView viewmybookedFacility(@RequestParam("hostId") Integer hostId,
			@RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();

		List<Event> events = this.eventDao.findByHostIdAndRoleOrderByIdDesc(hostId, role);

		mv.addObject("events", events);
		mv.setViewName("viewmyhostedevents");
		return mv;
	}

	@GetMapping("/viewallevents")
	public ModelAndView viewallevents() {
		ModelAndView mv = new ModelAndView();

		List<Event> events = this.eventDao.findAll();

		mv.addObject("events", events);
		mv.setViewName("viewallevents");
		return mv;
	}

	@GetMapping("/applyForEvent")
	public ModelAndView applyForEvent(@RequestParam("eventId") Integer eventId, @RequestParam("userId") Integer userId,
			@RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();
		List<Event> events = this.eventDao.findAll();

		Event checkEvent = this.eventDao.findByIdAndHostIdAndRole(eventId, userId, role);

		if (checkEvent != null) {
			mv.addObject("status", "Your are host of this Event, Can't apply your own event!!!");
			mv.addObject("events", events);
			mv.setViewName("viewallevents");
			return mv;
		}

		Event event = this.eventDao.findById(eventId).get();

		if (role.equals("staff")) {
			if (event.getOpenToPublic().equals(OpenForPublicStatus.NO.value())) {
				mv.addObject("error", "Staff can't apply for this Event!!!");
				mv.addObject("events", events);
				mv.setViewName("viewallevents");
				return mv;
			}
		}

		BookedEvent checkBooking = this.bookedEventDao.findByParticipantIdAndRoleAndEventId(userId, role, eventId);

		if (checkBooking != null) {
			mv.addObject("error", "You have already applied for this Event");
			mv.addObject("events", events);
			mv.setViewName("viewallevents");
			return mv;
		}

		List<BookedEvent> allApprovedBooking = this.bookedEventDao.findByEventIdAndStatus(eventId,
				EventBookingStatus.APPROVED.value());

		if (!CollectionUtils.isEmpty(allApprovedBooking)) {
			if (allApprovedBooking.size() >= event.getMaxParticipant()) {
				mv.addObject("status", "Can't Apply for this Event, Slot not available!!!");
				mv.addObject("events", events);
				mv.setViewName("viewallevents");
				return mv;
			}
		}

		BookedEvent bookEvent = new BookedEvent();
		bookEvent.setBookingTime(
				String.valueOf(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()));
		bookEvent.setEventId(eventId);
		bookEvent.setParticipantId(userId);
		bookEvent.setRole(role);
		bookEvent.setStatus(EventBookingStatus.PENDING.value());

		this.bookedEventDao.save(bookEvent);

		mv.addObject("status", "Successfully Applied for the Event!!!");
		mv.addObject("events", events);
		mv.setViewName("viewallevents");
		return mv;
	}

	@GetMapping("/viewmyappliedevents")
	public ModelAndView viewmyappliedevents(@RequestParam("userId") Integer userId, @RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();

		List<BookedEvent> bookedEvents = this.bookedEventDao.findByParticipantIdAndRole(userId, role);

		mv.addObject("bookedEvents", bookedEvents);
		mv.setViewName("viewmyappliedevents");
		return mv;
	}

	@GetMapping("/vieweventparticipants")
	public ModelAndView vieweventparticipants(@RequestParam("eventId") Integer eventId) {
		ModelAndView mv = new ModelAndView();

		List<BookedEvent> bookedEquipments = this.bookedEventDao.findByEventId(eventId);

		mv.addObject("bookedEvents", bookedEquipments);
		mv.setViewName("vieweventparticipants");
		return mv;
	}

	@GetMapping("/updateBookingStatus")
	public ModelAndView updateBookingStatus(@RequestParam("bookingId") Integer bookingId,
			@RequestParam("status") String status) {
		ModelAndView mv = new ModelAndView();

		BookedEvent booking = this.bookedEventDao.findById(bookingId).get();
		booking.setStatus(status);

		this.bookedEventDao.save(booking);

		mv.addObject("status", "Event Booking Status Updated Successful!!!");
		List<Event> events = this.eventDao.findAll();
		mv.addObject("events", events);
		mv.setViewName("viewallevents");

		return mv;
	}

	@GetMapping("/addeventreview")
	public ModelAndView addeventreview(@RequestParam("eventId") Integer eventId, @RequestParam("userId") Integer userId,
			@RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();
		Event event = this.eventDao.findById(eventId).get();
		mv.addObject("event", event);
		mv.addObject("role", role);
		mv.addObject("userId", userId);
		mv.setViewName("addeventreview");

		return mv;
	}

	@GetMapping("/addEventReview")
	public ModelAndView addEventReview(@RequestParam("eventId") Integer eventId, @RequestParam("userId") Integer userId,
			@RequestParam("role") String role, @RequestParam("review") String review) {
		ModelAndView mv = new ModelAndView();

		ReviewEvent reviewEvent = new ReviewEvent();
		reviewEvent.setAddedTime(
				String.valueOf(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()));
		reviewEvent.setEventId(eventId);
		reviewEvent.setParticipantId(userId);
		reviewEvent.setReview(review);
		reviewEvent.setRole(role);

		ReviewEvent savedReview = this.reviewEventDao.save(reviewEvent);

		if (savedReview != null) {
			mv.addObject("status", "Review added successful!!!");
		}

		else {
			mv.addObject("status", "Failed to add review");
		}

		mv.setViewName("index");

		return mv;
	}

	@GetMapping("/vieweventreviews")
	public ModelAndView viewEventReview(@RequestParam("eventId") Integer eventId) {
		ModelAndView mv = new ModelAndView();

		List<ReviewEvent> reviews = this.reviewEventDao.findByEventId(eventId);

		mv.addObject("reviews", reviews);
		mv.setViewName("vieweventreviews");
		return mv;
	}

	@GetMapping("/addparticipantreview")
	public ModelAndView addparticipantreview(@RequestParam("eventId") Integer eventId,
			@RequestParam("participantId") Integer participantId, @RequestParam("role") String role) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("eventId", eventId);
		mv.addObject("role", role);
		mv.addObject("participantId", participantId);
		mv.setViewName("addparticipantreview");

		return mv;
	}

	@GetMapping("/addParticipantReview")
	public ModelAndView addParticipantReview(@RequestParam("eventId") Integer eventId,
			@RequestParam("participantId") Integer participantId, @RequestParam("role") String role,
			@RequestParam("review") String review) {
		ModelAndView mv = new ModelAndView();

		ReviewEventParticipant reviewEventParticipant = new ReviewEventParticipant();
		reviewEventParticipant.setAddedTime(
				String.valueOf(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()));
		reviewEventParticipant.setEventId(eventId);
		reviewEventParticipant.setParticipantId(participantId);
		reviewEventParticipant.setReview(review);
		reviewEventParticipant.setRole(role);

		ReviewEventParticipant savedReview = this.reviewEventParticipantDao.save(reviewEventParticipant);

		if (savedReview != null) {
			mv.addObject("status", "Review added successful!!!");
		}

		else {
			mv.addObject("status", "Failed to add review");
		}

		List<Event> events = this.eventDao.findAll();
		mv.addObject("events", events);
		mv.setViewName("viewallevents");

		return mv;
	}

	@GetMapping("/viewparticipantreviews")
	public ModelAndView viewparticipantreviews(@RequestParam("eventId") Integer eventId) {
		ModelAndView mv = new ModelAndView();

		List<ReviewEventParticipant> reviews = this.reviewEventParticipantDao.findByEventId(eventId);

		mv.addObject("reviews", reviews);
		mv.setViewName("viewparticipantreviews");
		return mv;
	}

}
