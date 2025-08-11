package com.r3sys.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.r3sys.*;
import com.r3sys.model.policy;



@Component
public class PolicyDao 
{	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	// inserting the data
@Transactional
	public int insert(policy policy) {
	// insert
	Integer i = (Integer) this.hibernateTemplate.save(policy);
	return i;
	}
	
	
	// get the single data(object)
	public policy getCustomer(int custId) {
		
		policy policy = this.hibernateTemplate.get(policy.class, custId);
	return policy;
	}
	
	
	// get all students(all rows)
	public List<policy> getAllCustomer() {
	List<policy> policy= this.hibernateTemplate.loadAll(policy.class);
	return policy;
	
	}
	
	
	// deleting the data
	@Transactional //for making transaction with database like insert, delete, update
	public void deleteCustomer(int custId) {
		policy policy = this.hibernateTemplate.get(policy.class, custId);
	this.hibernateTemplate.delete(policy);
	
	
	}
	
	// updating data...
	@Transactional //for making transaction with database like insert, delete, update
	public void updateCustomer(policy policy) {
	this.hibernateTemplate.update(policy);
	}
	
	
	public HibernateTemplate getHibernateTemplate() {
	return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
	this.hibernateTemplate = hibernateTemplate;
	}
	
	//******************************************************************************
	public List<policy> viewOwnPolicies(String email) {
		List<policy> allPolicies = hibernateTemplate.loadAll(policy.class);
		List<policy> ownPolicies = new ArrayList<policy>();

		for (policy policy : allPolicies) {
			if (policy.getPhEmail() != null && email != null &&
			    policy.getPhEmail().trim().equalsIgnoreCase(email.trim())) {
				ownPolicies.add(policy);
			}
		}

		return ownPolicies;
	}


	
}
