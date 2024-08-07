package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.Facility;

@Repository
public interface FacilityDao extends JpaRepository<Facility, Integer> {
	
	List<Facility> findByStatus(String status);

}
