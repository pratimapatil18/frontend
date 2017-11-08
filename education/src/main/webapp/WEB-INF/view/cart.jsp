<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Cart page</title>
<style>
  .msgblock {
 color: blue;
 background-color: lightgreen;
 border: 3px solid blue;
 padding: 8px;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include>

<c:if test="${not empty msg }">
   <div class="msgblock">
   <c:out value="${msg}" />
   </div>
 </c:if>

<c:if test="${displayCart}">
	<table class="table table-striped;">
		<tr>
			<th >Cart ID</th>
			<th >Product Name</th>
			<th >Date Added</th>
			<th >Price</th>
			<th >Action</th>

		</tr>
		<c:forEach items="${cartList}" var="cart">
			<tr>
				<td align="left">${cart.id}</td>
				<td align="left">${cart.product_name}</td>
				<td align="left">${cart.date_added}</td>
				<td align="left">${cart.price}</td>
				<td >
				<a class="btn btn-primary"
									href="<c:url value='/myCart/delete/${cart.id}' />">
									Remove From Cart
								</a>
				</td>	
			</tr>
		</c:forEach>




	</table>

	<h2>Total Cost : ${totalAmount}</h2>
	<br>
	<a href="shipping">Checkout </a>
	<br>
	<br>

</c:if>
</body>
</html>