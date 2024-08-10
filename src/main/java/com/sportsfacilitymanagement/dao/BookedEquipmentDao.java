package com.sportsfacilitymanagement.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.BookedEquipment;

@Repository
public interface BookedEquipmentDao extends JpaRepository<BookedEquipment, Integer> {

	List<BookedEquipment> findByParticipantIdAndRoleAndDateContainingIgnoreCase(Integer userId, String role,
			String monthYear);

	List<BookedEquipment> findByParticipantIdAndRole(Integer userId, String role);

	@Query("SELECT e FROM BookedEquipment e WHERE :startDate < e.endTime AND :endDate > e.bookingTime")
    List<BookedEquipment> findOverlappingBookings(String startDate, String endDate);

}
