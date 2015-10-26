<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="Header.jsp"%>
<h1>View Order</h1>





	<table class="table">
	<tr>
		<th>No.</th>
		<th>Name</th>
		<th>quantity</th>
	</tr>
	<c:forEach items="${order.itemList}" var="item" varStatus="status">
		<tr>
			<td align="center">${status.count}</td>
			<td>${item.name}</td>
			<td>${item.quantity}</td>
		</tr>
	</c:forEach>
</table>

<br/>

<table class="table">
	<tr>
		<td>Credit Card Number</td>
		<td>${payment.creditCardNumber}</td>
	</tr>
	<tr>
		<td>Expiration Date</td>
		<td>${payment.expDate}</td>
		
	</tr>
	<tr>
		<td>CVV Code</td>
		<td>${payment.cvvCode}</td>
	</tr>
	<tr>
		<td>Card Holder Name</td>
		<td>${payment.cardHolderName}</td>
	</tr>
</table>

<br />
<form:form method="post" action="confirmOrder" modelAttribute="shippingInfo">
<table class="table">
	<tr>
		<td>Name</td>
		<td>${shippingInfo.name}</td>
	</tr>
	<tr>
		<td>Address Line1</td>
		<td>${shippingInfo.addressLine1}</td>
	</tr>
	<tr>
		<td>Address Line2</td>
		<td>${shippingInfo.addressLine2}</td>
	</tr>
	<tr>
		<td>City</td>
		<td>${shippingInfo.city}</td>
	</tr>
	<tr>
		<td>State</td>
		<td>${shippingInfo.state}</td>
	</tr>
	<tr>
		<td>Zip</td>
		<td>${shippingInfo.zip}</td>
	</tr>
</table>
<input type="submit" value="Confirm" />
</form:form>
	

<%@include file="Footer.jsp"%>
</body>
</html>