package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DBWorker;
import model.Product;

public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DBWorker worker = new DBWorker();
		List<Product> listProduct = worker.getProducts();
		HttpSession session = request.getSession();
		if (request.getParameter("category") != null) {
			listProduct = worker.getProductsCategory(request.getParameter("category"));
			request.setAttribute("listProducts", listProduct);
		} else if(request.getParameter("id") != null) {
			int idProduct = Integer.valueOf(request.getParameter("id"));
			Product[] product = {worker.getProduct(idProduct)};
			request.setAttribute("listProducts", product);
		} else {
			request.setAttribute("listProducts", listProduct);
		}
		if(session.getAttribute("CART_VALUE") == null) {
			session.setAttribute("CART_VALUE", 0);
		}
		request.setAttribute("imgHeight", "200px");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/products.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("CART_VALUE") == null) {
			session.setAttribute("CART_VALUE", 0);
		}
		if (request.getParameter("idProduct") != null) {
			int idProduct = Integer.valueOf(request.getParameter("idProduct"));
			request.setAttribute("imgHeight", "200px");
			DBWorker worker = new DBWorker();
			Product listProduct = worker.getProduct(idProduct);
			request.setAttribute("listProducts", listProduct);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/products.jsp");
			rd.forward(request, response);
		} else {
			doGet(request, response);
		}
		
	}
	
	

}
