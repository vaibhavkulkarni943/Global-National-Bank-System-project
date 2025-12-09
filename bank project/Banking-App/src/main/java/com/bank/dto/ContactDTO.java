package com.bank.dto;

import java.time.LocalDateTime;

public class ContactDTO {
    private int contactId;
    private long accountNumber;
    private String name;
    private String email;
    private String phone;
    private String subject;
    private String description;
    private LocalDateTime submissionDate;
    private String status; // "OPEN", "IN_PROGRESS", "RESOLVED"

    // Constructors
    public ContactDTO() {}

    public ContactDTO(long accountNumber, String name, String email, String phone, 
                  String subject, String description) {
        this.accountNumber = accountNumber;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.subject = subject;
        this.description = description;
        this.submissionDate = LocalDateTime.now();
        this.status = "OPEN";
    }

    // Getters and Setters
    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    public long getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(long accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(LocalDateTime submissionDate) {
        this.submissionDate = submissionDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}