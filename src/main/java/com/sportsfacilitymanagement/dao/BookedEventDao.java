package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.BookedEvent;

@Repository
public interface BookedEventDao extends JpaRepository<BookedEvent, Integer> {

	BookedEvent findByParticipantIdAndRoleAndEventId(Integer userId, String role, Integer eventId);

	List<BookedEvent> findByEventIdAndStatus(Integer eventId, String value);

	List<BookedEvent> findByParticipantIdAndRole(Integer userId, String role);

	List<BookedEvent> findByEventId(Integer eventId);

}
