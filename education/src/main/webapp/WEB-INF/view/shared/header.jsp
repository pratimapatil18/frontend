<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
 
 
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<nav class="navbar navbar-default no-margin no-padding ">
  <div class="container-fluid">
  <div>
  
      <ul class="nav navbar-nav">
      <li>
      <a class="navbar-brand" href="#">NIIT Panvel</a></li> 
      </ul>
       <ul class="nav navbar-nav navbar-right">
     <li ><a> <span class="glyphicon glyphicon-user"></span>9930911455</a></li>
      </ul>
    
  </div>
  </div>
</nav>

      
<nav class="navbar navbar-inverse  no-margin no-padding ">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/education/">Home</a></li>
        <li class="dropdown"><a style="color: white;" class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <c:forEach items="${categoryList}" var="cat" >
          <li><a href="<c:url value='allProducts/${cat.id}'/>">${cat.name}</a></li>
          </c:forEach>
        </ul>
      </li>
    
       
        <li><a href="<c:url value='/about'/>">About Us</a></li>
       
        <li><a href="<c:url value='/contact'/>">Contact Us</a></li>
       <li><a href="<c:url value='/allProducts'/>">All Products</a></li>
       
        
        
   <c:if test="${isAdmin}">
				<li><a href="<c:url value='/Admin/adminhome'/>"> Admin</a></li>
			</c:if>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      
     
     <c:if  test="${empty LoginMessage}">
        <li><a href="<c:url value='/login'/>"><span class="glyphicon glyphicon-user"></span>Sign Up|join</a></li>
        </c:if>
        
         <c:if  test="${not empty LoginMessage}">
        <li><a href="<c:url value='/logout'/> "><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
             <c:if test="${not isAdmin}">
                     <li><a href="<c:url value='/myCart'/>"><span class="glyphicon glyphicon-mycart"></span> MyCart</a></li>
                     </c:if>
              
         </c:if>
      </ul>
      
      
       <form class="navbar-form navbar-left" action="<c:url value='/search'/>">
      <div class="input-group">
        <input type="text" name="name" class="form-control" placeholder="Search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    </div>
  </div>
</nav>





  
