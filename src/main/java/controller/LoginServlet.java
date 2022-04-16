package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = "";
		String password = "";
		Cookie[] cookies = request.getCookies();

		// kiểm tra nếu cookies khác null, lấy các cookie, lưu vào request rồi chuyển đến trang login
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("email")) {
					email = c.getValue();
				}
				if (c.getName().equals("password")) {
					password = c.getValue();
				}
			}
		}
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NullPointerException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // vietnamese
		request.getSession(true).invalidate();

		try {
			// collect data from a login form
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			HttpSession session = request.getSession(true);
			AccountDAO dao = new AccountDAO();
			Account acc = dao.login(email, password);

			// Nếu login thành công thì lưu acc vào session, rồi chuyển về trang Home
			if (acc != null) {
				// Tạo session, acc và lưu giá trị acc vào session, rồi chuyển đến trang home
				session.setAttribute("acc", acc);

				// set cookie, nếu người dùng tích vào rememberMe thì sẽ lưu lại cả password
				Cookie cookieEmail = new Cookie("email", email);
				Cookie cookiePassword = new Cookie("password", password);
				cookieEmail.setMaxAge(24*60*60);
				if (request.getParameter("rememberMe") != null) {
					cookiePassword.setMaxAge(24*60*60);
				} else {
					cookiePassword.setMaxAge(0);
				}
				response.addCookie(cookieEmail);
				response.addCookie(cookiePassword);
				
				response.sendRedirect("home");
			} else { // nếu login fail thì chuyển về trang login kèm thông báo lỗi
				request.setAttribute("errorMess", "!! Email or password is invalid");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			response.getWriter().println(e);
		}
	}
	
}
