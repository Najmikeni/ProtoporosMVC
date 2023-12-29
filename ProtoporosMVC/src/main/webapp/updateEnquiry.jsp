<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="css/ncode.css">	
	<title>Update Enquiry</title>
</head>
<body style="background-color: bisque;">
<div class="container"></div>
<div class="container">
<br>
<h3>Update Enquiry</h3>
<br>
  <form action="EnquiryController" method="post">
  <div class="mb-3">
    <label for="eid" class="form-label">Enquiry Id</label>    
    <input type="text" class="form-control" id="eid" name="eid" value="<c:out value="${enquiry_detail.eid}"/>" readonly>   
  </div><br>     
  <div class="mb-3">
    <label for="reason" class="form-label">Reason</label>    
    <input type="text" class="form-control" id="reason" name="reason" value="<c:out value="${enquiry_detail.reason}"/>">   
  </div><br>  
  <div class="mb-3">
    <label for="platform" class="form-label">Platform</label>    
    <select class="form-control" id="platform" name="platform">
    	<option value="${enquiry_detail.platform}" ${enquiry_detail.platform == selectedPlatform ? 'selected="selected"':''}>
    	<c:if test="${enquiry_detail.platform == 1.0}">
	    	PC
	    	<option value="2">Mobile (iOS/Android)</option>
			<option value="3">PlayStation</option>
			<option value="4">Nintendo Switch</option>
		</c:if>
		<c:if test="${enquiry_detail.platform == 2.0}">
			Mobile (iOS/Android)
			<option value="1">PC</option>
			<option value="3">PlayStation</option>
			<option value="4">Nintendo Switch</option>
		</c:if>
		<c:if test="${enquiry_detail.platform == 3.0}">
			PlayStation
			<option value="1">PC</option>
			<option value="2">Mobile (iOS/Android)</option>
			<option value="4">Nintendo Switch</option>
		</c:if>
		<c:if test="${enquiry_detail.platform == 4.0}">
			Nintendo Switch
			<option value="1">PC</option>
			<option value="2">Mobile (iOS/Android)</option>
			<option value="3">PlayStation</option>
		</c:if>
    </select>
  </div><br>
  <div class="mb-3">
    <label for="version" class="form-label">Version</label><br>
    1. Protoporos (King of Azura)<br>
	2. Protoporos II (War of the Three Kingdoms)<br>
	3. Protoporos III (Outlaws)<br>
	4. Protoporos IX (Nightmare)<br>
	5. Protoporos X (The Final)<br><br>
    <input type=text class="form-control" id="version" name="version" value="<c:out value="${enquiry_detail.version}"/>">    
  </div><br>
  <div class="mb-3">
  <label for="date" class="form-label">Date</label>    
    <input type="date" class="form-control" id="date" name="date" value="<c:out value="${enquiry_detail.date}"/>">
  </div><br>
  <div class="mb-3">
  <label for="comment" class="form-label">Comments</label>    
    <input type="text" class="form-control" id="comment" name="comment" value="<c:out value="${enquiry_detail.comment}"/>">
  </div><br>
  <div class="mb-3">
  <label for="cid" class="form-label">Customer Id</label>    
    <select class="form-control" id="cid" name="cid">  
    	<c:forEach items="${customers}" var="customer"> 
      		<option value="${customer.cid}" ${customer.cid == selectedCustomer ? 'selected="selected"':''}>
      		<c:out value="${customer.cid}" /> - <c:out value="${customer.name}" /></option>
      	</c:forEach>
    </select> 
  </div><br>
  <div class="mb-3">
	 <input type="submit" class="btn1" value="Submit">
	 <input type="reset" class="btn1" value="Reset">
  </div><br>
  <div class="container1">
	<a  href="EnquiryController?action=listEnquiry" class="btn1 effect04"><span>Back</span></a>
  </div>
  </form>
</div>
</body>
</html>
