package com.sportsfacilitymanagement.services;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportsfacilitymanagement.dao.BookedEquipmentDao;
import com.sportsfacilitymanagement.model.BookedEquipment;
import com.sportsfacilitymanagement.utility.Helper;

@Service
public class BookedEquipmentService {
    
    @Autowired
    private BookedEquipmentDao bookedEquipmentDao;

    public boolean isDateRangeOverlapping(String startDateString, String endDateString) {

        long startDateStr = Helper.convertToTimestamp(startDateString);
        long endDateStr = Helper.convertToTimestamp(endDateString);

        List<BookedEquipment> overlappingBookings = bookedEquipmentDao.findOverlappingBookings(String.valueOf(startDateStr), String.valueOf(endDateStr));
        return !overlappingBookings.isEmpty();
    }
}
