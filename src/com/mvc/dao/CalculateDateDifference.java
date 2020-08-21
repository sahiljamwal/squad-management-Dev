package com.mvc.dao;

import java.time.Duration;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

/**
 * This class is used to fetch the number of Days between two days.
 * 
 * @author sahil
 *
 */
public class CalculateDateDifference {

	/**
	 * 
	 * @param startDate - startDate entered by user
	 * @param endDate   - endDate entered by user
	 * @return The no of days between startDate and endDate
	 */
	public static float calculateNoOfDays(String startDate, String endDate) {
		LocalDate day1 = LocalDate.parse(startDate, DateTimeFormatter.ISO_LOCAL_DATE);
		LocalDate day2 = LocalDate.parse(endDate, DateTimeFormatter.ISO_LOCAL_DATE);
		Duration diff = Duration.between(day1.atStartOfDay(), day2.atStartOfDay());
		long diffDays = diff.toDays() + 1;
		return diffDays;
	}

	public static String getCurrenDate() {
		LocalDate today = LocalDate.now(ZoneId.of("Asia/Kolkata"));
		String output = today.toString();

		return output;
	}
}
