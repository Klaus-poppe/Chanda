package Controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import Model.Dao;

/**
 * Servlet implementation class SignInController
 */
@WebServlet("/signin")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInController() {
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
		Dao db = new Dao();
		String pass = null ;
		String error;
			String username=request.getParameter("u"); 
			String password=request.getParameter("p");
	
			 try {
					MessageDigest md = MessageDigest.getInstance("MD5");
					    md.update(password.getBytes());
					    byte[] digest = md.digest();
					    pass = DatatypeConverter.printHexBinary(digest).toUpperCase();
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(db.checkUser(username, pass))
	        {
				HttpSession session=request.getSession();
				session.setAttribute("n",username);

				response.sendRedirect("home");
	        }
	        else
	        {
	        	error = "Failed";
	        	request.setAttribute("msg", error);
	  		  RequestDispatcher rs = request.getRequestDispatcher("signin.jsp");
	          rs.forward(request, response);
	        }
	        
		
		
	}

}
