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
<body>
<form:form method="post" action="submitShipping" modelAttribute="shippingInfo">
<p>Name: <form:input path="name" value="${shippingInfo.name}"/></p>
<p>Address Line 1: <form:input path="addressLine1" value="${shippingInfo.addressLine1}"/></p>
<p>Address Line 2: <form:input path="addressLine2" value="${shippingInfo.addressLine2}"/></p>
<p>City: <form:input path="city" value="${shippingInfo.city}"/></p>
<p>State: <form:input path="state" value="${shippingInfo.state}"/></p>
<p>Zip: <form:input path="zip" value="${shippingInfo.zip}"/></p>

<br/>
<input type="submit" value="Submit" />
	
</form:form>

</body>
</html>