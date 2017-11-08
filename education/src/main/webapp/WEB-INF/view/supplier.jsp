<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"  type="text/css" href="resources/css/style5.css">

</head>
<body>
<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include> 



<div class="wrapper">
    <form class="form-signin">       
      <h2 class="form-signin-heading">Supplier Details</h2>
      <input type="text" class="form-control" name="id" placeholder="Id" required="" autofocus="" />
      <input type="text" class="form-control" name="name" placeholder="Name" required="" autofocus=""/>   
       <input type="text" class="form-control" name="address" placeholder="Address" required="" autofocus=""/>      
     
      <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>   
    </form>
  </div>



</body>
</html>