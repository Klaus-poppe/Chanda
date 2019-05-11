package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Dao;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/add")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
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
		boolean flag;
		Dao db = new Dao();
		int pid =Integer.parseInt(request.getParameter("pid")); 
		String button = request.getParameter("b");
		HttpSession session=request.getSession();
		String username = (String) session.getAttribute("n");
		int uid = db.selectUser(username);
		if(uid == -1)
			System.out.println(session.getId());
		flag=db.insertCart(uid,pid);
		if(flag)
			if(button.equals("Buy now")) {
			response.sendRedirect("cart");
			}else {
				String msg = "Added to Cart";
				request.setAttribute("msg", msg);
				RequestDispatcher rd = request.getRequestDispatcher("Display");
				rd.forward(request, response);
				
			}
		
	}

}
