<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

    <title>All Adds</title>
</head>
<style>
    /* Note: Try to remove the following lines to see the effect of CSS positioning */
    .affix {
        top: 20px;
    }
</style>
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
                <li ><a href="/">Home</a></li>
                <li class="active"><a href="/adds">All Adds</a> </li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">

                <li class="active"><a href="/adds/new" >Place Add </a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>




<section>



    <div class="container-fluid" >
        <div class="well " >

            <ol class="breadcrumb">
                <li><a href="/">Home</a></li>
                <li class="active">All Adds</li>
            </ol>

            <h1>Flats for Rent/Sale</h1>
            <p>Browse All the Advertisements</p>



        </div>
    </div>
</section>



<section class="container-fluid">




        <div class="row">





        <div class="col-sm-3" style="height: 300%; background-color: #f7f7f7">
        <div id="sidebar-bg">
            <div id="sidebar">
                <ul>

                    <li>
                        <h4>Categories</h4>

                        <h5>Property Type</h5>
                        <ul>
                            <li><a href="/adds/Residential">Residential</a></li>
                            <li><a href="/adds/Commercial">Commercial</a></li>

                        </ul>

                    </li>
                    <li>
                        <h4>Custom Search</h4>
                        <form:form  method="POST" modelAttribute="search" class="form-horizontal" >
                            <fieldset>
                                    <div class="form-group " >
                                        <label class="control-label" for="minPrice">Minimum Price</label>
                                        <div >
                                            <form:input id="minPrice" path="minPrice" type="text" class="form:input-large form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div >
                                            <input type="submit" id="btnAdd" class="btn btn-primary" value ="Search"/>
                                        </div>
                                    </div>
                            </fieldset>
                        </form:form>
                    </li>
                    <%--<li>--%>
                        <%--<h2>Blogroll</h2>--%>
                        <%--<ul>--%>
                            <%--<li><a href="#">Aliquam libero</a></li>--%>
                            <%--<li><a href="#">Consectetuer adipiscing elit</a></li>--%>
                            <%--<li><a href="#">Metus aliquam pellentesque</a></li>--%>
                            <%--<li><a href="#">Suspendisse iaculis mauris</a></li>--%>
                            <%--<li><a href="#">Urnanet non molestie semper</a></li>--%>
                            <%--<li><a href="#">Proin gravida orci porttitor</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<h2>Archives</h2>--%>
                        <%--<ul>--%>
                            <%--<li><a href="#">Aliquam libero</a></li>--%>
                            <%--<li><a href="#">Consectetuer adipiscing elit</a></li>--%>
                            <%--<li><a href="#">Metus aliquam pellentesque</a></li>--%>
                            <%--<li><a href="#">Suspendisse iaculis mauris</a></li>--%>
                            <%--<li><a href="#">Urnanet non molestie semper</a></li>--%>
                            <%--<li><a href="#">Proin gravida orci porttitor</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </div>
        <!-- end #sidebar -->
        </div>







        <c:forEach items="${adds}" var="add">
            <c:url value="/add/img" var="imgAdd" >
                <c:param name="addId" value="${add.id}"/>
            </c:url>
            <div class="col-sm-2 col-md-3">
                <div class="thumbnail" style="height: 500px">
                    <img  src="${imgAdd}">
                    <div class="caption">
                        <span class="label label-warning">${add.purpose}</span>
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
