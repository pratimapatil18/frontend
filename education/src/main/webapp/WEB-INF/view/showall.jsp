<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

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
<div class="container" >

	<table class="table table-striped;" style="width: 100%">
	   <tr>     
	        
	        <td style="text-align: center;" colspan="2"><img width="300px" height="300px" alt="NO IMAGE" src="<c:url value='/resources/images/${product.image}'/>" /></td>
	   </tr>    
		    <tr>
	         <th>Product ID </th>
	         <td>${product.id}</td>
	   </tr>
	   <tr>   
	         <th>product Name</th>
	         <td>${product.name}</td>
	   </tr>
	    
	   <tr>     
	         <th>Price</th>
	         <td>${product.price}</td>
	   </tr> 
	    <tr>     
	         <th>Category ID</th>
	         <td>${product.categoryId}</td>
	   </tr>
	    <tr>     
	         <th>Quantity</th>
	         <td>${product.qty}</td>
	   </tr>
	   
	   
	</table>
	 <c:if test="${not(isAdmin)}">						
								<a class="btn btn-primary"
									href="<c:url value='/myCart/add/${product.id}' />">
									 Add to MyCart
								</a>
        </c:if>  
 </div>                 

</body>
</html>