<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <title>Welcome</title>

   <%--<link rel="stylesheet" --%>
   <%--href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>


   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

</head>

<body>

<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
   <div class="container">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="/">Home Rental</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
         <ul class="nav navbar-nav">
            <li class="active"><a  href="/">Home</a></li>
            <li ><a href="/adds">All Adds</a> </li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>

         </ul>
         <ul class="nav navbar-nav navbar-right">

            <li ><a href="/adds/new" >Place Add </a></li>
             <c:if test="${username=='anonymousUser'}">

                 <li><a href="<c:url value="/login" />">Login</a></li>
             </c:if>
             <c:if test="${username!='anonymousUser'}">
                 <li><a href="<c:url value="/logout" />">Logout</a></li>
                 <li><a><strong>${username}</strong></a></li>
             </c:if>

         </ul>
      </div><!--/.nav-collapse -->
   </div>
</nav>

<section>


   <div class="container-fluid">
      <div class="well ">


         <h1>Flats for Rent/Sale</h1>
         <p>Browse All the Advertisements</p>


      </div>
   </div>
</section>



<div class="container">
      <div class="row">
         <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
               <div class="panel-heading">
                  <h3 class="panel-title">Please sign in</h3>
               </div>
               <div class="panel-body">
<c:url var="loginUrl" value="/login" />
                  <form action="${loginUrl}" method="post" class="form-horizontal">
                     
                     <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                           <p>Invalid username and password.</p>
                        </div>
                     </c:if>
                     
                     <c:if test="${param.logout != null}">
                        <div class="alert alert-success">
                           <p>You have been logged out successfully.</p>
                        </div>
                     </c:if>
                     
                     <c:if test="${param.accessDenied != null}">
                        <div class="alert alert-danger">
                           <p>Access Denied: You are not authorised! </p>
                        </div>
                     </c:if>
                     
                     <div class="input-group input-sm">
                        <label class="input-group-addon" for="username"><i
                           class="fa fa-user"></i></label> -<input type="text" class="form-control"
                           id="username" name="username" placeholder="Enter Username"
                           required>
                     </div>
                     <div class="input-group input-sm">
                        <label class="input-group-addon" for="password"><i
                           class="fa fa-lock"></i></label> <input type="password"
                           class="form-control" id="password" name="password"
                           placeholder="Enter Password" required>
                     </div>

                     <div class="form-actions">
                        <input type="submit"
                           class="btn btn-block btn-primary btn-default" value="Log in">
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
