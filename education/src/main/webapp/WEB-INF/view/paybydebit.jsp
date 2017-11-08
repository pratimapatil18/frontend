<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
      <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Debit Cart Mode</title>

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

<div class="container">
            <form:form  action="card_details" method="POST" items="${debitcard}" modelAttribute="debitcard" >
                <h2>Payment Details</h2>
               
                <div class="form-group">
                    <form:label path="cardno" for="cardno" class="col-sm-3 control-label">Card Number</form:label>
                    <div class="col-sm-9">
                        <form:input path="cardno" type="text" id="cardno" placeholder="cardno" class="form-control"/>
                    </div>
                </div>
                
                
                 <div class="form-group">
                            <form:label path="expmonth"  class="col-sm-3 control-label" >
                                ExpiryMonth</form:label>
                        <div class="col-sm-9">
                            <form:select id="expmonth" name="expmonth" path="expmonth" class="form-control" required="required">
                                <form:option value="na" selected="">Choose One:</form:option>
                                <form:option value="service">1</form:option>
                                <form:option value="suggestions">2</form:option>
                                <form:option value="product">3</form:option>
                                <form:option value="product">4</form:option>
                                 
                                <form:option value="service">5</form:option>
                                <form:option value="suggestions">6</form:option>
                                <form:option value="product">7</form:option>
                                <form:option value="product">8</form:option>
                                
                               
                                <form:option value="service">9</form:option>
                                <form:option value="suggestions">10</form:option>
                                <form:option value="product">11</form:option>
                                <form:option value="product">12</form:option>
                            </form:select>
                        </div>    
                        </div>
                
                
                
                
                
                
                
                
                
                 <div class="form-group">
                    <form:label path="expyear" for="expyear" class="col-sm-3 control-label">ExpiryYear</form:label>
                    <div class="col-sm-9">
                        <form:input path="expyear" type="text" id="expyear" placeholder="expyear" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="cvv" for="cvv" class="col-sm-3 control-label">CVV</form:label>
                    <div class="col-sm-9">
                        <form:input path="cvv" type="text" id="cvv" placeholder="cvv" class="form-control"/>
                    </div>
                </div>
                 <div class="form-group">
                    <form:label path="atmpin" for="atmpin" class="col-sm-3 control-label">ATM Pin</form:label>
                    <div class="col-sm-9">
                        <form:input path="atmpin" type="text" id="atmpin" placeholder="atmpin" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="cardname" for="cardname" class="col-sm-3 control-label">Card Name</form:label>
                    <div class="col-sm-9">
                        <form:input path="cardname" type="cardname" id="cardname" placeholder="cardname" class="form-control"/>
                    </div>
                </div>
                 
               
               
                
               
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </div>
                </div>
            </form:form> <!-- /form -->
        </div>




</body>
</html>