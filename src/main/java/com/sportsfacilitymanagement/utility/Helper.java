package com.sportsfacilitymanagement.utility;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
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

	public static long convertToTimestamp(String dateTimeString) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime dateTime = LocalDateTime.parse(dateTimeString, formatter);
		return dateTime.toInstant(ZoneOffset.UTC).toEpochMilli();
	}

	public static boolean isBookingExceedEndTime(String givenDateTimeMillis){

		  // Current datetime
		  LocalDateTime now = LocalDateTime.now();

		    // Convert the String to a long (milliseconds)
			long timestampMillis = Long.parseLong(givenDateTimeMillis);

			// Convert the milliseconds to LocalDateTime
			LocalDateTime dateTime = Instant.ofEpochMilli(timestampMillis)
											.atZone(ZoneOffset.UTC)
											.toLocalDateTime();

		   // Compare the given datetime with the current datetime
		   return dateTime.isBefore(now);
	}

	public static String getCurrentDateTime(){
        // Get the current instant in time
        Instant now = Instant.now();

        // Convert to UTC ZonedDateTime
        ZonedDateTime utcNow = now.atZone(ZoneId.of("UTC"));

        // Format the output
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedUtcNow = utcNow.format(formatter);

        // Print the current UTC time
        return "Current UTC Time: " + formattedUtcNow;
	}
	

}
