<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

    <title>Products</title>
</head>
<body>

<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/" >Home Rental</a>
</div>
<div class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
        <li><a  class="btn btn-primary " >Place Add </a></li>

    </ul>


</div><!--/.nav-collapse -->

<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Flats for Rent/Sale</h1>
            <p>Browse All the Advertisements</p>
            <a class="btn btn-lg btn-primary" href="/adds/new" >Place Add &raquo;</a>

        </div>
    </div>
</section>

<section class="container">
    <div class="row">
        <c:forEach items="${adds}" var="add">
            <c:url value="/add/img" var="imgAdd" >
                <c:param name="addId" value="${add.id}"/>
            </c:url>
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img height="433" width="666" src="${imgAdd}">
                    <div class="caption">
                        <h3>${add.title}</h3>

                        <p>Flat Size: ${add.sqFeet}</p>
                        <p>Location: ${add.location}</p>
                        <p>Rent: ${add.price} tk</p>
                        <p>No of Bedrooms: ${add.bed}</p>
                            <a
                                    href=" <spring:url value="/add?id=${add.id}" /> "
                                    class="btn btn-primary"> <span
                                    class="glyphicon-info-sign glyphicon" /></span> Details
                            </a>
                        </p>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
</body>
</html>
