package com.sportsfacilitymanagement.utility;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class Helper {

	public static String getAlphaNumericOrderId(int n) {

		// chose a Character random from this String
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

		// create StringBuffer size of AlphaNumericString
		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {

			// generate a random number between
			// 0 to AlphaNumericString variable length
			int index = (int) (AlphaNumericString.length() * Math.random());

			// add Character one by one in end of sb
			sb.append(AlphaNumericString.charAt(index));
		}

		return sb.toString();
	}

	public static String getCurrentYearMonth(String date) {
		// Define the input date format (assuming it's in "yyyy-MM-dd" format)
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		// Parse the input date string to LocalDate
		LocalDate localDate = LocalDate.parse(date, inputFormatter);

		// Define the output format
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM");

		// Format the LocalDate to desired output format
		return localDate.format(outputFormatter);
	}

	public static String millisToDateTime(String millisStr) {
		try {
			long millis = Long.parseLong(millisStr);
			Instant instant = Instant.ofEpochMilli(millis);
			LocalDateTime dateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			return dateTime.format(formatter);
		} catch (NumberFormatException e) {
			// Handle the case where millisStr is not a valid long number
			e.printStackTrace();
			return "Invalid Milliseconds";
		}
	}

}
