package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.ReviewEventParticipant;

@Repository
public interface ReviewEventParticipantDao extends JpaRepository<ReviewEventParticipant, Integer> {

	List<ReviewEventParticipant> findByEventId(Integer eventId);

}
