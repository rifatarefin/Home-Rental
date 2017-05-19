<%@ page import="com.packt.webstore.domain.Add" %>
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
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Details</h1>
        </div>
    </div>
</section>
<section class="container">
    <div class="row">
        <div class="col-md-5">

            <h3>${add.title}</h3><br>


            <%
                Add add= (Add) session.getAttribute("add");
                session.setAttribute("add",add);
            %>

            <c:url value="/add/img" var="imgAdd" >
                <c:param name="addId" value="${add.id}"/>
            </c:url>
            <img height="433" width="666" src="${imgAdd}" aria-expanded="true"><br><br><br>

            <p>
                <strong>Location : </strong><span class="label label-warning">${add.location}</span>
            </p>
            <p>
                <strong>Property Type: </strong> : ${add.propertyType}
            </p>
            <p>
                <strong>Flat Size: </strong> : ${add.sqFeet}
            </p>
            <p>
                <strong>Number of Bedrooms: </strong> : ${add.bed}
            </p>
            <p>
                <strong>Number of Bathrooms: </strong> : ${add.bath}
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
</section>


</body>
</html>
