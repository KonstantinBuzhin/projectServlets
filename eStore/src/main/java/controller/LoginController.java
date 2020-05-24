package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DBWorker;
import model.SignIn;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SignIn signIn;
    private DBWorker dbWorker;
    private boolean showForm = false;

    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("keyUser")==null) {
			showForm = false;
		}
		session.setAttribute("showForm", showForm);
		if(session.getAttribute("CART_VALUE") == null) {
			session.setAttribute("CART_VALUE", 0);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("CART_VALUE") == null) {
			session.setAttribute("CART_VALUE", 0);
		}
		if(request.getParameter("loginOut")!=null) {
			session.invalidate();
			session = request.getSession(true);
			showForm = false;
			session.setAttribute("showForm", showForm);
			session.removeAttribute("keyUser");
			session.removeAttribute("currentUserName");

			if(session.getAttribute("CART_VALUE") == null) {
				session.setAttribute("CART_VALUE", 0);
			}
			PrintWriter out = response.getWriter();
			out.write("SIGN IN");
		}

		if(request.getParameter("logOut")!=null) {
			session.invalidate();
			session = request.getSession(true);
			showForm = false;
			session.setAttribute("showForm", showForm);
			session.removeAttribute("keyUser");
			session.removeAttribute("currentUserName");

			if(session.getAttribute("CART_VALUE") == null) {
				session.setAttribute("CART_VALUE", 0);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
			rd.forward(request, response);
		}
		if (request.getParameter("login")!=null || request.getParameter("password") != null) {

			signIn = new SignIn(request.getParameter("login"), request.getParameter("password"));
			request.setAttribute("currentUser", signIn);
			dbWorker = new DBWorker(signIn);
			
			request.setAttribute("currentDB", dbWorker);
			if(dbWorker.getAccess().equals("Successfully logged")) {
			
			session.setAttribute("keyUser", "sessionCheck");
			showForm = false;
			session.setAttribute("showForm", showForm);
			}
			
			if(session.getAttribute("keyUser") != null){
				session.setAttribute("currentUserName", "Hello "+ dbWorker.getUserName()+"!");
				showForm = (session.getAttribute("keyUser")!=null)?true: false;
				session.setAttribute("showForm", showForm);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
			rd.forward(request, response);
		} else {
			
			doGet(request, response);
		}
	}

}
