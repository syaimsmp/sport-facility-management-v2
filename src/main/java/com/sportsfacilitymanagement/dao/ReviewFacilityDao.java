package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.ReviewFacility;

@Repository
public interface ReviewFacilityDao extends JpaRepository<ReviewFacility, Integer> {

	List<ReviewFacility> findByFacilityId(Integer facilityId);
	
}
