<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="css/ncode.css">
	<title>View Customer</title>
</head>
<body>
<div class="container"></div>
<div class="container">
<br><br>
<h3>Customer Detail</h3>
<br><br>
		<label for="cid">Customer Id</label>: <c:out value="${customer.cid}"/><br>
    	<label for="name">Name</label>: <c:out value="${customer.name}"/><br>    	
    	<label for="email">Email</label>: <c:out value="${customer.email}"/><br>	
      	<label for="phone">Phone No</label>: <c:out value="${customer.phone}" /><br>    	
        <label for="address">Address</label>: <c:out value="${customer.address}"/><br><br>   		     

		<div class="container1">
			<a href="UpdateCustomerController?cid=<c:out value="${customer.cid}" />" class="btn2 effect02"><span>Update</span></a>
		</div><br>
		<div class="container1">
			<input type="hidden" id="cid-${customers.index}" value="<c:out value="${customer.cid}"/>">
			<a class="btn2 effect03" onclick="confirmation('${customers.index}')"><span>Delete</span></a>
		</div><br>
		<div class="container1">
		      <a  href="CustomerController?action=listCustomer" class="btn2 effect04"><span>Back</span></a>
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
</div>
</body>
</html>
