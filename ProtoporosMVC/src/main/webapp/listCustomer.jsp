<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="css/ncode.css">
	<title>List Customer</title>
</head>
<body style="background-color: azure;">
<div class="container">
  <nav class="navMenu">
      <a href="CustomerController?action=listCustomer">Manage Customer</a>
      <a href="EnquiryController?action=listEnquiry">Manage Enquiry</a>  
      <div class="dot"></div>
   </nav>
</div>
<br>
<div class="container">
<br><br><br>
<h3>Customer list</h3>
<br><br>
<div class="container2">
	<a href="CustomerController?action=addCustomer" class="btn2 effect04" style="float:right"><span>ADD CUSTOMER</span></a>
</div>
<br>
<table class="table table-striped" style="width:100%">
  <tr>
    <th>Customer Id</th>
    <th>Name</th>
    <th>Email</th> 
    <th>Phone No</th>
    <th>Address</th>   
    <th colspan="3"></th>
  </tr>
 <c:forEach items="${customers}" var="customer" varStatus="customers">
  <tr>
    <td><c:out value="${customer.cid}" /></td>
    <td><c:out value="${customer.name}" /></td>
    <td><c:out value="${customer.email}" /></td>
    <td><c:out value="${customer.phone}" /></td>
    <td><c:out value="${customer.address}" /></td>        
	    <td><div class="container1">
	    	<a href="CustomerController?action=viewCustomer&cid=<c:out value="${customer.cid}" />" class="btn1 effect01"><span>Detail</span></a>
	    </div></td>
	    <td><div class="container1">
	    	<a href="UpdateCustomerController?cid=<c:out value="${customer.cid}" />" class="btn1 effect02"><span>Update</span></a>
	    </div></td>
	    <td><div class="container1">
		    <input type="hidden" id="cid-${customers.index}" value="<c:out value="${customer.cid}"/>">
		    <a class="btn1 effect03" onclick="confirmation('${customers.index}')"><span>Delete</span></a>
	    </div></td>       
  </c:forEach>
</table>
</div>
	<script>
		function confirmation(index){
			  var cid = $("#cid-" + index).val();
			 
			  console.log(cid);
			  var r = confirm("Delete confirmation?");
			  if (r == true) {				 		  
				  location.href = 'CustomerController?action=deleteCustomer&cid=' + cid;
				  alert("Customer successfully deleted");			
			  } else {				  
			      return false;	
			  }
		}
	</script>
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</body>
</html>

