<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="css/ncode.css">
	<title>View Enquiry</title>
</head>
<body>
<div class="container"></div>
<div class="container">
<br><br>
<h3>Enquiry Detail</h3>
<br><br>
		<label for="eid">Enquiry Id</label>: <c:out value="${enquiry_detail.eid}"/><br>
    	<label for="reason">Reason</label>: <c:out value="${enquiry_detail.reason}"/><br>    	
    	<label for="platform">Platform</label>:
    	<c:if test="${enquiry_detail.platform == 1.0}">
 		PC
		</c:if>
		<c:if test="${enquiry_detail.platform == 2.0}">
 		Mobile (iOS/Android)
		</c:if>
		<c:if test="${enquiry_detail.platform == 3.0}">
 		PlayStation
		</c:if>
		<c:if test="${enquiry_detail.platform == 4.0}">
 		Nintendo Switch
		</c:if><br>
      	<label for="version">Version</label>: <c:out value="${enquiry_detail.version}" /><br>    	
        <label for="date">Date</label>: <c:out value="${enquiry_detail.date}"/><br>
		<label for="comment">Comment</label>: <c:out value="${enquiry_detail.comment}"/><br> 
		<label for="cid">Customer Id</label>: <c:out value="${enquiry_detail.cid}"/><br><br>	   
        <div class="container1">
			<a href="EnquiryController?action=updateEnquiry&eid=<c:out value="${enquiry_detail.eid}" />" class="btn2 effect02"><span>Update</span></a>
		</div><br>
		<div class="container1">
			<input type="hidden" id="eid-${enquirys.index}" value="<c:out value="${enquiry_detail.eid}"/>">
			<a class="btn2 effect03" onclick="confirmation('${enquirys.index}')"><span>Delete</span></a>
		</div><br>
		<div class="container1">
		      <a  href="EnquiryController?action=listEnquiry" class="btn2 effect04"><span>Back</span></a>
		</div>
		<script>
			function confirmation(index){
				  var eid = $("#eid-" + index).val();
				  console.log(eid);
				  var r = confirm("Delete confirmation?");
				  if (r == true) {				 		  
					  location.href = 'EnquiryController?action=deleteEnquiry&eid=' + eid;
					  alert("Enquiry successfully deleted");			
				  } else {				  
				      return false;	
				  }
			}
		</script>
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</div>
</body>
</html>
