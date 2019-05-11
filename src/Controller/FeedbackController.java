package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dao;

/**
 * Servlet implementation class FeedbackController
 */
@WebServlet("/feedback")
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Dao db = new Dao();
		Boolean flag;
		String msg;
		String name=request.getParameter("n"); 
		String phone=request.getParameter("p");
		String email=request.getParameter("e"); 
		String message=request.getParameter("m");
		flag = db.insertFeedback(name, phone, email, message);
		if(flag)
		{
		msg = "success";
		request.setAttribute("msg" , msg);
		RequestDispatcher rd = request.getRequestDispatcher("home");
		rd.forward(request, response);
		}

	}
}
