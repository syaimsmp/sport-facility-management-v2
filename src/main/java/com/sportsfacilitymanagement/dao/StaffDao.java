package com.sportsfacilitymanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.Staff;

@Repository
public interface StaffDao extends JpaRepository<Staff, Integer> {
	
	Staff findByEmailidAndPassword(String emailId, String password);
	Staff findByEmailid(String emailId);
	Staff findByEmailidAndMobileno(String emailId, String mobileNo);

}
