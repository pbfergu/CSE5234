<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="Header.jsp"%>
<h3>Thank you for your purchase!</h3>
<p>Your confirmation number is <c:out value="${confirmationCode}" /> </p>
<p>Your order will be shipped soon</p>
<%@include file="Footer.jsp"%>
</body>
</html>