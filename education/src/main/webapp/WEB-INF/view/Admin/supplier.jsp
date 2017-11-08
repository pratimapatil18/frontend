<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
.errStyle {
	color:red;
	font-style: italic;
	font-weight: bold;
	text-align: right;
}
  </style>

  
</head>
<body>

<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include> 

<c:if test="${not editing}"> 
<c:set var="saveorupdate" value="/education/Admin/create_suppliers"></c:set>
</c:if>
<c:if test="${editing}" >
<c:set var="saveorupdate" value="/education/Admin/supplier_edit"></c:set>

</c:if>


<form:form  action="${saveorupdate}" modelAttribute="sup">
<table style="width: 100%; text-align: right;">
<tr>
<td>
 <form:label  path="id">
				<spring:message text="  Supplier Id:"/>
</form:label>
</td>
<td>
<form:input  path="id" />
</td>
<td>
 <form:label  path="name">
				<spring:message text="Supplier Name:"/>
</form:label>
</td>
<td>
<form:input  path="name" />
</td>
<td>
 <form:label  path="address">
				<spring:message text="Supplier Address:"/>
</form:label>
</td>
<td>
<form:input  path="address" />
</td>
<td>
<c:if test="${not editing}" >
 
 <input  class="btn btn-info"  type="submit"
					value="Add Supplier" />
</c:if>
<c:if test="${editing}" >
 
 <input  class="btn btn-info"  type="submit"
					value="Update Supplier" />
</c:if>
					
					</td>
					</tr>
<tr>
<td colspan="2">
<form:errors path="id" >
<p class="errStyle">
* Cannot be Empty
</p>
 </form:errors>
</td>
<td  colspan="2">
<form:errors path="name" >
<p class="errStyle">
* Invalid Name
</p>
 </form:errors>

</td>
<td  colspan="2">
<form:errors path="address" >
<p class="errStyle">
* Cannot be Empty
</p>
 </form:errors>

</td>
</tr>
</table>
</form:form>
<br><br>

<div class="container" >

<c:if test="${not empty msg }">
   <div class="msgblock">
   <c:out value="${msg}" />
   </div>
 </c:if>
	
	<table class="table table-striped;">
	<tr>
	
	<th>Id </th>
	<th>Name</th>
	<th>Address</th>
	
	<th></th>
	</tr>
	<c:forEach var="supplier" items="${supplierList}"  >
	<tr  >
	<!-- <td><img alt="NO IMAGE" height="50px" width="50px" src="<c:url value='/resources/Images/{product.category}/{product.image}'/>" /></td>  -->
	<td>${supplier.id}</td>
	<td>${supplier.name}</td>
	<td>${supplier.address}</td>
	<td>
			
			<a class="btn btn-primary"
									onclick="return confirm('Are you sure you want to edit this category?');"
									href="<c:url value='/Admin/manage_supplier_edit/${supplier.id}' />"> 
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit
								</a>

								<a class="btn btn-primary"
									onclick="return confirm('Are you sure you want to delete this Category?');"
									href="<c:url value='/Admin/supplier_delete/${supplier.id}' />"> 
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete
								</a>

		
	</td>
	</tr>
	
	</c:forEach>
	</div>


</body>
</html>