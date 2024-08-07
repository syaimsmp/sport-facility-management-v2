package com.sportsfacilitymanagement.utility;

public class Constants {

	public enum FacilityOrEquipmentStatus {
		AVAILABLE("Available"), UNDER_MAINTENANCE("Under Maintenance"), CLOSED("Closed");

		private String status;

		private FacilityOrEquipmentStatus(String status) {
			this.status = status;
		}

		public String value() {
			return this.status;
		}

	}

	public enum FacilityBanStatus {
		YES("Yes"), NO("No");

		private String status;

		private FacilityBanStatus(String status) {
			this.status = status;
		}

		public String value() {
			return this.status;
		}

	}

	public enum OpenForPublicStatus {
		YES("Yes"), NO("No");

		private String status;

		private OpenForPublicStatus(String status) {
			this.status = status;
		}

		public String value() {
			return this.status;
		}

	}
	
	public enum EventBookingStatus {
		APPROVED("Approved"),
		PENDING("Pending"),
		REJECT("Rejected");

		private String status;

		private EventBookingStatus(String status) {
			this.status = status;
		}

		public String value() {
			return this.status;
		}

	}

}
