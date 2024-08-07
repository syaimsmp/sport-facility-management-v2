package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.BookedEquipment;

@Repository
public interface BookedEquipmentDao extends JpaRepository<BookedEquipment, Integer> {

	List<BookedEquipment> findByParticipantIdAndRoleAndDateContainingIgnoreCase(Integer userId, String role,
			String monthYear);

	List<BookedEquipment> findByParticipantIdAndRole(Integer userId, String role);

}
