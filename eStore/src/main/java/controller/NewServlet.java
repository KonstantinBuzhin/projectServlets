package controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import model.Product;

public class NewServlet {

	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key1", "hello");
		map.put("key2", "minimax");
		map.put("key3", "minimax");
		Iterator<String> newIterator = map.keySet().iterator();
		while(newIterator.hasNext()) {
			String key = newIterator.next();
			
			System.out.println(map.get(key));
		}
		Map<Product, Integer> newmap = new HashMap<Product, Integer>();
		Product product1 = new Product(1, "name1", 125, "sdf", "category1");
		Product product2 = new Product(2, "name2", 352, "sdf", "category2");
		Product product3 = new Product(3, "name3", 152, "sdf", "category3");
		Product product4 = new Product(4, "name4", 657, "sdf", "category4");
		newmap.put(product1, 1);
		newmap.put(product2, 2);
		Product product5 = new Product(1, "name1", 125, "sdf", "category1");
		System.out.println(newmap);
		if(newmap.containsKey(product5)) {
			newmap.put(product5, newmap.get(product5)+1);
		}
		System.out.println(newmap);

	}
}
