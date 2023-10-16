<!--
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
-->

<%@ page import="com.myservlet.ConnectDatabase" %>
<%@ page import="com.myservlet.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
    String productId = request.getParameter("id");

    int productIdInt = Integer.parseInt(productId);

    ConnectDatabase connectDatabase = new ConnectDatabase();
    Product product = connectDatabase.detailInfo(productIdInt, null);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--code to use boostrap-->
        <link rel="stylesheet" href="overview_style.css" />
        <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
                crossorigin="anonymous"
        />
        <script src="info.js"></script>
        <script src="detailed_page.js"></script>
        <title>Order Form</title>
        <!--navigator-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="img/logo.png" alt="Logo" width="40" height="40" class="d-inline-block align-text-top">
                    ORANGE
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <div class="navbar-nav">
                        <a class="nav-link" href="overview.html">Overview</a>
                        <a class="nav-link active" href="./index.jsp">Home</a>
                        <a class="nav-link" href="./manageShoppingCart">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg> Shopping Cart
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <div class="container-fluid">
            <div class="row">
                <!-- Left container content here -->
                <div class="col-md-6 ms-8" >
                    <div class="row md-6 justify-content-center">
                        <div class="col-6">
                            <div id="product-image-carousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#product-image-carousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#product-image-carousel" data-slide-to="1"></li>
                                    <li data-target="#product-image-carousel" data-slide-to="2"></li>
                                </ol>
                                <!-- Slides -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <style>
                                            #image-1 {
                                                max-width: 100%;
                                                height: auto;
                                            }
                                        </style>
                                        <img id="image-1"alt="Product Image 1" class="zoom-image" width="600" src=<%=product.getImageOne()%>>
                                    </div>
                                    <div class="carousel-item">
                                        <style>
                                            #image-2 {
                                                max-width: 100%;
                                                height: auto;
                                            }
                                        </style>
                                        <img id="image-2"alt="Product Image 2" class="zoom-image" width="600" src=<%=product.getImageTwo()%>>
                                    </div>
                                    <div class="carousel-item">
                                        <style>
                                            #image-3 {
                                                max-width: 100%;
                                                height: auto;
                                            }
                                        </style>
                                        <img id="image-3"alt="Product Image 3" class="zoom-image" width="600" src=<%=product.getImageThree()%>>
                                    </div>
                                </div>
                                <!-- Controls -->
                                <a class="carousel-control-prev" href="#product-image-carousel" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#product-image-carousel" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row md-6 justify-content-center">
                        <div class="col-6">
                            <div class="d-flex flex-row">
                                <div class="p-2">
                                    <img id="image-4" alt="Product Thumbnail Image 1" class="img-thumbnail" width="200" src=<%=product.getImageOne()%>>
                                </div>
                                <div class="p-2">
                                    <img id="image-5" alt="Product Thumbnail Image 2" class="img-thumbnail" width="200" src=<%=product.getImageTwo()%>>
                                </div>
                                <div class="p-2">
                                    <img id="image-6" alt="Product Thumbnail Image 3" class="img-thumbnail" width="200" src=<%=product.getImageThree()%>>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Right container content here -->
                <div class="col-md-6 p-3">
                    <h2>Product Identifier: <%=product.getId()%></h2>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Technical Specifications</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Phone Name</td>
                            <td>
                                <%=product.getPhoneName()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Screen Size</td>
                            <td>
                                <%=product.getScreenSize()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Resolution</td>
                            <td>
                                <%=product.getResolution()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Processor</td>
                            <td>
                                <%=product.getProcessor()%>
                            </td>
                        </tr>
                        <tr>
                            <td>RAM</td>
                            <td>
                                <%=product.getRam()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Storage</td>
                            <td>
                                <%=product.getStorage()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Operating System</td>
                            <td>
                                <%=product.getOpratingSystem()%>
                            </td>
                        </tr>
                        <tr>
                            <td>Camera</td>
                            <td>
                                <%=product.getRearFacingCamera()%>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <form action="./manageShoppingCart" method="post">
                        <input type="hidden" id = "idReturn" name="product_id" value = <%=product.getId()%>>
                        <input type="submit" value="Add to Cart">
                    </form>
                </div>
            </div>
        </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>

    <footer id="Contact">
        <p>TEAM 21: Lu He, Tongxi Zhou, Zhaoteng Li</p>
        <p>Copyright Orange&copy;</p>
    </footer>
</html>