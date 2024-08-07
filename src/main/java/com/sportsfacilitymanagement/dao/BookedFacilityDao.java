package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.BookedFacility;

@Repository
public interface BookedFacilityDao extends JpaRepository<BookedFacility, Integer> {

	List<BookedFacility> findByParticipantIdAndRoleAndDateContainingIgnoreCase(Integer userId, String role,
			String monthYear);

	List<BookedFacility> findByParticipantIdAndRole(Integer userId, String role);

}
