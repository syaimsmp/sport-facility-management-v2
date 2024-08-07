package com.sportsfacilitymanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.ReviewEquipment;

@Repository
public interface ReviewEquipmentDao extends JpaRepository<ReviewEquipment, Integer> {

}
