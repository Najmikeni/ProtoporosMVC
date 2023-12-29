<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" type="text/css" href="css/ncode.css">	
	<title>Update Customer</title>
</head>
<body style="background-color: bisque;">
<div class="container"></div>
<div class="container">
<br>
<h3>Update Customer</h3>
<br><br>
  <form action="UpdateCustomerController" method="post">
  <div class="mb-3">
    <label for="cid" class="form-label">Customer Id</label>    
    <input type="text" class="form-control" id="cid" name="cid" value="<c:out value="${customer.cid}"/>" readonly>   
  </div><br>     
  <div class="mb-3">
    <label for="name" class="form-label">Name</label>    
    <input type="text" class="form-control" id="name" name="name" value="<c:out value="${customer.name}"/>">   
  </div><br>
  <div class="mb-3">
    <label for="email" class="form-label">Email</label>    
    <input type="text" class="form-control" id="email" name="email" value="<c:out value="${customer.email}"/>">   
  </div><br>
  <div class="mb-3">
    <label for="phone" class="form-label">Phone No</label>    
    <input type="text" class="form-control" id="phone" name="phone" value="<c:out value="${customer.phone}"/>">    
  </div><br>
  <div class="mb-3">
  <label for="address" class="form-label">Address</label>    
    <input type="text" class="form-control" id="address" name="address" value="<c:out value="${customer.address}"/>">
  </div><br>
  <div class="mb-3">
    <input type="submit" class="btn1" value="Submit"> 
    <input type="reset" class="btn1" value="Reset">
  </div><br>
    <div class="container1">
	<a  href="CustomerController?action=listCustomer" class="btn1 effect04"><span>Back</span></a>
  </div>
  </form>
</div>
</body>
</html>
