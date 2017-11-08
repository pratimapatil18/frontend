<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/shared/header.jsp"></jsp:include>


<div class="container">
<div class="row">
 <div class="col-md-4 col-md-offset-7">
         <div class="panel panel-default">
<ul class="breadcrumb">
<li><a href="header">Home</a></li>
<li class="active">Registration</li>
</ul>
</div>
</div>
 </div>  
    <div class="row">
     <div class="col-md-4 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading"> <strong class="">New Customer</strong>

                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                   
                    <div class="form-group">
                            <label for="inputFullName3" class="col-sm-7 control-label">Name</label>
                            <div class="col-sm-12">
                              <input class="form-control" id="inputFullName3" placeholder="Name" required="" type="fname">
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-7 control-label">Email</label>
                            <div class="col-sm-12">
                                <input class="form-control" id="inputEmail3" placeholder="Email" required="" type="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-7 control-label">Password</label>
                            <div class="col-sm-12">
                                <input class="form-control" id="inputPassword3" placeholder="Password" required="" type="password">
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <label for="inputmobile3" class="col-sm-8 control-label">Mobile Number</label>
                            <div class="col-sm-12">
                                <input class="form-control" id="inputmobile3" placeholder="Mobile Number" required="" type="mob">
                            </div>
                        </div>
                        
                        <div class="form-group last">
                            <div class="col-sm-offset-4 col-sm-12">
                                <button type="submit" class="btn btn-success btn-sm">Sign Up</button>
                                
                            </div>
                        </div>
                    </form>
                
            </div>
        </div>
    </div>
</div>

</body>
</html>