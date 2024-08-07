package com.sportsfacilitymanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.sportsfacilitymanagement.model.Student;

@Repository
public interface StudentDao extends JpaRepository<Student, Integer> {
	
	Student findByEmailidAndPassword(String emailId, String password);
	Student findByEmailid(String emailId);
	Student findByEmailidAndMobileno(String emailId, String mobileNo);

}
