package com.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bank.connection.Connector;
import com.bank.dto.Customer;

public class CustomerDAOimpl implements CustomerDAO {

	private Connection con;

	public CustomerDAOimpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public Customer insertCustomer(Customer c) {
	    String query = "INSERT INTO CUSTOMER(NAME, PHONE, MAIL, PIN) VALUES(?, ?, ?, ?)";
	    String[] generatedColumns = {"ACCNO"}; // Column name that stores the auto-generated account number
	    
	    try {
	        con.setAutoCommit(false);
	        
	        // Create prepared statement with flag to return generated keys
	        PreparedStatement p = con.prepareStatement(query, generatedColumns);
	        p.setString(1, c.getName());
	        p.setLong(2, c.getPhone());
	        p.setString(3, c.getMail());
	        p.setInt(4, c.getPin());
	        
	        int affectedRows = p.executeUpdate();
	        
	        if (affectedRows > 0) {
	            // Retrieve the generated account number
	            try (ResultSet generatedKeys = p.getGeneratedKeys()) {
	                if (generatedKeys.next()) {
	                    long accno = generatedKeys.getLong(1);
	                    c.setACC_NO(accno); // Set the generated account number
	                    con.commit();
	                    return c; // Return the complete customer object with account number
	                }
	            }
	        }
	        con.rollback();
	    } catch (SQLException e) {
	        try {
	            con.rollback();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        e.printStackTrace();
	    } finally {
	        try {
	            con.setAutoCommit(true);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return null; // Return null if insertion failed
	}

	@Override
	public Customer getCustomer(long accno, int pin) {
		String query = "SELECT * FROM CUSTOMER WHERE ACC_NO=? AND PIN=?";
		Customer c = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1, accno);
			ps.setInt(2, pin);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Customer();
				c.setACC_NO(rs.getLong("acc_no"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("mail"));
				c.setBalance(rs.getDouble("balance"));
				c.setPin(rs.getInt("pin"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public Customer getCustomer(long phone, String mail) {
		String query = "SELECT * FROM CUSTOMER WHERE PHONE=? AND MAIL=?";
		Customer c = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Customer();
				c.setACC_NO(rs.getLong("acc_no"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("mail"));
				c.setBalance(rs.getDouble("balance"));
				c.setPin(rs.getInt("pin"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public Customer getCustomer(long accno) {
		String query = "SELECT * FROM CUSTOMER WHERE ACC_NO=?";
		Customer c = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1, accno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Customer();
				c.setACC_NO(rs.getLong("acc_no"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("mail"));
				c.setBalance(rs.getDouble("balance"));
				c.setPin(rs.getInt("pin"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public ArrayList<Customer> getCustomer() {
		String query = "SELECT * FROM CUSTOMER";
		Customer c = null;
		ArrayList<Customer> arr = new ArrayList<Customer>();
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Customer();
				c.setACC_NO(rs.getLong("acc_no"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("mail"));
				c.setBalance(rs.getDouble("balance"));
				c.setPin(rs.getInt("pin"));
				arr.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public boolean updateCustomer(Customer c) {
		int i = 0;
		String query = "UPDATE CUSTOMER SET NAME=?,PHONE=?,MAIL=?,BALANCE=?,PIN=? WHERE ACC_NO=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setDouble(4, c.getBalance());
			ps.setInt(5, c.getPin());
			ps.setLong(6, c.getACC_NO());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteCustomer(Customer c) {
		String query = "DELETE FROM CUSTOMER WHERE ACC_NO=?";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1, c.getACC_NO());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public double getTotalBalance() {
		String query = "SELECT SUM(BALANCE) FROM CUSTOMER";
		double totalBalance = 0.0;

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) { 
				totalBalance = rs.getDouble(1); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalBalance;
	}

	@Override
	public int getCustomerCount() {
		String query = "SELECT COUNT(*) FROM CUSTOMER";
		int count = 0;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
