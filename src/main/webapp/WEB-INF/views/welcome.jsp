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
     <div class="navbar  navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" >Home Rental</a>
            </div>

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>

                </ul>
            </div><!--/.nav-collapse -->


          <div class="jumbotron">
                  <h1> ${greeting} </h1>
                  <p> ${tagline} </p>
              <a class="btn btn-lg btn-primary" href="adds" >Search Flats &raquo;</a>
          </div>
        </div>
     </div>
     </body>
</html>
