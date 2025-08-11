package com.r3sys.model;



import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.stereotype.Component;

import com.sun.javafx.beans.IDProperty;

@Entity
@Component
public class Agent {



    @Id
    private String email;
    private String name;
    private String dob;
    private String contact;
    private String address;
    private String password;

    //  Add this line just below the existing fields
    private String status;

    public Agent() {
        super();
    }

    @Override
    public String toString() {
        return "Agent [email=" + email + ", name=" + name + ", dob=" + dob + ", contact=" + contact + ", address="
                + address + ", password=" + password + ", status=" + status + "]";
    }

    // Getters and Setters
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    //  Getter and Setter for status
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}

