package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;

public class OrdersDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public OrdersDAO() {
		
	}

	//insert information of Order to data source, that including list of
	//products in cart (c) and information of buyer in Orders o
	public int insertOrders (Orders od) {
		String query = "insert into Orders(user_mail, order_status, order_discount_code, order_address, order_phone, order_date) \r\n"
				+ "values (?, ?, ?, ?, ?, ?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, od.getUserMail());
			ps.setInt(2, od.getStatus());
			ps.setString(3, od.getDiscount());
			ps.setString(4, od.getAddress());
			ps.setString(5, od.getPhoneNumber());
			ps.setDate(6, od.getReceivedDate());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String query2 = "select top 1 order_id from Orders\r\n"
				+ "order by order_id desc";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query2);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public void insertOrdersDetail (Cart c, int orderID) {
		String query = "insert into Orders_detail\r\n"
				+ "values (?, ?, ?, ?, ?)";
		try {
			for (Product p : c.getItems()) {
				conn = new DBContext().getConnection();
				ps = conn.prepareStatement(query);
				ps.setInt(1, orderID);
				ps.setInt(2, p.getId());
				ps.setInt(3, p.getNumber());
				ps.setDouble(4, p.getPrice());
				ps.setString(5, p.getName());
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
