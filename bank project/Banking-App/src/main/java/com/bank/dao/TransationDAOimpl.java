package com.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bank.connection.Connector;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;

public class TransationDAOimpl implements TransactionDAO {

	private Connection con;

	public TransationDAOimpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public boolean insertTransaction(Transaction t) {
		int i = 0;
		String query = "INSERT INTO PASSBOOK VALUES (?,?,?,SYSDATE(),?,?,?)";
		try {
			con.setAutoCommit(false);
			PreparedStatement p = con.prepareStatement(query);
			p.setLong(1, t.getTran_id());
			p.setLong(2, t.getUser_acc());
			p.setLong(3, t.getRec_acc());
			p.setString(4, t.getTran_type());
			p.setDouble(5, t.getAmount());
			p.setDouble(6, t.getBalance());
			i = p.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i > 0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		} else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public ArrayList<Transaction> getTransaction(long user) {
		String query = "SELECT * FROM PASSBOOK WHERE USER_ACC=? ORDER BY TRAN_DATE DESC";
		Transaction t = null;
		ArrayList<Transaction> arr = new ArrayList<Transaction>();
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				t = new Transaction();
				t.setTran_id(rs.getLong("TRAN_ID"));
				t.setUser_acc(rs.getLong("User_ACC"));
				t.setRec_acc(rs.getLong("REC_ACC"));
				t.setTran_date(rs.getString("TRAN_DATE"));
				t.setTran_type(rs.getString("TRAN_TYPE"));
				t.setAmount(rs.getDouble("Amount"));
				t.setBalance(rs.getDouble("Balance"));
				arr.add(t);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<Transaction> getTransation() {
		String query = "SELECT * FROM PASSBOOK ORDER BY TRAN_DATE DESC";
		Transaction t = null;
		ArrayList<Transaction> arr = new ArrayList<Transaction>();
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				t = new Transaction();
				t.setTran_id(rs.getLong("TRAN_ID"));
				t.setUser_acc(rs.getLong("User_ACC"));
				t.setRec_acc(rs.getLong("REC_ACC"));
				t.setTran_date(rs.getString("TRAN_DATE"));
				t.setTran_type(rs.getString("TRAN_TYPE"));
				t.setAmount(rs.getDouble("Amount"));
				t.setBalance(rs.getDouble("Balance"));
				arr.add(t);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public int getTransaction() {
		String query = "SELECT COUNT(*) FROM PASSBOOK";
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

	@Override
	public double getTotalamount() {
			String query = "SELECT SUM(AMOUNT) FROM PASSBOOK";
			double count = 0;
			try {
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					count = rs.getDouble(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
	}