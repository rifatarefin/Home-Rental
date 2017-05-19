<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet"   href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <title>Add</title>
</head>
<body>
<section>
    <div class="jumbotron">
        <div class="container">
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
                <label class="control-label col-lg-2 col-lg-2" for="id">Add ID</label>
                <div class="col-lg-10">
                    <form:input id="id" path="id" type="text" class="form:input-large"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="title">Give a Title</label>
                <div class="col-lg-10">
                    <form:input id="title" path="title" type="text" class="form:input-large"/>
                </div>
            </div>

            <div class="form-group col-md-5">
            <label class="control-label col-lg-2" for="propertyType">Property Type</label>
            <div class="col-lg-10">
            <form:radiobutton id="propertyType" path="propertyType" value="Residential"  />Residential
            <form:radiobutton id="propertyType" path="propertyType" value="Commercial" />Commercial
            </div>
            </div>


            <div class="form-group col-md-5">
                <label class="control-label col-lg-2" for="purpose">Purpose</label>
                <div class="col-lg-10">
                    <form:radiobutton id="purpose" path="purpose" value="Rent"  />For Rent
                    <form:radiobutton id="purpose" path="purpose" value="Sale" />For Sale
                </div>
            </div>



            <div class="form-group col-md-5" >
                <label class="control-label col-lg-2" for="details">Details</label>
                <div class="col-lg-10">
                    <form:textarea id="details" path="details" rows = "2"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="location">Location</label>
                <div class="col-lg-10">
                    <form:input id="location" path="location" type="text" class="form:input-large"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="city">City</label>
                <div class="col-lg-10">
                    <form:input id="city" path="city" type="text" class="form:input-large"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="price">Price</label>
                <div class="col-lg-10">
                    <form:input id="price" path="price" type="text" class="form:input-large"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="sqFeet">Flat Size</label>
                <div class="col-lg-10">
                    <form:input id="sqFeet" path="sqFeet" type="text" class="form:input-large"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="bed">Number of Bedrooms</label>
                <div class="col-lg-10">
                    <form:input id="bed" path="bed" type="text" class="form:input-large"/>
                </div>
            </div>

            <div class="form-group col-md-5">
                <label class="control-label col-lg-2 col-lg-2" for="bath">Number of Bathrooms</label>
                <div class="col-lg-10">
                    <form:input id="bath" path="bath" type="text" class="form:input-large"/>
                </div>
            </div>


            <div class="form-group col-md-5" >
                <label class="control-label col-lg-2" for="part"> Add an Image
                </label>
                <div class="col-lg-10">
                    <form:input id="part" path="image" type="file" class="form:input-large"  />
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
