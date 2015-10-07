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
<h1>View Order</h1>
<form:form method="post" action="confirmOrder" modelAttribute="order">
	<table>
	<tr>
		<th>No.</th>
		<th>Name</th>
		<th>quantity</th>
	</tr>
	<c:forEach items="${order.itemList}" var="item" varStatus="status">
		<tr>
			<td align="center">${status.count}</td>
			<td><form:hidden path="itemList[${status.index}].name"/>${item.name}</td>
			<td><form:input readonly="true" path="itemList[${status.index}].quantity" value="${item.quantity}"/></td>
		</tr>
	</c:forEach>
</table>
</form:form>
<br/>
<form:form method="post" action="confirmOrder" modelAttribute="payment">
<table>
	<tr>
		<td>Credit Card Number</td>
		<td><form:input readonly="true" path="creditCardNumber" /></td>
	</tr>
	<tr>
		<td>Expiration Date</td>
		<td><form:input readonly="true" path="expDate" /></td>
	</tr>
	<tr>
		<td>CVV Code</td>
		<td><form:input readonly="true" path="cvvCode" /></td>
	</tr>
	<tr>
		<td>Card Holder Name</td>
		<td><form:input readonly="true" path="cardHolderName" /></td>
	</tr>
</table>
</form:form>
<br />
<form:form method="post" action="confirmOrder" modelAttribute="shippingInfo">
<table>
	<tr>
		<td>Name</td>
		<td><form:input readonly="true" path="name" value="${shippingInfo.name}"/></td>
	</tr>
	<tr>
		<td>Address Line1</td>
		<td><form:input readonly="true" path="addressLine1" value="${shippingInfo.addressLine1}"/></td>
	</tr>
	<tr>
		<td>Address Line2</td>
		<td><form:input readonly="true" path="addressLine2" value="${shippingInfo.addressLine2}"/></td>
	</tr>
	<tr>
		<td>City</td>
		<td><form:input readonly="true" path="city" value="${shippingInfo.city}"/></td>
	</tr>
	<tr>
		<td>State</td>
		<td><form:input readonly="true" path="state" value="${shippingInfo.state}"/></td>
	</tr>
	<tr>
		<td>Zip</td>
		<td><form:input readonly="true" path="zip" value="${shippingInfo.zip}"/></td>
	</tr>
</table>
<input type="submit" value="Confirm" />
	
</form:form>

</body>
</html>