<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.myservlet.ConnectDatabase" %>
<%@ page import="com.myservlet.Product" %>
<%@ page import="com.myservlet.ParameterOverrideRequestWrapper" %>

<%
  ConnectDatabase connectDatabase = new ConnectDatabase();
  List<Product> products = connectDatabase.productInfo(null);
  List<Product> orders = connectDatabase.lastFiveOrder(null);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <!--    mobile friendly-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--code to use boostrap-->
    <link rel="stylesheet" href="overview_style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script src="info.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        
    <title>Home</title>
        
  </head>
  <body>
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
            <a class="nav-link active" href="index.html">Home</a>
            <a class="nav-link" href="./manageShoppingCart">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              </svg> Shopping Cart
            </a>
          </div>
        </div>
      </div>
    </nav>
        <!--search-->
      <nav class="navbar bg-body-tertiary text-right">
          <div class="container-fluid ">
              <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit">Search</button>
              </form>
          </div>
      </nav>
    <!--card -->
    <div class="container" style="margin-top: 6rem;">
      <div class="row g-4 justify-content-center">
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=1">
              <img 
              src="<%= products.get(0).getImageOne() %>"
              class="card-img-top zoom-image h-50"
              alt="..."
              id="your-image-id"
            /></a>
            
            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(0).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(0).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(0).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(0).getScreenSize() %>
              </ul>
              <h5><%= products.get(0).getPrice() %></h5>

              <div id="rating0">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=2">
              <img
                      src="<%= products.get(1).getImageOne() %>"
                      class="card-img-top zoom-image h-50"
                      alt="..."
                      id="your-image-id"
              /></a>

            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(1).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(1).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(1).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(1).getScreenSize() %>
              </ul>
              <h5><%= products.get(1).getPrice() %></h5>
              <div id="rating1">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=3">
              <img
                      src="<%= products.get(2).getImageOne() %>"
                      class="card-img-top zoom-image h-50"
                      alt="..."
                      id="your-image-id"
              /></a>

            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(2).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(2).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(2).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(2).getScreenSize() %>
              </ul>
              <h5><%= products.get(2).getPrice() %></h5>
              <div id="rating2">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
              <!--                    <a href="#" class="btn btn-primary">Go somewhere</a>-->
            </div>
          </div>
        </div>
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=4">
              <img
                      src="<%= products.get(3).getImageOne() %>"
                      class="card-img-top zoom-image h-50"
                      alt="..."
                      id="your-image-id"
              /></a>

            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(3).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(3).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(3).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(3).getScreenSize() %>
              </ul>
              <h5><%= products.get(3).getPrice() %></h5>
              <div id="rating3">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row g-4 justify-content-center">
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=5">
              <img
                      src="<%= products.get(4).getImageOne() %>"
                      class="card-img-top zoom-image h-50"
                      alt="..."
                      id="your-image-id"
              /></a>

            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(4).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(4).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(4).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(4).getScreenSize() %>
              </ul>
              <h5><%= products.get(4).getPrice() %></h5>

              <div id="rating4">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=6">
              <img
                      src="<%= products.get(5).getImageOne() %>"
                      class="card-img-top zoom-image h-50"
                      alt="..."
                      id="your-image-id"
              /></a>

            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(5).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(5).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(5).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(5).getScreenSize() %>
              </ul>
              <h5><%= products.get(5).getPrice() %></h5>
              <div id="rating5">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=7">
              <img
                      src="<%= products.get(6).getImageOne() %>"
                      class="card-img-top zoom-image h-50"
                      alt="..."
                      id="your-image-id"
              /></a>

            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(6).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(6).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(6).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(6).getScreenSize() %>
              </ul>
              <h5><%= products.get(6).getPrice() %></h5>
              <div id="rating6">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
              <!--                    <a href="#" class="btn btn-primary">Go somewhere</a>-->
            </div>
          </div>
        </div>
        <div class="col-md">
          <div class="card ms-auto h-100 border-0">
            <a href="./detailed-page.jsp?id=8">
              <img
                      src="<%= products.get(7).getImageOne() %>"
                      class="card-img-top zoom-image h-50"
                      alt="..."
                      id="your-image-id"
              /></a>

            <div class="card-body text-center">
              <h3 class="card-title"><%= products.get(7).getPhoneName() %></h3>
              <ul>
                Internal Memory:<%= products.get(7).getStorage() %>
              </ul>
              <ul>
                RAM:<%= products.get(7).getRam() %>
              </ul>
              <ul>
                Screen Size:<%= products.get(7).getScreenSize() %>
              </ul>
              <h5><%= products.get(7).getPrice() %></h5>
              <div id="rating7">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<div class="row g-4 justify-content-center">
      <div class="col-md-2">
        <div class="card ms-auto h-100 border-0">
          <a href="./detailed-page.jsp?id=9">
            <img
                    src="<%= products.get(8).getImageOne() %>"
                    class="card-img-top zoom-image h-50"
                    alt="..."
                    id="your-image-id"
            /></a>

          <div class="card-body text-center">
            <h3 class="card-title"><%= products.get(8).getPhoneName() %></h3>
            <ul>
              Internal Memory:<%= products.get(8).getStorage() %>
            </ul>
            <ul>
              RAM:<%= products.get(8).getRam() %>
            </ul>
            <ul>
              Screen Size:<%= products.get(8).getScreenSize() %>
            </ul>
            <h5><%= products.get(8).getPrice() %></h5>

            <div id="rating8">
              <span class="star" data-value="1"></span>
              <span class="star" data-value="2"></span>
              <span class="star" data-value="3"></span>
              <span class="star" data-value="4"></span>
              <span class="star" data-value="5"></span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-2">
        <div class="card ms-auto h-100 border-0">
          <a href="./detailed-page.jsp?id=10">
            <img
                    src="<%= products.get(9).getImageOne() %>"
                    class="card-img-top zoom-image h-50"
                    alt="..."
                    id="your-image-id"
            /></a>

          <div class="card-body text-center">
            <h3 class="card-title"><%= products.get(9).getPhoneName() %></h3>
            <ul>
              Internal Memory:<%= products.get(9).getStorage() %>
            </ul>
            <ul>
              RAM:<%= products.get(9).getRam() %>
            </ul>
            <ul>
              Screen Size:<%= products.get(9).getScreenSize() %>
            </ul>
            <h5><%= products.get(9).getPrice() %></h5>
            <div id="rating9">
              <span class="star" data-value="1"></span>
              <span class="star" data-value="2"></span>
              <span class="star" data-value="3"></span>
              <span class="star" data-value="4"></span>
              <span class="star" data-value="5"></span>
            </div>
          </div>
        </div>
      </div>
    <!--Up to three cards in a row, each card equal in width-->
      <!-- last 5 orders table -->
  <table class="table table-hover">
    <thead>
    <tr>
      <th>Product Name</th>
      <th>Price</th>
      <th>Rating</th>
    </tr>
    </thead>
    <tbody>
    <form action="./UpdateRate" method="post" id="myForm">
      <input type="hidden" id="idReturn" name="idReturn">
      <input type="hidden" id="rateReturn" name="rateReturn">
    </form>
    <tr id="order0">
      <td><%= products.get(0).getPhoneName() %></td>
      <td><%= products.get(0).getPrice() %></td>
      <td>
        <div class="rating">
          <span class="fa fa-star-o" id="star0" data-rating="1">&#9734;</span>
          <span class="fa fa-star-o" id="star1" data-rating="2">&#9734;</span>
          <span class="fa fa-star-o" id="star2" data-rating="3">&#9734;</span>
          <span class="fa fa-star-o" id="star3" data-rating="4">&#9734;</span>
          <span class="fa fa-star-o" id="star4" data-rating="5">&#9734;</span>
        </div>
      </td>
    </tr>
    <tr id="order1">
      <td><%= products.get(1).getPhoneName() %></td>
      <td><%= products.get(1).getPrice() %></td>
      <td>
        <div class="rating">
          <span class="fa fa-star-o" id="star5" data-rating="1">&#9734;</span>
          <span class="fa fa-star-o" id="star6" data-rating="2">&#9734;</span>
          <span class="fa fa-star-o" id="star7" data-rating="3">&#9734;</span>
          <span class="fa fa-star-o" id="star8" data-rating="4">&#9734;</span>
          <span class="fa fa-star-o" id="star9" data-rating="5">&#9734;</span>
        </div>
      </td>
    </tr>
    <tr id="order2">
      <td><%= products.get(2).getPhoneName() %></td>
      <td><%= products.get(2).getPrice() %></td>
      <td>
        <div class="rating">
          <span class="fa fa-star-o" id="star10" data-rating="1">&#9734;</span>
          <span class="fa fa-star-o" id="star11" data-rating="2">&#9734;</span>
          <span class="fa fa-star-o" id="star12" data-rating="3">&#9734;</span>
          <span class="fa fa-star-o" id="star13" data-rating="4">&#9734;</span>
          <span class="fa fa-star-o" id="star14" data-rating="5">&#9734;</span>
        </div>
      </td>
    </tr>
    <tr id="order3">
      <td><%= products.get(3).getPhoneName() %></td>
      <td><%= products.get(3).getPrice() %></td>
      <td>
        <div class="rating">
          <span class="fa fa-star-o" id="star15" data-rating="1">&#9734;</span>
          <span class="fa fa-star-o" id="star16" data-rating="2">&#9734;</span>
          <span class="fa fa-star-o" id="star17" data-rating="3">&#9734;</span>
          <span class="fa fa-star-o" id="star18" data-rating="4">&#9734;</span>
          <span class="fa fa-star-o" id="star19" data-rating="5">&#9734;</span>
        </div>
      </td>
    </tr>
    <tr id="order4">
      <td><%= products.get(4).getPhoneName() %></td>
      <td><%= products.get(4).getPrice() %></td>
      <td>
        <div class="rating">
          <span class="fa fa-star-o" id="star20" data-rating="1">&#9734;</span>
          <span class="fa fa-star-o" id="star21" data-rating="2">&#9734;</span>
          <span class="fa fa-star-o" id="star22" data-rating="3">&#9734;</span>
          <span class="fa fa-star-o" id="star23" data-rating="4">&#9734;</span>
          <span class="fa fa-star-o" id="star24" data-rating="5">&#9734;</span>
        </div>
      </td>
    </tr>
    </tbody>

    </table>
    <footer id="Contact">
      <p>TEAM 21: Lu He, Tongxi Zhou, Zhaoteng Li</p>
      <p>Copyright Orange&copy;</p>
    </footer>
  </body>
</html>

<!--for each onclick:
<button onclick="redirectToNewPage()">Click me</button>
-->

<script>
  $(document).on('click', '.rating .fa-star-o', function(e) {
    var ratingCol = $(this).closest('tr').attr('id');
    var starRating = $(this).data('rating');
    console.log('User clicked on star ' + starRating + ' in rating column ' + ratingCol);
  });
</script>

<script>
  const rate0 = "${param.rate0}";
  const rate1 = "${param.rate1}";
  const rate2 = "${param.rate2}";
  const rate3 = "${param.rate3}";
  const rate4 = "${param.rate4}";
  const rate5 = "${param.rate5}";
  const rate6 = "${param.rate6}";
  const rate7 = "${param.rate7}";
  const rate8 = "${param.rate8}";
  const rate9 = "${param.rate9}";
  for (let i = 0; i < 10; i++) {
    const productId = document.getElementById('rating' + i);
    const ratingValue = eval('rate' + i);
    stars.forEach((star) => {
      const starValue = star.getAttribute('data-value');

      // 如果星星的值小于等于评分，则填充它
      if (starValue <= ratingValue) {
        star.classList.add('filled');
      } else {
        star.classList.remove('filled');
      }
    });
  }
</script>
