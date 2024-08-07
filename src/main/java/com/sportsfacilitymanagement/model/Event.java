package com.sportsfacilitymanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	private int hostId;

	private String name;

	private String role;

	private int facilityId; // event for badminton, tennis, gym

	private String openToPublic; // yes or no --> if yes --> staffs can also partificate else no

	private String dateTime;

	private int maxParticipant;

	private int minParticipant;

	private String venue;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getHostId() {
		return hostId;
	}

	public void setHostId(int hostId) {
		this.hostId = hostId;
	}

	public int getFacilityId() {
		return facilityId;
	}

	public void setFacilityId(int facilityId) {
		this.facilityId = facilityId;
	}

	public String getOpenToPublic() {
		return openToPublic;
	}

	public void setOpenToPublic(String openToPublic) {
		this.openToPublic = openToPublic;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public int getMaxParticipant() {
		return maxParticipant;
	}

	public void setMaxParticipant(int maxParticipant) {
		this.maxParticipant = maxParticipant;
	}

	public int getMinParticipant() {
		return minParticipant;
	}

	public void setMinParticipant(int minParticipant) {
		this.minParticipant = minParticipant;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
