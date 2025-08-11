package com.r3sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.Model;
import org.springframework.context.ApplicationContext;

import com.r3sys.dao.AgentDao;
import com.r3sys.dao.PolicyDao;
import com.r3sys.dao.PolicyHolderDao;
import com.r3sys.model.Agent;
import com.r3sys.model.PolicyHolder;
import com.r3sys.model.policy;

import jdk.nashorn.internal.runtime.Context;

@Controller
public class AgentController {

	private static final Object agent = null;

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	
	AgentDao agentDao  =  context.getBean(AgentDao.class);
	PolicyHolderDao policyholderDao = context.getBean(PolicyHolderDao.class);
	 PolicyDao policyDao = context.getBean(PolicyDao.class);
//Agent agent2 = context.getBean(Agent.class);
//	 
	 
	 
	 @RequestMapping("/AgentLogin")
	 public String openAgentLogin()
	 {
		 return "AgentLogin";		 
		 
	 }
	@RequestMapping(path = "/agentLogin", method = RequestMethod.POST)
	 public String login(HttpServletRequest request)
	 {
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
		
		 Agent agent  =  agentDao.getAgent(email);
		 
		 if(agent !=null && agent.getPassword().equals(password))
		 {
			 request.getSession().setAttribute("loggedAgent", agent);
			 return "AgentDashboard";
			 
		 }
		 else
		 {
			 
			 request.setAttribute("msg", "invalid input ");
			 return "index";
		 }
		 
		 
	 }
	
	
	
	
//	@RequestMapping(value = "/viewPolicyHolder", method = RequestMethod.GET)
//	public String viewPolicyHolderByAgent(HttpSession session, Model model) {
//	    String agentEmail = (String) session.getAttribute("loggedInAgentEmail");
//
//	    List<PolicyHolder> allPolicyHolders = policyholderDao.getAllCustomer();
//	    List<PolicyHolder> myPolicyHolders = new ArrayList<PolicyHolder>();
//
//	    for (PolicyHolder ph : allPolicyHolders) {
//	        if (ph.getAddedBy() != null && ph.getAddedBy().equals(agentEmail)) {
//	            myPolicyHolders.add(ph);
//	        }
//	    }
//
//	    model.addAttribute("policyHolders", myPolicyHolders);
//	    return "viewPolicyHolder";
//	}
	

	@RequestMapping("/PolicyHolderLogin")
	 public String policyholderlogin()
	 {
		 return "PolicyHolderLogin";
	 }
	 
	@RequestMapping("/AgentDashboard")
	 public  String openAgentDash()
	 {
		 System.out.println("openinng  agent dashboard ");
		 return "AgentDashboard";
	 }
	
	
	@RequestMapping("/AddPolicyHolder")
	public  String openAddPolicyHolder()
	{
		System.out.println("opening AddPolicyHolder");
		return "AddPolicyHolder";
		
	}
	
	@RequestMapping("/AddPolicy")
	public String addpolicy(){
		
		return "AddPolicy";
	}
	//****************************************************************************************
	@RequestMapping("/ViewPolicyHolders")
	public String viewAll(Model m) 
	{
		List<PolicyHolder> getAllHolders = policyholderDao.getAllCustomer();
		m.addAttribute("getAllHolders", getAllHolders);
		return "ViewPolicyHolders";
	}
	//******************************************************************************************
	@RequestMapping("/AgentRegister")
	public String openAgent() {
		System.out.println("agent has been opened ");
		return "AgentRegister";
	}

	@RequestMapping(path = "/SubmitAddAgent", method = RequestMethod.POST)
	public String addAgent(HttpServletRequest request) {
		Agent ag = new Agent(); // Create a new agent object

//		@Id
//		private String email;
//		private String name;
//		private String dob;
//		private String contact;
//		private String address;
//		private String password;
//		private  String status;
//		public String getStatus() {
//			return status;
		
		// Get form values from request
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String Contact = request.getParameter("Contact");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String status = request.getParameter("status");

		// Set to model object
		ag.setEmail(email);
		ag.setName(name);
		ag.setDob(dob);
		ag.setContact(Contact);
		ag.setAddress(address);
		ag.setPassword(password);
		ag.setStatus("pending");

	
	agentDao.insert(ag);
		
		System.out.println("Agent added: " + ag);

		// Here you can add logic to save the agent (e.g., DAO or service call)
			return "AgentSuccess";
	 // JSP to be shown after success
	}
	
	
	@RequestMapping( path = "/SubmitAddPolicyHolder", method = RequestMethod.POST )
	public String addpolicy(HttpServletRequest request) {
		PolicyHolder ag = new PolicyHolder();
	
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String dob = request.getParameter("dob");
	String contact = request.getParameter("contact");
	String address = request.getParameter("address");
	String password = request.getParameter("password");
	
	ag.setEmail(email);
	ag.setName(name);
	ag.setDob(dob);
	ag.setContact(contact);
	ag.setAddress(address);
	ag.setPassword(password);
	policyholderDao.insert(ag);
	
	System.out.println("The policy holder has been added");
	
	
	return "PolicyHolderDashboard";
	

	}
}