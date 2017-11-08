<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Join NIIT Will Make U Job Ready</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libss/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  <link rel="stylesheet"  type="text/css" href="resources/css/style4.css">
  
  <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include>








<center>${LoginMessage }</center>


<div  id="mycarousel" class="carousel slide" data-ride="carousel" data interval="3000" no-margin no-padding>



  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
    <li data-target="#mycarousel" data-slide-to="1"></li>
    <li data-target="#mycarousel" data-slide-to="2"></li>
    <li data-target="#mycarousel" data-slide-to="3"></li>
   
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
        <img src="<c:url value='/resources/images/gniit2.jpg'/>" data-color="lightblue" style="height:400px;width:100%" alt="First Image">
        <div class="carousel-caption">
           
        </div>
    </div>
    <div class="item">
        <img src="<c:url value='/resources/images/banking.jpg'/>" data-color="firebrick" alt="Second Image">
        <div class="carousel-caption">
           
        </div>
    </div>
    <div class="item">
        <img src="<c:url value='/resources/images/java.jpg'/>"  data-color="violet" alt="Third Image">
        <div class="carousel-caption">
            
        </div>
    </div>
    <div class="item">
        <img src="<c:url value='/resources/images/cisco.jpg'/>"  data-color="lightgreen" alt="Fourth Image">
        <div class="carousel-caption">
            
        </div>
    </div>
   
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#mycarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#mycarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</body>
</html>
