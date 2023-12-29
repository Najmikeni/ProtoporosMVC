package protoporos.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import protoporos.dao.CustomerDAO;
import protoporos.model.Customer;
/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerDAO dao;  
    String action ="";
    String foward="";
    RequestDispatcher view;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();
        dao = new CustomerDAO();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getParameter("action");
		if(action.equalsIgnoreCase("viewCustomer")) {
			foward = "viewCustomer.jsp";
			int cid = Integer.parseInt(request.getParameter("cid"));
			request.setAttribute("customer", CustomerDAO.getCustomerById(cid)); //invoke getProductById method
		}
		if(action.equalsIgnoreCase("listCustomer")) {
			foward = "listCustomer.jsp";
			request.setAttribute("customers", CustomerDAO.getAllCustomers());
		}
		if(action.equalsIgnoreCase("deleteCustomer")) {
			foward = "listCustomer.jsp";
			int cid = Integer.parseInt(request.getParameter("cid"));
			dao.deleteCustomer(cid); //invoke deleteProduct method
			request.setAttribute("customers", CustomerDAO.getAllCustomers());
		}
		if(action.equalsIgnoreCase("addCustomer")) {
			foward = "Protoporos.html";
			request.setAttribute("customers", CustomerDAO.getAllCustomers());
		}	
		view = request.getRequestDispatcher(foward);
		view.forward(request,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//add customer
		Customer customer = new Customer();
		customer.setName(request.getParameter("name"));
		customer.setEmail(request.getParameter("email"));
		customer.setPhone(request.getParameter("phone"));
		customer.setAddress(request.getParameter("address"));
		
		String cid = request.getParameter("cid");
		if(cid == null || cid.isEmpty()) {
			dao.addCustomer(customer);
		}
		else {
			customer.setCid(Integer.parseInt(cid));
			dao.updateCustomer(customer);
		}
		//foward request
		request.setAttribute("customers", CustomerDAO.getAllCustomers());
		RequestDispatcher view = request.getRequestDispatcher("Protoporos2.jsp");
		view.forward(request,response);
	}
}
