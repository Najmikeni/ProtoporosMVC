<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="css/ncode.css">	
	<title>List Enquiry</title>
</head>
<body style="background-color: azure;">
<div class="container">
  <nav class="navMenu">
      <a href="CustomerController?action=listCustomer">Manage Customer</a>
      <a href="EnquiryController?action=listEnquiry">Manage Enquiry</a>  
      <div class="dot"></div>
   </nav>
</div>
<div class="container"></div>
<div class="container">
<br><br><br><br>
<h3>Enquiry list</h3>
<br><br>
<div class="container2">
<a href="EnquiryController?action=addEnquiry" class="btn2 effect04" style="float:right"><span>ADD ENQUIRY</span></a>
</div><br>
<table class="table table-striped" style="width:100%">
  <tr>
   	<th>Enquiry Id</th>
    <th>Platform</th>
    <th>Version</th> 
    <th>Date</th> 
    <th>Customer Id</th>   
    <th colspan="3"></th>
  </tr>
 <c:forEach items="${enquirys}" var="enquiry_detail" varStatus="enquirys">
  <tr>
  	<td><c:out value="${enquiry_detail.eid}" /></td> 
    <td>
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
	</c:if></td>
    <td><c:out value="${enquiry_detail.version}" /></td>
    <td><c:out value="${enquiry_detail.date}" /></td>
    <td><c:out value="${enquiry_detail.cid}" /></td>
    <td><div class="container1">
    	<a href="EnquiryController?action=viewEnquiry&eid=<c:out value="${enquiry_detail.eid}" />" class="btn1 effect01"><span>Detail</span></a>
    </div></td>
    <td><div class="container1">
    	<a href="EnquiryController?action=updateEnquiry&eid=<c:out value="${enquiry_detail.eid}" />" class="btn1 effect02"><span>Update</span></a>
    </div></td>
    <td><div class="container1">
    	<input type="hidden" id="eid-${enquirys.index}" value="<c:out value="${enquiry_detail.eid}"/>">
    	<a class="btn1 effect03" onclick="confirmation('${enquirys.index}')"><span>Delete</span></a>
    </div></td>          
  </c:forEach>
</table>
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
</body>
</html>
