<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/ncode.css">	
	<title>Protoporos Customer Service</title>
</head>
<body style="background-color: lavender;">
	<h1>Contact Protoporos sales team</h1>
	<h4>Our team will answer your sales enquiry. Please fill out the form and we'll be in touch as soon as possible.</h4>
	<hr>
	<div class="container">
		<form style = "font-family:verdana;" action="EnquiryController" method="post">
			<div class="mb-3">
				<a class="navbar-brand">
				Why did you interested in playing Protoporos?<br></a>
				<input type="radio" name="reason" value="Playing for fun" required>Playing for fun<br>
				<input type="radio" name="reason" value="Playing with friend">Playing with friend<br>
				<input type="radio" name="reason" value="Trying new game">Trying new game<br><br>
				<a class="navbar-brand">
				Which platform you want use to play Protoporos?<br></a>
				<select class="form-control" id="platform" name="platform">
					<option value="1">PC</option>
					<option value="2">Mobile (iOS/Android)</option>
					<option value="3">PlayStation</option>
					<option value="4">Nintendo Switch</option>
				</select><br/>
				<a class="navbar-brand">
				Which Protoporos version that you interested in?<br></a>
				1. Protoporos (King of Azura)<br>
				2. Protoporos II (War of the Three Kingdoms)<br>
				3. Protoporos III (Outlaws)<br>
				4. Protoporos IX (Nightmare)<br>
				5. Protoporos X (The Final)<br><br>
				<input type="text" class="form-control" id="version" name="version" placeholder="Version*"><br>
				<a class="navbar-brand">
				Purchase date:
				<input class="form-control" type="date" name="date" required><br>
				Comments:<br>
				<textarea class="form-control" name="comment" rows="2" placeholder="Tell us more about the game that you want or anything.."></textarea><br>
				<label for="cid" class="form-label">Customer Id:</label>    
				<select class="form-control" id="cid" name="cid">  
			    	<c:forEach items="${customers}" var="customer"> 
			      		<option value="<c:out value='${customer.cid}'/>"><c:out value="${customer.cid}" /> - <c:out value="${customer.name}" /></option>
			      	</c:forEach>
    			</select><br/>    
				Fields marked with * are required<br></a>
				<input type="submit" class="btn1" value="Submit"> 
    			<input type="reset" class="btn1" value="Reset">
		  	</div><br>
		  	<div class="container1">
					<a  href="Protoporos.html" class="btn1 effect04"><span>Back</span></a>
			  	</div>
		</form>
	</div>
</body>
</html>

