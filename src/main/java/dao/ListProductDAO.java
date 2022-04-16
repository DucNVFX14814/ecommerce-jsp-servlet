package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// get all the product
	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Products\r\n" + "order by product_price";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// get all the product by price range
	public List<Product> getAllProductsByPriceRange(String start, String end) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Products\r\n" + "where product_price between ? and ?\r\n"
				+ "order by product_price";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, start);
			ps.setString(2, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// get the product by id
	public Product getProduct(String id) {
		String query = "select * from Products\r\n" + "	where product_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return (new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	// return the list of products by product name
	public List<Product> searchByName(String name) {
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Products\r\n"
				+ "where product_name like ?\r\n"
				+ "order by product_price";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

//	public static void main(String[] args) {
//		ListProductDAO listDAO = new ListProductDAO();
//		List<Product> list = listDAO.searchByName("xx");
//		for (Product p : list) {
//			System.out.println(p);
//		}
//	}
		
}
