<%--
  Created by IntelliJ IDEA.
  User: rifat
  Date: 7/7/17
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="term.project.homerental.domain.Add" %>
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
                    <li><a href="/user"><strong>${username}</strong></a></li>
                </c:if>

            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>



<div class="container-fluid" >
    <div class="well">
        <ol class="breadcrumb" >
            <li><a href="/">Home</a></li>
            <li class="active">${username}</li>
        </ol>

        <h1>Properties of ${username}</h1>

    </div>

    <c:forEach items="${properties}" var="flat">
        <c:url value="/user/img" var="imgFlat">
        <c:param name="flatId" value="${flat.flatId}"/>
        </c:url>
        <div class="col-sm-2 col-md-4 col-lg-4">
            <div class="thumbnail" style="height: 600px">
                    <img src="${imgFlat}">
                <div class="caption">
                    <span class="label label-warning">${flat.city}</span>
                        <h3>ID: ${flat.flatId}</h3>
                        <p>Flat Size: ${flat.sqFeet}</p>
                        <p>Location: ${flat.location}</p>
                        <p>No of Bedrooms: ${flat.bed}</p>
                        <p>No of Bathrooms: ${flat.bath}</p>
                        <a
                        href=" <spring:url value="/user?flatId=${flat.flatId}" /> "
                        class="btn btn-primary"> <span
                        class="glyphicon-info-sign glyphicon"/></span> Tenant
                        </a>
                    </p>

                </div>
            </div>
        </div>
    </c:forEach>

</div>



</body>
</html>
