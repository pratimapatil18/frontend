<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Product</title>
</head>
<body>

    <h1>List Product</h1>
    <h3><a href="add.html">Add More Product</a></h3>

    <c:if test="${!empty product}">
     <table align="left" border="1">
      <tr>
       <th>Product ID</th>
       <th>Product Name</th>
       <th>Product Description</th>
       <th>Product Quantity</th>
       <th>Product Image</th>
       
       
      </tr>

      <c:forEach items="${products}" var="product">
       <tr>
        <td><c:out value="${product.id}"/></td>
        <td><c:out value="${product.name}"/></td>
        <td><c:out value="${product.price}"/></td>
         <td><c:out value="${product.qty}"/></td>
        <td><c:out value="${product.image}"/></td>
        
       </tr>
      </c:forEach>
     </table>
    </c:if>
    </body>
    </html>