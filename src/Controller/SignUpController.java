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
import javax.xml.bind.DatatypeConverter;

import Model.Dao;
import Model.User;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/signup")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
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
		User s;
		Boolean flag;
		Dao db = new Dao();
		String pass = null;
		String error = null ; 
					
			String name=request.getParameter("n");
			String address=request.getParameter("ad");
			String email=request.getParameter("e");
			String phone=request.getParameter("ph");
			String password=request.getParameter("p");	
			String cpassword=request.getParameter("cp");
			if(password.equals(cpassword))
			{
				flag = true ;			
			}else {
				System.out.println("hello");
				error = "Password doesn't match" ;
				flag = false ;
			}
				
			s = new User () ;
			s.setEmail(email);
			s.setPhone(phone);
			s.setName(name);
			s.setAddress(address);
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
			    md.update(password.getBytes());
			    byte[] digest = md.digest();
			    pass = DatatypeConverter.printHexBinary(digest).toUpperCase();
				} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
				}
				s.setPassword(pass);
				if(flag)
				flag = db.insertUser(s);
				int uid = db.selectUser(s.getName());
				s.setId(uid);
				
				if(flag) 
				response.sendRedirect("signin.jsp");
				else {
				request.setAttribute("error" , error);
				RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
				rd.forward(request, response);
				}
				
				
	}

}
