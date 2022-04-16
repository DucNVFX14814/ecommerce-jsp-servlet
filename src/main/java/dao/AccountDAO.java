package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBContext;
import model.Account;

public class AccountDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Account login(String email, String password) {
		String query = "select * from Account\r\n"
				+ "where user_mail = ?\r\n"
				+ "and password = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				return (new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void register(Account acc) {
		String query = "insert into Account\r\n"
				+ "values (?, ?, ?, ?, ?, ?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, acc.getEmail());
			ps.setString(2, acc.getPassword());
			ps.setInt(3, acc.getRole());
			ps.setString(4, acc.getName());
			ps.setString(5, acc.getAddress());
			ps.setString(6, acc.getPhone());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkAccountExist(String email) {
		String query = "select * from Account\r\n"
				+ "where user_mail = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
