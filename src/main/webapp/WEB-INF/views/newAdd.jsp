<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <title>New Add</title>
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
                <li ><a href="/">Home</a></li>
                <li ><a href="/adds">All Adds</a> </li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">

                <li class="active"><a href="/adds/new" >Place Add </a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<ol class="breadcrumb">
    <li><a href="/">Home</a></li>
    <li><a href="/adds">Adds</a></li>
    <li class="active">New Add</li>
</ol>

<section>
    <div class="container-fluid">
        <div class="well">
            <h1>Advertisement</h1>
            <p>Place New Add</p>
        </div>
    </div>
</section>
<section class="container">

    <form:form  method="POST" modelAttribute="newAdd" class="form-horizontal" enctype="multipart/form-data">
        <fieldset>
            <legend>Fill up the required fields</legend>

            <div class="row">
            <div class="form-group col-md-5" >
                <label class="control-label col-lg-2 col-lg-2" for="flatId">Flat ID</label>
                <div class="col-lg-10">
                    <form:input id="flatId" path="flatId" type="text" class="form:input-large form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="title">Give a Title</label>
                <div class="col-lg-10">
                    <form:input id="title" path="title" type="text" class="form:input-large form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
            <label class="control-label col-lg-2" for="propertyType">Property Type</label>
            <div class="col-lg-10 " >
            <form:radiobutton id="propertyType" path="propertyType" value="Residential" checked="checked"  />Residential
            <form:radiobutton id="propertyType" path="propertyType" value="Commercial" />Commercial
            </div>
            </div>


            <div class="form-group col-md-5">
                <label class="control-label col-lg-2" for="purpose">Purpose</label>
                <div class="col-lg-10">
                    <form:radiobutton id="purpose" path="purpose" value="Rent" checked="checked"  />For Rent
                    <form:radiobutton id="purpose" path="purpose" value="Sale" />For Sale
                </div>
            </div>



            <div class="form-group col-md-5" >
                <label class="control-label col-lg-2" for="details">Details</label>
                <div class="col-lg-10">
                    <form:textarea id="details" path="details" rows = "4" class="form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="location">Location</label>
                <div class="col-lg-10">
                    <form:input id="location" path="location" type="text" class="form:input-large form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="city">City</label>
                <div class="col-lg-10">
                    <form:input id="city" path="city" type="text" class="form:input-large form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="price">Price</label>
                <div class="col-lg-10">
                    <form:input id="price" path="price" type="number" value="20000" class="form:input-large form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="sqFeet">Flat Size(Square Feet)</label>
                <div class="col-lg-10">
                    <form:input id="sqFeet" path="sqFeet" type="number" value="1500" class="form:input-large form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="bed">Number of Bedrooms</label>
                <div class="col-lg-10">
                    <form:input id="bed" path="bed" type="number" value="3" class="form:input-large form-control"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="bath">Number of Bathrooms</label>
                <div class="col-lg-10">
                    <form:input id="bath" path="bath" type="number" value="2" class="form:input-large form-control"/>
                </div>
            </div>


            <div class="form-group col-md-5" >
                <label class="control-label col-lg-2" for="part"> Add an Image
                </label>
                <div class="col-lg-10">
                    <form:input id="part" path="image" type="file" class="form:input-large "  />
                </div>
            </div>

            </div>


            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" id="btnAdd" class="btn btn-primary" value ="Add"/>
                </div>
            </div>
        </fieldset>
    </form:form>
</section>
</body>
</html>
