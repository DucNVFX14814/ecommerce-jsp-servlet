package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Product> items;// list of item in cart

	public Cart() {
		items = new ArrayList<>();
	}

	// add a new product to cart
	public void add(Product product) {
		for (Product p : items) {
			if (product.getId() == p.getId()) {
				p.setNumber(p.getNumber() + 1);
				return;
			}
		}
		items.add(product);
	}

	// remove a product from cart
	public void remove(int id) {
		for (Product p : items) {
			if (p.getId() == id) {
				items.remove(p);
				return;
			}
		}
	}

	// return total amount of cart
	public double getMoney() {
		double sum = 0;
		for (Product p : items) {
			sum += p.getPrice() * p.getNumber();
		}
		return Math.round(sum * 100.0) / 100.0;
	}

	// return list of products in cart
	public List<Product> getItems() {
		return items;
	}

	@Override
	public String toString() {
		return "Cart [items=" + items + "]";
	}

	
}
