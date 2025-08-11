package com.r3sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.r3sys.dao.AgentDao;
import com.r3sys.dao.PolicyDao;
import com.r3sys.dao.PolicyHolderDao;
import com.r3sys.model.Agent;
import com.r3sys.model.PolicyHolder;

@Controller
public class AdminController {
	
	ApplicationContext conntext = new ClassPathXmlApplicationContext("config.xml");
	
	
	AgentDao agentDao  =  conntext.getBean(AgentDao.class);
	PolicyHolderDao policyholderDao = conntext.getBean(PolicyHolderDao.class);
	 PolicyDao policyDao = conntext.getBean(PolicyDao.class);
Agent agent2 = conntext.getBean(Agent.class);
PolicyHolder holder = conntext.getBean(PolicyHolder.class);

	@RequestMapping("/")
	public String openindex()
	{
		System.out.println("open login page ");
		return "index";
		
	}
	
	
	@RequestMapping("/index")
	public String openinde1x()
	{
		System.out.println("open login page ");
		return "index";
		
	}

	// HAdmin login page 
	@RequestMapping("/admin")
	public String openAdminLogin()
	{
		return "adminlogin";
		
	}
	
	@RequestMapping("/pendingagent")
	public String openPendingAgent(){
		return "pendingagent";
	}
	
	@RequestMapping("/ViewPendingAgents")
	public String viewPendingAgents(HttpServletRequest request) {
	    List<Agent> pendingAgents = agentDao.getAgentsByStatus("pending");
	    request.setAttribute("pendingAgents", pendingAgents);
	    return "pendingAgents"; // JSP filename
	}
	
	
	
	
	@RequestMapping(path ="/AdminLoginSubmit",method= RequestMethod.POST)
	public String loginSubmit(HttpServletRequest request){
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email.equals("admin@gmail.com")&&password.equals("admin")){
			return "admindashboard";
			
		}
		else
		{
			request.setAttribute("error", "Invalid credentials");
			return "adminlogin";
			
		}
		
}
	
	
	@RequestMapping("/viewAgents")
	public String viewAgents(HttpServletRequest request) {
	    List<Agent> allAgents = agentDao.getAllAgents();
	    request.setAttribute("allAgents", allAgents);
	    return "viewAgents";  // This matches viewAgents.jsp
	}

	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	public String changeStatus(HttpServletRequest request) {
	    String email = request.getParameter("iaEmail");
	    String newStatus = request.getParameter("newStatus");

	    Agent agent = agentDao.getAgent(email);
	    if (agent != null && newStatus != null && !newStatus.isEmpty()) {
	        agent.setStatus(newStatus);
	        agentDao.updateAgent(agent);
	    }

	    // Redirect back to the agent list
	    return "redirect:/viewAgents";
	}
	
}
