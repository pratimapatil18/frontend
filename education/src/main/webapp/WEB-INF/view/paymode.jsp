<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Mode</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include>
<center><h2>Payment Mode</h2></center>

<center>
<form action="<c:url value='/paymode1' />" >
    <label class="radio-inline">
      <input type="radio" value="cash" name="payname">Cash on Delivery
    </label>
    <label class="radio-inline">
      <input type="radio" value="debit" name="payname">DebitCart Payment
    </label>
    <br >
   <button type="submit" class="btn btn-primary"
									onclick="return confirm('Are you sure you want to proceed payment?');"
									> 
								 Proceed to Payment
								</button>
 
  </form>
</center>
</body>
</html>