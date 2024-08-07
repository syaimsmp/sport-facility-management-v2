package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.Event;

@Repository
public interface EventDao extends JpaRepository<Event, Integer> {

	List<Event> findByHostIdAndRoleOrderByIdDesc(Integer hostId, String role);

	Event findByIdAndHostIdAndRole(Integer eventId, Integer userId, String role);

}
