package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dao;
import Model.Image;

/**
 * Servlet implementation class Display
 */
@WebServlet("/Display")
public class Display extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Display() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Dao dao = new Dao();
		String min = "0";
		String max = "100000";
		String category = "all";
		if(request.getParameter("cat") != null)
		category = request.getParameter("cat");

		if(request.getParameter("min") != null)
			 min = request.getParameter("min");
		if(request.getParameter("max") != null)
			 max = request.getParameter("max");
		if (category.equals("all"))
		{
		try {
			int page = 1;
	        int recordsPerPage = 6;
	        if(request.getParameter("page") != null)
	            page = Integer.parseInt(request.getParameter("page"));
	        ArrayList<Image> list = dao.get((page-1)*recordsPerPage,recordsPerPage,min,max);
	        int noOfRecords = dao.getNoOfRecords();
	        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			request.setAttribute("gallery", list);
			request.setAttribute("noOfPages", noOfPages);
	        request.setAttribute("currentPage", page);
			RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else {
			try {
				int page = 1;
		        int recordsPerPage = 6;
		        if(request.getParameter("page") != null)
		            page = Integer.parseInt(request.getParameter("page"));
		        ArrayList<Image> list = dao.getCategory((page-1)*recordsPerPage,
		                                 recordsPerPage,category,min,max);
		        int noOfRecords = dao.getNoOfRecords();
		        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				request.setAttribute("gallery", list);
				request.setAttribute("noOfPages", noOfPages);
		        request.setAttribute("currentPage", page);
				RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
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
