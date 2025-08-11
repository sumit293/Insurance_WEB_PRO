package com.r3sys.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.r3sys.model.Agent;

@Component
public class AgentDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Transactional
    public String insert(Agent agent) {
        return (String) this.hibernateTemplate.save(agent); 
    }

    public Agent getAgent(String email) {
        return this.hibernateTemplate.get(Agent.class, email);
    }

    public List<Agent> getAllAgents() {
        return this.hibernateTemplate.loadAll(Agent.class);
    }

    @Transactional
    public void deleteAgent(String email) {
        Agent agent = this.hibernateTemplate.get(Agent.class, email);
        if (agent != null) {
            this.hibernateTemplate.delete(agent);
        }
    }

    @Transactional
    public void updateAgent(Agent agent) {
        this.hibernateTemplate.update(agent);
    }

    // Getters & Setters
    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }
    
    @SuppressWarnings("unchecked")
    public List<Agent> getAgentsByStatus(String status) {
        String hql = "FROM Agent WHERE status = ?";
        return (List<Agent>) hibernateTemplate.find(hql, status);
    }
    
}
