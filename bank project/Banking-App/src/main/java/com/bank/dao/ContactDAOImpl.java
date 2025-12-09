package com.bank.dao;

import com.bank.connection.Connector;
import com.bank.dto.ContactDTO;

import java.sql.*;

public class ContactDAOImpl implements ContactDAO {
	private Connection con;

	public ContactDAOImpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public boolean saveContactRequest(ContactDTO contact) {
		System.out.println("wjdndnasnas;nasdf;n");
		String query = "INSERT INTO CONTACT_REQUESTS (account_number, name, email, phone, subject, description, submission_date, status) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			System.out.println("wjdndnasnas;nasdf;n");
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setLong(1, contact.getAccountNumber());
			pstmt.setString(2, contact.getName());
			pstmt.setString(3, contact.getEmail());
			pstmt.setString(4, contact.getPhone());
			pstmt.setString(5, contact.getSubject());
			pstmt.setString(6, contact.getDescription());
			pstmt.setTimestamp(7, Timestamp.valueOf(contact.getSubmissionDate()));
			pstmt.setString(8, contact.getStatus());
			System.out.println("wjdndnasnas;nasdf;n");
			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}