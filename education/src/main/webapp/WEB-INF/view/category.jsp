<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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

<center><form action="manage_category_create" method="post">
<input type="text" name="id">
<input type="text" name="name">
<input type="text" name="description">
<input type="submit" value="create"></form></center>
<br><br>


<div class="container" >

<c:if test="${not empty msg }">
   <div class="msgblock">
   <c:out value="${msg}" />
   </div>
 </c:if>
	
	<table class="table table-striped;">
	<tr>
	<th></th>
	<th>Id </th>
	<th>Name</th>
	<th>Description</th>
	
	<th></th>
	</tr>
	<c:forEach var="category" items="${catList}" >
	<tr  >
	<!-- <td><img alt="NO IMAGE" height="50px" width="50px" src="<c:url value='/resources/Images/{product.category}/{product.image}'/>" /></td>  -->
	<td>${category.id}</td>
	<td>${category.name}</td>
	<td>${category.description}</td>
	<td>
			
			|<a href="" >Edit</a>|
			<a href="" >Delete</a>
		
	</td>
	</tr>
	
	</c:forEach>
	</div>




</body>
</html>