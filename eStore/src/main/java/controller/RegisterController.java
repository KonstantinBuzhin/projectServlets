package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DBWorker;
import model.SignUp;

public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SignUp signUp;
	private DBWorker dbWorker;

	public RegisterController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("CART_VALUE") == null) {
			session.setAttribute("CART_VALUE", 0);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("CART_VALUE") == null) {
			session.setAttribute("CART_VALUE", 0);
		}
		if (request.getParameter("login") != null || request.getParameter("name") != null
				|| request.getParameter("password") != null || request.getParameter("age") != null
				|| request.getParameter("gender") != null || request.getParameter("comments") != null
				|| request.getParameter("address") != null || request.getParameter("amigo") != null) {
			if (!(request.getParameter("age").equals(""))) {
				signUp = new SignUp(request.getParameter("login"), request.getParameter("name"),
						request.getParameter("password"), Integer.valueOf(request.getParameter("age")),
						request.getParameter("gender"), request.getParameter("comments"),
						request.getParameter("address"), request.getParameter("amigo"));
				request.setAttribute("currentUser", signUp);
				dbWorker = new DBWorker(signUp);
				request.setAttribute("currentDB", dbWorker);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/register.jsp");
				rd.forward(request, response);
			} else {
				doGet(request, response);
			}
		} else {
			doGet(request, response);
		}
	}

}
