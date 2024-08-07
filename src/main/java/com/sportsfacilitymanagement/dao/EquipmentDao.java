package com.sportsfacilitymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportsfacilitymanagement.model.Equipment;

@Repository
public interface EquipmentDao extends JpaRepository<Equipment, Integer> {

	List<Equipment> findByStatus(String status);

}
