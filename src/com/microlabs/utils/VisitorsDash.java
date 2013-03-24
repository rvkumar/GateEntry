package com.microlabs.utils;

import java.util.Date;

public class VisitorsDash {
	private String visName;
	private String visCompany;
	private String visPlace;
	private String visPurpose;
	private String visTomeet;
	private String visDepartment;
	private String visDate;
	private String timeIn;
	private String timeOut;
	private int visitorno;
	
	private String updateLink;
	
	public VisitorsDash(String visName, String visCompany, String visPlace, String timeIn, String timeOut, int visitorno) {
		super();
		this.visName = visName;
		this.visCompany = visCompany;
		this.visPlace = visPlace;
		this.timeIn = timeIn;
		this.timeOut = timeOut;
		this.visitorno = visitorno;
	}
	
	public VisitorsDash(String visName, String visCompany, String visPlace,String visPurpose,String visTomeet,String visDepartment,
			String visDate, String timeIn,String timeOut, int visitorno) {
		super();
		this.visName = visName;
		this.visCompany = visCompany;
		this.visPlace = visPlace;
		this.visPurpose = visPurpose;
		this.visTomeet = visTomeet;
		this.visDepartment = visDepartment;
		this.visDate = visDate;
		this.timeIn = timeIn;
		this.timeOut = timeOut;
		this.visitorno = visitorno;
		
		if ( timeOut != null && timeOut.trim().length() > 0 ) {
			updateLink = "";
		}
		else {
			updateLink = "Update Now";
		}
		
	}
	
	
	public String getUpdateLink() {
		return updateLink;
	}

	public void setUpdateLink(String updateLink) {
		this.updateLink = updateLink;
	}

	public int getVisitorno() {
		return visitorno;
	}

	public void setVisitorno(int visitorno) {
		this.visitorno = visitorno;
	}

	public String getVisDate() {
		return visDate;
	}

	public void setVisDate(String visDate) {
		this.visDate = visDate;
	}

	public String getVisTomeet() {
		return visTomeet;
	}

	public void setVisTomeet(String visTomeet) {
		this.visTomeet = visTomeet;
	}

	public String getVisDepartment() {
		return visDepartment;
	}

	public void setVisDepartment(String visDepartment) {
		this.visDepartment = visDepartment;
	}

	public String getVisPurpose() {
		return visPurpose;
	}

	public void setVisPurpose(String visPurpose) {
		this.visPurpose = visPurpose;
	}

	public String getVisName() {
		return visName;
	}
	public void setVisName(String visName) {
		this.visName = visName;
	}
	public String getVisCompany() {
		return visCompany;
	}
	public void setVisCompany(String visCompany) {
		this.visCompany = visCompany;
	}
	public String getVisPlace() {
		return visPlace;
	}
	public void setVisPlace(String visPlace) {
		this.visPlace = visPlace;
	}
	public String getTimeIn() {
		return timeIn;
	}
	public void setTimeIn(String timeIn) {
		this.timeIn = timeIn;
	}
	public String getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(String timeOut) {
		this.timeOut = timeOut;
	}
	
	
	
	
}
