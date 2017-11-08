<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
      <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet"  type="text/css" href="resources/css/style2.css">


</head>
<body>
<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include>



<c:if test="${not empty msg }">
   <div class="msgblock">
   <c:out value="${msg}" />
   </div>
 </c:if>



<div class="jumbotron jumbotron-sm">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <h1 class="h1">
                    Contact us <small>Feel free to contact us</small></h1>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="well well-sm">
                <form:form action="contact_us" method="POST" items="${contact}" modelAttribute="contact">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <form:label path="name" >
                                Name</form:label>
                            <form:input type="text" path="name" class="form-control" id="name" placeholder="Enter name" required="required" />
                        </div>
                        <div class="form-group">
                            <form:label  path="email" >
                                Email Address</form:label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <form:input type="email" path="email" class="form-control" id="email" placeholder="Enter email" required="required" /></div>
                        </div>
                        <div class="form-group">
                            <form:label path="subject"  >
                                Subject</form:label>
                            <form:select id="subject" name="subject" path="subject" class="form-control" required="required">
                                <form:option value="na" selected="">Choose One:</form:option>
                                <form:option value="service">General Customer Service</form:option>
                                <form:option value="suggestions">Suggestions</form:option>
                                <form:option value="product">Product Support</form:option>
                                <form:option value="product">Product Defect</form:option>
                                
                            </form:select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <form:label  path="message" >
                                Message</form:label>
                            <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                            Send Message</button>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
        <div class="col-md-4">
            <form>
            <legend><span class="glyphicon glyphicon-globe"></span> Our office</legend>
            <address>
                <strong>NIIT Panvel.</strong><br>
                2nd Floor J.K.Plaza<br>
                Shivaji chowk Old Panvel<br>
                India, 410206<br>
                website:www.n<br>niitpanvel.com
                <abbr title="Phone">
                    P:</abbr>
                (91) 9930911455
                
            </address>
            <address>
                <strong>Full Name</strong><br>
                <a href="mailto:#">niitpanvel.25@gmail.com</a>
            </address>
     
         
            
            </form>
            </div>
             </div>
</div>
            
            
   <div class="container"> 
     <div class="box">
     <div class="row">      
     <div class="col-lg-12">
     <hr>
     <h2 class="intro-text text-center">Contact
     <strong>business casual</strong>
      </h2>
     <hr>
     <div class="col-md-8">
     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15091.028247402139!2d73.
     11694614707625!3d18.98633351926945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7e8135594239b%3A0x3a08cbd5e4840d41!
     2sSai+Jewellers!5e0!3m2!1sen!2sin!4v1487845525429" 
     width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
     
     </div>
     
    </div>
    </div>
    </div>
    </div>   
            
        
   








</body>
</html>