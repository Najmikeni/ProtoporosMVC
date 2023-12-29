package protoporos.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import protoporos.dao.CustomerDAO;
import protoporos.dao.EnquiryDAO;
import protoporos.model.Enquiry_Detail;
import java.text.*;
/**
 * Servlet implementation class EnquiryController
 */
@WebServlet("/EnquiryController")
public class EnquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EnquiryDAO dao;
    String action ="";
    String foward="";
    RequestDispatcher view;
    DateFormat formatter;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryController() {
        super();
        dao = new EnquiryDAO();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getParameter("action");
		if(action.equalsIgnoreCase("viewEnquiry")) {
			foward = "viewEnquiry.jsp";
			int eid = Integer.parseInt(request.getParameter("eid"));
			request.setAttribute("enquiry_detail", EnquiryDAO.getEnquiryById(eid)); //invoke getProductById method
		}
		if(action.equalsIgnoreCase("listEnquiry")) {
			foward = "listEnquiry.jsp";
			request.setAttribute("enquirys", EnquiryDAO.getAllEnquiry());
		}
		if(action.equalsIgnoreCase("deleteEnquiry")) {
			foward = "listEnquiry.jsp";
			int eid = Integer.parseInt(request.getParameter("eid"));
			dao.deleteEnquiry(eid); //invoke deleteEnquiry method
			request.setAttribute("enquirys", EnquiryDAO.getAllEnquiry());
		}
		if(action.equalsIgnoreCase("updateEnquiry")) {
			foward = "updateEnquiry.jsp";
			Enquiry_Detail enquiry = new Enquiry_Detail();
			int eid = Integer.parseInt(request.getParameter("eid"));
			enquiry = EnquiryDAO.getEnquiryById(eid);
			request.setAttribute("selectedPlatform", enquiry.getPlatform());	//auto selected for platform when updating
			request.setAttribute("selectedCustomer", enquiry.getCid());			//auto selected for customer when updating
			request.setAttribute("enquiry_detail", EnquiryDAO.getEnquiryById(eid));
			request.setAttribute("customers", CustomerDAO.getAllCustomers());
		}
		if(action.equalsIgnoreCase("addEnquiry")) {
			foward = "Protoporos2.jsp";
			request.setAttribute("customers", CustomerDAO.getAllCustomers());
		}
		view = request.getRequestDispatcher(foward);
		view.forward(request,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {	//convert date format from picker dd/MM/yyyy to yyyy-MM-dd
		    formatter = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date date;
		    date = formatter.parse(request.getParameter("date"));
	        //add enquiry
			Enquiry_Detail enquiry = new Enquiry_Detail();
			enquiry.setReason(request.getParameter("reason"));
			enquiry.setPlatform(Double.parseDouble(request.getParameter("platform")));
			enquiry.setVersion(request.getParameter("version"));
			enquiry.setDate(date);
			enquiry.setComment(request.getParameter("comment"));
			enquiry.setCid(Integer.parseInt(request.getParameter("cid")));
			
			String eid = request.getParameter("eid");
			if(eid == null || eid.isEmpty()) {
				dao.addEnquiry(enquiry);
			}
			else {
				enquiry.setEid(Integer.parseInt(eid));
				dao.updateEnquiry(enquiry);
			}
			//foward request
			request.setAttribute("enquirys", EnquiryDAO.getAllEnquiry());
			RequestDispatcher view = request.getRequestDispatcher("listEnquiry.jsp");
			view.forward(request,response);
			
		} catch (ParseException e) {
		e.printStackTrace();
		}
	}
}
