package protoporos.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import protoporos.connection.ConnectionManager;
import protoporos.model.Enquiry_Detail;

public class EnquiryDAO {
	//declaration
	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	DateFormat formatter;
	
	String reason,version,comment;
	Double platform;
	int eid,cid;
	Date date;

	//add Enquiry
	public void addEnquiry(Enquiry_Detail bean) { //pass the bean as object
		//get Enquiry
		reason = bean.getReason();
		platform = bean.getPlatform();
		version = bean.getVersion();
		date = bean.getDate();
		comment = bean.getComment();
		cid = bean.getCid();
		
		//convert java date to sql date
        java.sql.Date date1= new java.sql.Date(date.getTime());
        
		try {
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql ="INSERT INTO enquiry_detail(reason,platform,version,date,comment,cid)VALUES(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);	
			ps.setString(1, reason);
			ps.setDouble(2, platform);
			ps.setString(3, version);
			ps.setDate(4, date1);
			ps.setString(5, comment);
			ps.setInt(6, cid);
			//run the query
			ps.executeUpdate();			
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//update enquiry_detail
	public void updateEnquiry(Enquiry_Detail bean) {
		//get enquiry_detail
		eid = bean.getEid(); 	//need for update
		reason = bean.getReason();
		platform = bean.getPlatform();
		version = bean.getVersion();
		date = bean.getDate();
		comment = bean.getComment();
		cid = bean.getCid(); 
		
		//convert java date to sql date
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		
		try {
			//open connection		
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql ="UPDATE enquiry_detail SET reason=?,platform=?,version=?,date=?,comment=?,cid=? WHERE eid=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, reason);
			ps.setDouble(2, platform);
			ps.setString(3, version);
			ps.setDate(4, date1);
			ps.setString(5, comment);
			ps.setInt(6, cid);
			ps.setInt(7, eid);
			//run query
			ps.executeUpdate();			
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	//get all Enquiry_Detail
	public static List<Enquiry_Detail> getAllEnquiry(){ //array to return many
		List<Enquiry_Detail> enquirys = new ArrayList<Enquiry_Detail>();
		try {		
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql ="SELECT * FROM enquiry_detail ORDER BY eid";
			stmt = con.createStatement();	
			//execute query
			rs = stmt.executeQuery(sql);
			while(rs.next()) {	
				Enquiry_Detail enquiry = new Enquiry_Detail();
				enquiry.setEid(rs.getInt("eid"));
				enquiry.setReason(rs.getString("reason")); 
				enquiry.setPlatform(rs.getDouble("platform"));
				enquiry.setVersion(rs.getString("version"));
				enquiry.setDate(rs.getDate("date"));
				enquiry.setComment(rs.getString("comment"));
				enquiry.setCid(rs.getInt("cid"));
				enquirys.add(enquiry); 		//add enquiry_detail to the array list
			}
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return enquirys;
	}
	
	// get Enquiry_Detail by eid
	public static Enquiry_Detail getEnquiryById(int eid) { //return the object
		Enquiry_Detail enquiry = new Enquiry_Detail();
		try {		
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql ="SELECT * FROM enquiry_detail WHERE eid=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, eid);
			//run query
			rs = ps.executeQuery();	//use rs for select	statement	
			if(rs.next()) {	
				enquiry.setEid(rs.getInt("eid"));
				enquiry.setReason(rs.getString("reason")); 
				enquiry.setPlatform(rs.getDouble("platform"));
				enquiry.setVersion(rs.getString("version"));
				enquiry.setDate(rs.getDate("date"));
				enquiry.setComment(rs.getString("comment"));
				enquiry.setCid(rs.getInt("cid"));
			}
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return enquiry;
	}
	
	//delete Enquiry_Detail
	public void deleteEnquiry(int eid) {
		try {
			con = ConnectionManager.getConnection(); 			
			//create statement
			String sql = "DELETE FROM enquiry_detail WHERE eid=?";
			ps = con.prepareStatement(sql);	
			ps.setInt(1, eid);
			//run query
			ps.executeUpdate();			
			//close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
}
