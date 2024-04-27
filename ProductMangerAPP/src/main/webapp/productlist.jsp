<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.khasim.project.ProductsDao"%>
<%@ page import="java.util.Base64"%>

<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center text-success">List Of Products</h1>
        <div>
            <input type="text" placeholder="Search">
        </div>
        <div class="mb-2">
            <a class="btn btn-success" href="add-product.html">Add Product</a>
        </div>
        <div>
            <c:if test="${result == 1}">
                <h2 class="text-success text-center">Data Inserted Successfully</h2>
            </c:if>
        </div>
        <div>
            <c:choose>
                <c:when test="${deleteResult == 1}">
                    <h2 class="text-success text-center">Data Deleted Successfully</h2>
                </c:when>
                <c:when test="${deleteResult == 0}">
                    <h2 class="text-danger text-center">Data Deletion Failed</h2>
                </c:when>
            </c:choose>
        </div>
        <div>
            <c:if test="${Uresult == 1}">
                <h2 class="text-danger text-center">Data Updated Successfully</h2>
            </c:if>
        </div>

        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Cost</th>
                    <th>Brand</th>
                    <th>Made In</th>
                    <th>Manufacture Date</th>
                    <th>Expiry Date</th>
                    <th>Image</th>
                    <th>Audio</th>
                    <th>Video</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${ProductsDao.findAll()}">
                    <tr>
                        <td>${product.proId}</td>
                        <td>${product.proName}</td>
                        <td>${product.proPrice}</td>
                        <td>${product.proBrand}</td>
                        <td>${product.proMadein}</td>
                        <td>${product.proMfgdate}</td>
                        <td>${product.proExpdate}</td>
                        <td>
                            <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(product.proImage)}"
                                alt="Product Image" style="max-width: 100px; max-height: 100px;">
                        </td>
                        <td>
   							 <audio controls>
       						 <!-- MP3 format -->
       						 <source src="data:audio/mpeg;base64,${Base64.getEncoder().encodeToString(product.proAudio)}" type="audio/mpeg">
        <!-- OGG format
        <source src="data:audio/ogg;base64,${Base64.getEncoder().encodeToString(product.proAudio)}" type="audio/ogg">
        <!-- WAV format 
        <source src="data:audio/wav;base64,${Base64.getEncoder().encodeToString(product.proAudio)}" type="audio/wav"> -->
    						</audio>
						</td>
						<td>
    <video controls width="200" height="100">
    <!-- MP4 format -->
    <source src="data:video/mp4;base64,${Base64.getEncoder().encodeToString(product.proVideo)}" type="video/mp4">
    <!-- You can include additional formats if needed -->
    <!-- <source src="data:video/webm;base64,${Base64.getEncoder().encodeToString(product.proVideo)}" type="video/webm"> -->
    <!-- <source src="data:video/ogg;base64,${Base64.getEncoder().encodeToString(product.proVideo)}" type="video/ogg"> -->
    <!-- <source src="data:video/mov;base64,${Base64.getEncoder().encodeToString(product.proVideo)}" type="video/mov"> -->
</video>

</td>
						
                        <td>
                            <a class="btn btn-primary" href="./DeleteProductServlet?proId=${product.proId}">Delete</a>
                            <a class="btn btn-primary" href="./EditProductServlet?proId=${product.proId}">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>