package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.ReviewEvent;

@Repository
public interface ReviewEventDao extends JpaRepository<ReviewEvent, Integer> {

	List<ReviewEvent> findByEventId(Integer eventId);

}
