package com.r3sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.Session;
import com.r3sys.dao.AgentDao;
import com.r3sys.dao.PolicyDao;
import com.r3sys.dao.PolicyHolderDao;
import com.r3sys.model.Agent;
import com.r3sys.model.PolicyHolder;
import com.r3sys.model.policy;

@Controller
public class PolicyHolderController {

	
	ApplicationContext context =  new ClassPathXmlApplicationContext("config.xml");
	
	
	AgentDao agentDao  =  context.getBean(AgentDao.class);
	PolicyHolderDao policyholderDao = context.getBean(PolicyHolderDao.class);
	 PolicyDao policyDao = context.getBean(PolicyDao.class);
Agent agent2 = context.getBean(Agent.class);
PolicyHolder holder = context.getBean(PolicyHolder.class);


@RequestMapping(path="/policyHolderLogin", method = RequestMethod.POST)
public String loginPolicyHolder(HttpServletRequest request)
{
	 String email = request.getParameter("email");
	 String password = request.getParameter("password");
	 
	 PolicyHolder holder = policyholderDao.getCustomer(email);
	 
	 
	 if (holder != null && holder.getPassword().equals(password)){
		 request.getSession().setAttribute("loggedAgent", holder);
		 return "PolicyHolderDashboard";
		 
	 }
	 else
	 {
		 request.setAttribute("msg", "invalid input ");
		 return "index";
		 
	 }
	 

}


@RequestMapping(path = "/deletePolicyHolder", method = RequestMethod.GET)
public String deleteAcc(HttpServletRequest request) 
{
	String email = request.getParameter("phEmail");
	policyholderDao.deleteCustomer(email);
	return "redirect:/ViewPolicyHolders";
}


@RequestMapping(path="UpdatePolicyHolder",method=RequestMethod.GET)
public String showUpdateForm(HttpServletRequest request) {
	String email = request.getParameter("phEmail");
    PolicyHolder ph = policyholderDao.getCustomer(email);
    request.setAttribute("holder", ph);
    return "UpdatePolicyHolder"; 
}

@RequestMapping(value = "/SubmitUpdatePolicyHolder", method = RequestMethod.POST)
public String submitUpdatePolicyHolder(HttpServletRequest request) {
    String email = request.getParameter("email");

    PolicyHolder holder = policyholderDao.getCustomer(email);
    holder.setName(request.getParameter("name"));
    holder.setDob(request.getParameter("dob"));
    holder.setContact(request.getParameter("contact"));
    holder.setAddress(request.getParameter("address"));
    holder.setPassword(request.getParameter("password"));

    policyholderDao.updateCustomer(holder);
    return "redirect:/ViewPolicyHolders"; // redirect to list
}


@RequestMapping("/viewMyPolicies")
public String viewMyPolicies(HttpServletRequest request) {
    PolicyHolder holder = (PolicyHolder) request.getSession().getAttribute("loggedAgent");
    if (holder != null) {
        String email = holder.getEmail().trim(); // Always trim
        List<policy> myPolicies = policyDao.viewOwnPolicies(email);
        request.setAttribute("myPolicies", myPolicies);
        return "viewMyPolicies";
    } else {
        request.setAttribute("msg", "Please login first.");
        return "index"; // or redirect to login
    }
}

}

//@RequestMapping("/AgentLogin")
//public String openAgentLogin()
//{
//	 return "AgentLogin";		 
//	 
//}
//@RequestMapping(path = "/agentLogin", method = RequestMethod.POST)
//public String login(HttpServletRequest request)
//{
//	 String email = request.getParameter("email");
//	 String password = request.getParameter("password");
//	
//	 Agent agent  =  agentDao.getAgent(email);
//	 
//	 if(agent !=null && agent.getPassword().equals(password))
//	 {
//		 request.getSession().setAttribute("loggedAgent", agent);
//		 return "AgentDashboard";
//		 
//	 }
//	 else
//	 {
//		 
//		 request.setAttribute("msg", "invalid input ");
//		 return "index";
//	 }
//	 
