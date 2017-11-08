<%@ page isELIgnored="false"  language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
      <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet"  type="text/css" href="resources/css/style.css">

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>

<style>
.errStyle {
	color:red;
	font-style: italic;
	font-weight: bold;
	text-align: right;
}
 .msgblock {
 color: red;
 background-color: white;
 border: 3px solid blue;
 padding: 8px;
}
</style>




</head>
<body>
<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include>


<div class="container">
<center>
<c:if test="${not empty msg }">
   <div class="msgblock">
   <c:out value="${msg}" />
   </div>
 </c:if>
</center>
<div class="row">
  <div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
  
 
    					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							
						
								<form action="<c:url value='/j_spring_security_check'/>" method="post" id="login-form"   role="form" style="display: block;">
								
								
									<div class="form-group">
										<input required type="text"   name="username" tabindex="1" class="form-control" placeholder="Username" />
									</div>
									
									
									<div class="form-group">
										<input required type="password"  name="password" tabindex="2" class="form-control" placeholder="Password"/>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									</div>
								
									
									
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit"  tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
										</form>
									
									
							
							
								<form:form action="create_user" id="register-form"  modelAttribute="user"  method="post" items="${user}" role="form" style="display: none;">
									<div class="form-group">
										<form:input type="text" name="fullname" path="name" id="fullname" tabindex="1" class="form-control" placeholder="Full Name" value=""></form:input>
									</div>
									<div class="has-error">
									<form:errors path="name" >
                                           <p class="errStyle">
                                               * Cannot be Empty
                                           </p>
                                    </form:errors>
									</div>
									
									<div class="form-group">
										<form:input type="email" name="email" path="mail" id="email" tabindex="1" class="form-control" placeholder="Email Address" value=""></form:input>
									</div>
									<div class="has-error">
									<form:errors path="mail" >
                                           <p class="errStyle">
                                               * Cannot be Empty and Must be valid
                                           </p>
                                    </form:errors>
									</div>
									
									
									
									<div class="form-group">
										<form:input  type="password" name="password" path="password" id="password" tabindex="2" class="form-control" placeholder="Password" />
									</div>
									<div class="has-error">
									<form:errors path="password" >
                                           <p class="errStyle">
                                               * Cannot be Empty must be 6 Letters
                                           </p>
                                    </form:errors>
									</div>
									
									
									<div class="form-group">
										<form:input type="contact" name="contact" path="contact" id="contact" tabindex="2" class="form-control" placeholder="Contact Number"></form:input>
									</div>
									<div class="has-error">
									<form:errors path="contact" >
                                           <p class="errStyle">
                                               * Cannot be Empty
                                           </p>
                                    </form:errors>
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit"  name="register-submit"  tabindex="4" class="btn btn-register" value="Register Now" />
											</div>
										</div>
									</div>
								
								</form:form>
								
							</div>
						</div>
					</div>
				</div>

</div>
</div>

</div>



</body>
</html>