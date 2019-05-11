package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Dao;
import Model.Image;
import Model.User;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/buy")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User s = new User();
		Boolean flag=true;
		Dao db = new Dao();
		int uid;
		int quantity;
		String name=request.getParameter("n");
		String address=request.getParameter("a");
		String email=request.getParameter("e");
		String phone=request.getParameter("p");
		String amount=request.getParameter("amt");
		String button =request.getParameter("b");
		if(button.equals("Place order"))
		{
		s.setEmail(email);
		s.setPhone(phone);
		s.setName(name);
		s.setAddress(address);
		uid = db.selectUser(name);
		ArrayList<Image> list = db.getCart(uid);
		for(int i=0;i<list.size();i++)
		{	
			quantity=Integer.parseInt(request.getParameter("qty"+i));
			Image obj =list.get(i);
			flag= db.insertOrder(s, obj.getPid() ,quantity,amount);
			flag= db.deleteCartItem(uid,obj.getPid());
		}
		if(flag)
			response.sendRedirect("home");
		}else {
		int pid=Integer.parseInt(button);
		uid = db.selectUser(name);
		flag= db.deleteCartItem(uid,pid);
		if(flag)
			response.sendRedirect("cart");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
