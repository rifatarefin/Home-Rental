<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                     <%--<li class="dropdown">--%>
                         <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>--%>
                         <%--<ul class="dropdown-menu">--%>
                             <%--<li><a href="#">Action</a></li>--%>
                             <%--<li><a href="#">Another action</a></li>--%>
                             <%--<li><a href="#">Something else here</a></li>--%>
                             <%--<li role="separator" class="divider"></li>--%>
                             <%--<li class="dropdown-header">Nav header</li>--%>
                             <%--<li><a href="#">Separated link</a></li>--%>
                             <%--<li><a href="#">One more separated link</a></li>--%>
                         <%--</ul>--%>
                     <%--</li>--%>
                 </ul>
                 <ul class="nav navbar-nav navbar-right">

                     <li ><a href="/adds/new" >Place Add </a></li>

                     <c:if test="${username=='anonymousUser'}">

                     <li><a href="<c:url value="/login" />">Login</a></li>
                     </c:if>
                     <c:if test="${username!='anonymousUser'}">
                         <li><a href="<c:url value="/logout" />">Logout</a></li>
                         <li><a href="/user"><strong>${username}</strong></a></li>
                     </c:if>
                 </ul>
             </div><!--/.nav-collapse -->
         </div>
     </nav>




<div class="container-fluid">
     <div class="jumbotron">
                  <h1> ${greeting} </h1>
                  <p> ${tagline} </p>
              <a class="btn btn-lg btn-primary" href="adds" >Search Flats &raquo;</a>
     </div>
</div>

     </body>
</html>
