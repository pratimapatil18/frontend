<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
      <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipping Address</title>
<link rel="stylesheet"  type="text/css" href="resources/css/style8.css">


</head>
<body>
<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include>

<c:if test="${not empty msg }">
       <div class="msgblock">
           <c:out value="${msg}" />
      </div>
   <br >
     <a class="btn btn-primary"
									onclick="return confirm('Are you sure you want to delete this Category?');"
									href="<c:url value='paymode' />"> Proceed to Payment
								</a>
 
   
 </c:if>
	

<div class="container">
            <form:form  action="shipping_address" method="POST" items="${shipping}" modelAttribute="shipping" >
                <h2>Shipping Address</h2>
               
                <div class="form-group">
                    <form:label path="streat1" for="streat1" class="col-sm-3 control-label">street1</form:label>
                    <div class="col-sm-9">
                        <form:input path="streat1" type="text" id="streat1" placeholder="streat1" class="form-control"/>
                    </div>
                </div>
                 <div class="form-group">
                    <form:label path="streat2" for="streat2" class="col-sm-3 control-label">street2</form:label>
                    <div class="col-sm-9">
                        <form:input path="streat2" type="text" id="streat2" placeholder="streat2" class="form-control"/>
                    </div>
                </div>
                 <div class="form-group">
                    <form:label path="city" for="city" class="col-sm-3 control-label">City</form:label>
                    <div class="col-sm-9">
                        <form:input path="city" type="text" id="city" placeholder="city" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="state" for="state" class="col-sm-3 control-label">State</form:label>
                    <div class="col-sm-9">
                        <form:input path="state" type="text" id="state" placeholder="state" class="form-control"/>
                    </div>
                </div>
                 <div class="form-group">
                    <form:label path="country" for="country" class="col-sm-3 control-label">Country</form:label>
                    <div class="col-sm-9">
                        <form:input path="country" type="text" id="country" placeholder="country" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="pincode" for="pin" class="col-sm-3 control-label">Pin-Code</form:label>
                    <div class="col-sm-9">
                        <form:input path="pincode" type="pin" id="country" placeholder="pin" class="form-control"/>
                    </div>
                </div>
                 
               
               
                
               
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </div>
                </div>
            </form:form> <!-- /form -->
        </div> <!-- ./container -->





</body>
</html>