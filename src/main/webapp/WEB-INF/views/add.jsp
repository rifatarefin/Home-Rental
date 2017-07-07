<%@ page import="term.project.homerental.domain.Add" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

    <title>Advertisement</title>
</head>



<body>




<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top" >
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
                <li ><a href="/">Home</a></li>
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



<div class="container-fluid" >
<div class="well">
    <ol class="breadcrumb" >
        <li><a href="/">Home</a></li>
        <li><a href="/adds">Adds</a></li>
        <li class="active">${add.title}</li>
    </ol>

    <h1>    ${add.title}</h1>
    <p><span class="label label-warning">${add.purpose}</span></p>

</div>

</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-8">



            <%
                Add add= (Add) session.getAttribute("add");
                session.setAttribute("add",add);
            %>

            <c:url value="/add/img" var="imgAdd" >
                <c:param name="addId" value="${add.id}"/>
            </c:url>
            <img height="433" width="666" src="${imgAdd}" aria-expanded="true"><br><br><br>

        </div>
        <br><br>
        <div class="col-xs-4 well">

            <p>
                <strong>Location : </strong><span class="label label-warning">${add.location}</span>
            </p>
            <p>
                <strong>Property Type: </strong>  ${add.propertyType}
            </p>
            <p>
                <strong>Flat Size: </strong>  ${add.sqFeet}
            </p>
            <p>
                <strong>Number of Bedrooms: </strong>  ${add.bed}
            </p>
            <p>
                <strong>Number of Bathrooms: </strong>  ${add.bath}
            </p>
            <h4><strong>Rent: </strong>${add.price} Taka</h4>
            <p>
                <a href="<spring:url value="/adds" />"
                   class="btn btn-default"> <span
                        class="glyphicon-hand-left glyphicon"></span> back
                </a> <a href="#" class="btn btn-warning btn-large"> <span
                    class="glyphicon-shopping-cart glyphicon"></span> Order Now
            </a>
            </p>
        </div>
    </div>
</div>


</body>
</html>
