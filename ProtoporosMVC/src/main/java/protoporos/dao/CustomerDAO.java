package protoporos.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import protoporos.connection.ConnectionManager;
import protoporos.model.Customer;

public class CustomerDAO {
	//declare
	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	
	String name,email,phone,address;
	int cid;
	
	//add customer method
	public void addCustomer(Customer bean) { //pass the bean as object
		//get customer
		name = bean.getName();
		email = bean.getEmail();
		phone = bean.getPhone();
		address = bean.getAddress();
		
		try {	
			//open connection
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql ="INSERT INTO customer(name,email,phone,address)VALUES(?,?,?,?)";
			ps = con.prepareStatement(sql);	
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, address);
			//run statement
			ps.executeUpdate();			
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//get all customer
	public static List<Customer> getAllCustomers(){ //array to return many
		List<Customer> customers = new ArrayList<Customer>();	
		try {	
			con = ConnectionManager.getConnection(); 			
			// create statement
			String sql ="SELECT * FROM customer ORDER BY cid";
			stmt = con.createStatement();	
			//run query
			rs = stmt.executeQuery(sql);	//use rs for select	statement	
			while(rs.next()) {	
				Customer customer = new Customer();
				customer.setCid(rs.getInt("cid")); 
				customer.setName(rs.getString("name"));
				customer.setEmail(rs.getString("email"));
				customer.setPhone(rs.getString("phone"));
				customer.setAddress(rs.getString("address"));
				customers.add(customer); //add customer to the array list
			}
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return customers;
	}
	
	// get customer by cid
	public static Customer getCustomerById(int cid) { //return the object
		Customer customer = new Customer();
		try {		
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql ="SELECT * FROM customer WHERE cid=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, cid);
			//run query
			rs = ps.executeQuery();	//use rs for select	statement	
			if(rs.next()) {	
				customer.setCid(rs.getInt("cid")); 
				customer.setName(rs.getString("name"));
				customer.setEmail(rs.getString("email"));
				customer.setPhone(rs.getString("phone"));
				customer.setAddress(rs.getString("address"));
			}
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	//update customer method
	public void updateCustomer(Customer bean) {
		//get customer
		cid = bean.getCid(); //additional for update
		name = bean.getName();
		email = bean.getEmail();
		phone = bean.getPhone();
		address = bean.getAddress();
		
		try {	
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql ="UPDATE customer SET name=?,email=?,phone=?,address=? WHERE cid=?";
			
			ps = con.prepareStatement(sql);	
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, address);
			ps.setInt(5,cid);
			//run query
			ps.executeUpdate();			
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	//delete customer
	public void deleteCustomer(int cid) {
		try {		
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql = "DELETE FROM customer WHERE cid=?";
			ps = con.prepareStatement(sql);	
			ps.setInt(1, cid);
			//run query
			ps.executeUpdate();			
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
}