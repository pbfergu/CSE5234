<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shipping Infomation</title>
</head>
<body>
<%@include file="Header.jsp"%>
<form:form method="post" action="submitShipping" modelAttribute="shippingInfo">
<table class="table">
		<br>
		Please Input Your Shipping Infomation
		<tr>
			<td>Name</td>
			<td><form:input path="name" value="${shippingInfo.name}" required="required"/></td>
		</tr>
		<tr>
			<td>Address Line1</td>
			<td><form:input path="addressLine1" value="${shippingInfo.addressLine1}" required="required"/></td>
		</tr>
		<tr>
			<td>Address Line2</td>
			<td><form:input path="addressLine2" value="${shippingInfo.addressLine2}" required="required"/></td>
		</tr>
		<tr>
			<td>City</td>
			<td><form:input path="city" value="${shippingInfo.city}" required="required"/></td>
		</tr>
		<tr>
			<td>State</td>
			<td><form:input path="state" value="${shippingInfo.state}" required="required"/></td>
		</tr>
		<tr>
			<td>Zip</td>
			<td><form:input path="zip" value="${shippingInfo.zip}" required="required"/></td>
		</tr>
	</table>		
<br/>
<input type="submit" value="Submit" />
	
</form:form>
<%@include file="Footer.jsp"%>
</body>
</html>