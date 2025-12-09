package com.bank.dto;

public class Transaction {

	private long Tran_id;
	private long User_acc;
	private long Rec_acc;
	private String Tran_date;
	private String Tran_type;
	private double Amount;
	private double Balance;

	public long getTran_id() {
		return Tran_id;
	}

	public void setTran_id(long tran_id) {
		Tran_id = tran_id;
	}

	public long getUser_acc() {
		return User_acc;
	}

	public void setUser_acc(long user_acc) {
		User_acc = user_acc;
	}

	public long getRec_acc() {
		return Rec_acc;
	}

	public void setRec_acc(long rec_acc) {
		Rec_acc = rec_acc;
	}

	public String getTran_date() {
		return Tran_date;
	}

	public void setTran_date(String tran_date) {
		Tran_date = tran_date;
	}

	public String getTran_type() {
		return Tran_type;
	}

	public void setTran_type(String tran_type) {
		Tran_type = tran_type;
	}

	public double getAmount() {
		return Amount;
	}

	public void setAmount(double amount) {
		Amount = amount;
	}

	public double getBalance() {
		return Balance;
	}

	public void setBalance(double balance) {
		Balance = balance;
	}

	@Override
	public String toString() {
		return "Transaction [Tran_id=" + Tran_id + ", User_acc=" + User_acc + ", Rec_acc=" + Rec_acc + ", Tran_date="
				+ Tran_date + ", Tran_type=" + Tran_type + ", Amount=" + Amount + ", Balance=" + Balance + "]";
	}
}
