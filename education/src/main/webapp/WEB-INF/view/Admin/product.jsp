<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
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

<c:if test="${not empty msg }">
   <div class="msgblock">
   <c:out value="${msg}" />
   </div>
 </c:if>
<c:if test="${isAdmin}">
		<c:if test="${not editing}"> 
					<c:set var="saveorupdate" value="/education/Admin/create_product"></c:set>
		</c:if>
		<c:if test="${editing}" >

				<c:set var="saveorupdate" value="/education/Admin/product_edit"></c:set>

		</c:if>

		<div class="container" >

			<form:form action="${saveorupdate}"   modelAttribute="prd"  enctype="multipart/form-data">

				<table style="width: 100%; text-align: center;">
					<tr>
							<th>
							
								 <form:label  path="id">
									<spring:message text="  Product ID:"/>
				 				</form:label>
							</th>
		                    <td>
				                <form:input  path="id" />
		                   </td>
	              </tr>
	
	
		
	               <tr>
	                     	<th>
				                 <form:label  path="name">
					             <spring:message text="Product Name:"/>
				                 </form:label>
		                   </th>
		                   <td>
								<form:input  path="name" />
						   </td>
				 </tr>	
	
				<tr>
					<th>
 						<form:label  path="price">
							<spring:message text="Price:"/>
						</form:label>
					</th>
					<td>
							<form:input  path="price" />
					</td>
     			</tr>
     
    			 <tr>
					<th>
 						<form:label  path="categoryId">
							<spring:message text="Category:"/>
						</form:label>
					</th>
					<td>
						<form:select  path="categoryId" >
							<c:forEach var="cat" items="${categoryList}">
									<form:option value="${cat.id}">${cat.name}</form:option>
							</c:forEach>
						</form:select>
					</td>
				</tr>
	
				<tr>	
					<th>
 							<form:label  path="qty">
									<spring:message text="Quantity:"/>
							</form:label>
					</th>
					<td>	
							<form:input  path="qty" />
					</td>
    			</tr>
    
    			<tr>
					<th>
 						<form:label  path="file">
							<spring:message text="Image: "/>
						</form:label>
					</th>
					<td>
						<form:input type="file"   path="file" />
					</td>
    			</tr>
   
    			<tr>
					<th>  
						<c:if test="${not editing}" >
 
 							<button  class="btn btn-info"  type="submit" >Add Product</button>
						</c:if>
						<c:if test="${editing}" >
 
 							<button  class="btn btn-info"  type="submit" >Update Product</button>
						</c:if>

					</th>
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
					<form:errors path="price" >
						<p class="errStyle">
							* Cannot be Empty
						</p>
					 </form:errors>

				</td>
			<td colspan="2"></td>

				<td colspan="2">
						<form:errors path="qty" >
							<p class="errStyle">
								* Cannot be Empty
							</p>
 						</form:errors>
				</td>

		<td colspan="2">
			<form:errors path="file" >
					<p class="errStyle">
						* Cannot be Empty
					</p>
 			</form:errors>
		</td>

		</tr>
	</table>

</form:form>

</div>
<br><br>

	</c:if>	
			<table class="table table-striped;">
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
						<c:if test="${empty catId}">
							<c:forEach var="product" items="${productList}" >
				<tr  >
					 <td><img alt="NO IMAGE" height="50px" width="50px" src="<c:url value='/resources/images/${product.image}'/>" /></td> 
					<td>${product.name}</td>
					<td>${product.price}</td>
	
	
	           <td>
						<c:if test="${isAdmin}">	
								<a class="btn btn-primary"
									onclick="return confirm('Are you sure you want to edit this category?');"
									href="<c:url value='manage_product_edit/${product.id}' />"> 
									<span class="glyphicon glyphicon-pencil" ></span> Edit
								</a>

								<a class="btn btn-primary"
									onclick="return confirm('Are you sure you want to delete this Category?');"
									href="<c:url value='/Admin/product_delete/${product.id}' />"> 
									<span class="glyphicon glyphicon-trash" ></span> Delete
								</a>
	   					</c:if>
								<a class="btn btn-primary"
									href="<c:url value='/showproduct/${product.id}' />">
									 Details
								</a>
					<c:if test="${not(isAdmin)}">						
								<a class="btn btn-primary"
									href="<c:url value='/myCart/add/${product.id}' />">
									 Add to MyCart
								</a>
      				  </c:if>
                                 
     		</c:forEach>                          
			</c:if>
					<c:if test="${not empty catId}">
						<c:forEach var="product" items="${productList}" >
							<c:if test="${product.categoryId eq catId}">
								<tr  >
									 <td><img alt="NO IMAGE" height="50px" width="50px" src="<c:url value='/resources/images/${product.image}'/>" /></td> 
									<td>${product.name}</td>
									<td>${product.price}</td>
	
									<td>
										<c:if test="${isAdmin}">	
												<a class="btn btn-primary"
												onclick="return confirm('Are you sure you want to edit this category?');"
												href="<c:url value='manage_product_edit/${product.id}' />"> 
												<span class="glyphicon glyphicon-pencil" ></span> Edit
												</a>

												<a class="btn btn-primary"
												onclick="return confirm('Are you sure you want to delete this Category?');"
												href="<c:url value='/Admin/product_delete/${product.id}' />"> 
												<span class="glyphicon glyphicon-trash" ></span> Delete
												</a>
	  									 </c:if>
												<a class="btn btn-primary"
												href="<c:url value='/showproduct/${product.id}' />">
												 Details
												</a>
											<c:if test="${not(isAdmin)}">						
												<a class="btn btn-primary"
												href="<c:url value='/myCart/add/${product.id}' />">
												 Add to MyCart
												</a>
       										 </c:if>
                                 
                                   </td>
                                 </tr>	 
							</c:if>
						</c:forEach>
					</c:if>
	
	</table>
	





</body>
</html>