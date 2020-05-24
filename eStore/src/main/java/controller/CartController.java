package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import data.DBWorker;
import model.Product;

public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CART = "CART";
	private static final String CART_VALUE = "CART_VALUE";

	public CartController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Map<Product, Integer> listProduct;
		request.setAttribute("imgHeight", "150px");
		if (session.getAttribute(CART) != null) {
			listProduct = (Map) session.getAttribute(CART);
		} else {
			listProduct = new HashMap<Product, Integer>();
		}
		if (session.getAttribute(CART_VALUE) == null) {
			session.setAttribute(CART_VALUE, 0);
		}

		request.setAttribute("listProducts", listProduct);

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/Cart.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DBWorker worker = new DBWorker();
		HttpSession session = request.getSession();
		if (request.getParameter("productDeleteId") != null) {
			Map<Product, Integer> listProduct;
			listProduct = (Map) session.getAttribute(CART);
			Product product = worker.getProduct(Integer.valueOf(request.getParameter("productDeleteId")));
			listProduct.remove(product);
			int qnt = listProduct.size();
			session.setAttribute(CART_VALUE, qnt);
			doGet(request, response);
		}

		Map<Product, Integer> productsMap = new HashMap<Product, Integer>();

		if (session.getAttribute(CART) != null) {
			productsMap = (Map) session.getAttribute(CART);
		}
		if (request.getParameter("productId") != null && request.getParameter("productCount") != null) {
			Product product = worker.getProduct(Integer.valueOf(request.getParameter("productId")));
			Integer countProducts = Integer.valueOf(request.getParameter("productCount"));
			Integer valueCount = 0;
			for (Entry<Product, Integer> entry : productsMap.entrySet()) {
				Product currentProduct = entry.getKey();
				if (currentProduct.equals(product)) {
					valueCount = entry.getValue();
				}
			}
			Integer putValueCount = 0;
			if (valueCount > countProducts) {

				putValueCount = valueCount - countProducts;
				productsMap.put(product, productsMap.get(product) - putValueCount);
			} else {
				putValueCount = countProducts - valueCount;
				productsMap.put(product, productsMap.get(product) + putValueCount);
			}

			session.setAttribute(CART, productsMap);
			int qnt = productsMap.size();
			session.setAttribute(CART_VALUE, qnt);
			int sumOrder = 0;
			for (Entry<Product, Integer> entry : productsMap.entrySet()) {
				
				sumOrder += entry.getKey().getPrice()*entry.getValue();
			}
			String lineOrder = "Your Order: " + sumOrder;
			
			PrintWriter out = response.getWriter();
			out.write(lineOrder);

		}
		if (request.getParameter("productId") != null && request.getParameter("productQnt") != null) {
			Product product = worker.getProduct(Integer.valueOf(request.getParameter("productId")));
			Integer countProducts = Integer.valueOf(request.getParameter("productQnt"));
			if (productsMap.containsKey(product)) {
				productsMap.put(product, productsMap.get(product) + countProducts);
			} else {
				productsMap.put(product, countProducts);
			}
			session.setAttribute(CART, productsMap);
			int qnt = productsMap.size();
			session.setAttribute(CART_VALUE, qnt);
			PrintWriter out = response.getWriter();
			out.write("" + qnt);
		}

//		response.sendRedirect(
//		request.setAttribute("listProducts", listProduct);
//		if(request.getParameter("category")!=null) {
//			response.sendRedirect("/eStore/ProductController?category="+request.getParameter("category"));
//		}else {
//		response.sendRedirect("/eStore/ProductController");
//		}
	}

}
