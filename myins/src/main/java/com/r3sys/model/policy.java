package com.r3sys.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class policy {

	
	@Override
	public String toString() {
		return "policy [pid=" + pid + ", holderName=" + holderName + ", dob=" + dob + ", contact=" + contact
				+ ", phEmail=" + phEmail + ", policyTitle=" + policyTitle + ", policyDetail=" + policyDetail
				+ ", dueDate=" + dueDate + ", iaEmail=" + iaEmail + "]";
	}
	
	
	public int getId() {
		return pid;
	}
	public void setId(int pid) {
		this.pid = pid;
	}
	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPhEmail() {
		return phEmail;
	}
	public void setPhEmail(String phEmail) {
		this.phEmail = phEmail;
	}
	public String getPolicyTitle() {
		return policyTitle;
	}
	public void setPolicyTitle(String policyTitle) {
		this.policyTitle = policyTitle;
	}
	public String getPolicyDetail() {
		return policyDetail;
	}
	public void setPolicyDetail(String policyDetail) {
		this.policyDetail = policyDetail;
	}
	public LocalDate getDueDate() {
		return dueDate;
	}
	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}
	public String getIaEmail() {
		return iaEmail;
	}
	public void setIaEmail(String iaEmail) {
		this.iaEmail = iaEmail;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private  int pid;
	private String  holderName;
	private String  dob;
	private String  contact;
	private String  phEmail;
	private String policyTitle;
	private String policyDetail;
	private LocalDate dueDate;
	private String iaEmail;

	
	//ia means  insaurance agent email;
	

	
	
}
