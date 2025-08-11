package com.r3sys.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.r3sys.dao.AgentDao;
import com.r3sys.dao.PolicyDao;
import com.r3sys.dao.PolicyHolderDao;
import com.r3sys.model.Agent;
import com.r3sys.model.PolicyHolder;
import com.r3sys.model.policy;

@Controller
public class PolicyController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	
	AgentDao agentDao  =  context.getBean(AgentDao.class);
	PolicyHolderDao policyholderDao = context.getBean(PolicyHolderDao.class);
	 PolicyDao policyDao = context.getBean(PolicyDao.class);
Agent agent2 = context.getBean(Agent.class);
PolicyHolder holder = context.getBean(PolicyHolder.class);

	 

@RequestMapping(path = "/SubmitAddPolicy", method = RequestMethod.POST)
public String addPolicy(HttpServletRequest request) {
    policy p = new policy();

    p.setHolderName(request.getParameter("holderName"));
    p.setDob(request.getParameter("dob"));
    p.setContact(request.getParameter("contact"));
    p.setPhEmail(request.getParameter("phEmail"));
    p.setPolicyTitle(request.getParameter("policyTitle"));
    p.setPolicyDetail(request.getParameter("policyDetail"));
    p.setIaEmail(request.getParameter("iaEmail"));
    
    // Convert string to LocalDate
    LocalDate due = LocalDate.parse(request.getParameter("dueDate"));
    p.setDueDate(due);

    policyDao.insert(p);

    System.out.println("Policy added: " + p);
    return "AgentDashboard";  // Create a success JSP if needed
}

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
//		 request.setAttribute("msg", "invalid input ");
//		 return "index";
//	 }
//	 

//	

@RequestMapping("/ViewPolicy")
public String viewAllPolicies(HttpServletRequest request) {
    List<policy> allPolicies = policyDao.getAllCustomer();
    request.setAttribute("allPolicies", allPolicies);
    return "ViewPolicy";  // Matches ViewPolicy.jsp
}
@RequestMapping("/ViewExpiredPolicies")
public String viewExpired(HttpServletRequest request) {
    List<policy> allPolicies = policyDao.getAllCustomer();
    LocalDate today = LocalDate.now();

    List<policy> expired = allPolicies.stream()
        .filter(p -> p.getDueDate() != null && p.getDueDate().isBefore(today))
        .collect(Collectors.toList());

    request.setAttribute("policies", expired);
    request.setAttribute("filterType", "expired");
    return "ViewNearExpiry";
}

@RequestMapping("/ViewNearExpiry")
public String viewNearExpiry(HttpServletRequest request) {
    List<policy> allPolicies = policyDao.getAllCustomer();
    LocalDate today = LocalDate.now();
    LocalDate oneMonthLater = today.plusMonths(1);

    List<policy> nearExpiry = allPolicies.stream()
        .filter(p -> {
            LocalDate d = p.getDueDate();
            return d != null && !d.isBefore(today) && !d.isAfter(oneMonthLater);
        })
        .collect(Collectors.toList());

    request.setAttribute("policies", nearExpiry);
    request.setAttribute("filterType", "near");
    return "ViewNearExpiry";
}

@RequestMapping("/DeletePolicy")
public String deletePolicy(@RequestParam("pid") int pid, HttpServletRequest request) {
    policyDao.deleteCustomer(pid);  // delete from DB using DAO
    List<policy> allPolicies = policyDao.getAllCustomer();  // get fresh list
    request.setAttribute("allPolicies", allPolicies);
    return "ViewPolicy";  // show updated list
}


@RequestMapping("/UpdatePolicy")
public String showUpdateForm(@RequestParam("pid") int pid, HttpServletRequest request) {
    policy p = policyDao.getCustomer(pid);
    request.setAttribute("policy", p);
    return "UpdatePolicy"; // JSP page name
}

@RequestMapping(path = "/UpdatePolicyDueDate", method = RequestMethod.POST)
public String updateDueDate(HttpServletRequest request) {
    int id = Integer.parseInt(request.getParameter("id"));
    LocalDate newDueDate = LocalDate.parse(request.getParameter("dueDate"));

    policy p = policyDao.getCustomer(id);
    if (p != null) {
        p.setDueDate(newDueDate);
        policyDao.updateCustomer(p);
    }

    return "redirect:/ViewPolicy";
}

}
