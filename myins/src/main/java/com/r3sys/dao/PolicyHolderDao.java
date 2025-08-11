package com.r3sys.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.r3sys.model.PolicyHolder;



import javax.transaction.*;;

@Component  // Better than @Component for DAO classes
public class PolicyHolderDao {	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	// inserting the data
	@Transactional 
	public String insert(PolicyHolder holder) {
	// insert
		 String i =  (String) this.hibernateTemplate.save(holder);
	return i;
	}
	
	
	// get the single data(object)
	public PolicyHolder getCustomer(String email) {
		
		PolicyHolder holder = this.hibernateTemplate.get(PolicyHolder.class, email);
	return holder;
	}
	
	
	// get all students(all rows)
	public List<PolicyHolder> getAllCustomer() {
	List<PolicyHolder> holder= this.hibernateTemplate.loadAll(PolicyHolder.class);
	return holder;
	
	}
	
	
	// deleting the data
	@Transactional //for making transaction with database like insert, delete, update
	public void deleteCustomer(String email) {
		PolicyHolder holder = this.hibernateTemplate.get(PolicyHolder.class, email);
	this.hibernateTemplate.delete(holder);
	
	
	}
	
	// updating data...
	@Transactional //for making transaction with database like insert, delete, update
	public void updateCustomer(PolicyHolder holder) {
	this.hibernateTemplate.update(holder);
	}
	
	
	public HibernateTemplate getHibernateTemplate() {
	return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
	this.hibernateTemplate = hibernateTemplate;
	}
}
