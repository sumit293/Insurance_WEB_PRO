package com.r3sys.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class PolicyHolder {


	
	public PolicyHolder() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "pholder [email=" + email + ", name=" + name + ", dob=" + dob + ", contact=" + contact + ", address="
				+ address + ", password=" + password + "]";
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public PolicyHolder(String email, String name, String dob, String contact, String address, String password) {
		super();
		this.email = email;
		this.name = name;
		this.dob = dob;
		this.contact = contact;
		this.address = address;
		this.password = password;
	}
	
	@Id
	private String email;
	private String name;
	private String dob;
	private String contact;
	private String address;
	private String password;
	
}
