/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.microlabs.form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import com.microlabs.utils.IdValuePair;

/** 
 * MyEclipse Struts
 * Creation date: 02-08-2013
 * 
 * XDoclet definition:
 * @struts.form name="OthmatoutForm"
 */
public class OthmatoutForm extends ActionForm {

	// ge_othermat_master fields
	private String finyear;
	private String locationid;
	private String gateno;
	private String godcno;
	private String godcdate;
	private String sentby;
	private String sentdept;
	private String destination;
	private String exptimeout;
	private String type;
	private String expretdate;
	private String remarks;
	
	
	// ge_othermat_details fields
	private String itemno;
	private String itemcode;
	private String itemdesc;
	private String uom;
	private String noofcases;
	private String qty;
	private String qtyrcvd;
	
	private String message;

	private ArrayList<IdValuePair> deptlist;
	
	// getters and setters
	public String getFinyear() {
		return finyear;
	}

	public ArrayList<IdValuePair> getDeptlist() {
		return deptlist;
	}

	public void setDeptlist(ArrayList<IdValuePair> deptlist) {
		this.deptlist = deptlist;
	}

	public void setFinyear(String finyear) {
		this.finyear = finyear;
	}

	public String getLocationid() {
		return locationid;
	}

	public void setLocationid(String locationid) {
		this.locationid = locationid;
	}

	public String getGateno() {
		return gateno;
	}

	public void setGateno(String gateno) {
		this.gateno = gateno;
	}

	public String getGodcno() {
		return godcno;
	}

	public void setGodcno(String godcno) {
		this.godcno = godcno;
	}

	public String getGodcdate() {
		return godcdate;
	}

	public void setGodcdate(String godcdate) {
		this.godcdate = godcdate;
	}

	public String getSentby() {
		return sentby;
	}

	public void setSentby(String sentby) {
		this.sentby = sentby;
	}

	public String getSentdept() {
		return sentdept;
	}

	public void setSentdept(String sentdept) {
		this.sentdept = sentdept;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getExptimeout() {
		return exptimeout;
	}

	public void setExptimeout(String exptimeout) {
		this.exptimeout = exptimeout;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getExpretdate() {
		return expretdate;
	}

	public void setExpretdate(String expretdate) {
		this.expretdate = expretdate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getItemno() {
		return itemno;
	}

	public void setItemno(String itemno) {
		this.itemno = itemno;
	}

	public String getItemcode() {
		return itemcode;
	}

	public void setItemcode(String itemcode) {
		this.itemcode = itemcode;
	}

	public String getItemdesc() {
		return itemdesc;
	}

	public void setItemdesc(String itemdesc) {
		this.itemdesc = itemdesc;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getNoofcases() {
		return noofcases;
	}

	public void setNoofcases(String noofcases) {
		this.noofcases = noofcases;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getQtyrcvd() {
		return qtyrcvd;
	}

	public void setQtyrcvd(String qtyrcvd) {
		this.qtyrcvd = qtyrcvd;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	

}