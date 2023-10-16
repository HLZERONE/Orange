<%@ page import="com.myservlet.ConnectDatabase" %>
<%@ page import="com.myservlet.Order" %>
<%@ page import="com.myservlet.ShoppingCart" %>
<%@ page import="com.myservlet.Product" %>
<%@ page import="com.myservlet.ManageShoppingCartServlet" %>
<%@ page import= "java.util.Map"%>
<%@ page import= "java.util.Map"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<%
  ConnectDatabase database = new ConnectDatabase();
  Order lastOrder = database.lastOrder(response);
  // Retrieve the shopping cart from the session
  ShoppingCart cart = lastOrder.getOrderDetail();
  String zipCode = request.getParameter("zip");

  double allSum = 0;
  StringBuffer str = new StringBuffer();
  for(Map.Entry<Integer,Integer> entry : cart.getProduct().entrySet()){
    Product p = database.detailInfo(entry.getKey(), response);
    int quantity = entry.getValue();
    String price = p.getPrice();
    String phoneName = p.getPhoneName();
    double total = quantity * Double.parseDouble(price.substring(1));
    allSum += total;
    str.append("<tr>");
    str.append(ManageShoppingCartServlet.formatProduct(phoneName, price, quantity, total));
    str.append("</tr>");
  }
  
  double tax = database.getTaxByZipCode(zipCode, null);

  String totalPrice = String.format("$%.2f", allSum * (1 + tax));
  //clear the shoppingcart
  HttpSession httpSession = request.getSession();
  httpSession.setAttribute("cart", null);
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
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
      crossorigin="anonymous"
    ></script>
    <title>Confirmation Page</title>
  </head>
  <body>
    <!--navigator-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img
            src="img/logo.png"
            alt="Logo"
            width="40"
            height="40"
            class="d-inline-block align-text-top"
          />
          ORANGE
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div
          class="collapse navbar-collapse justify-content-end"
          id="navbarNav"
        >
          <div class="navbar-nav">
            <a class="nav-link" href="overview.html">Overview</a>
            <a class="nav-link" href="./index.jsp">Home</a>
            <a class="nav-link active" href="./manageShoppingCart">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                fill="currentColor"
                class="bi bi-cart"
                viewBox="0 0 16 16"
              >
                <path
                  d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
                />
              </svg>
              Shopping Cart
            </a>
          </div>
        </div>
      </div>
    </nav>
    <div class="container">
      <h1>Thank you for your order in Orange!</h1>
      <h3>Order Detail Information: </h3>
      <table class="table">
        <tbody>
          <tr>
            <%String.format("%s %s", lastOrder.getFirstName(), lastOrder.getLastName());%>
          </tr>
          <tr>
            <%lastOrder.getAddress();%>
          </tr>
          <tr id = "phone">
            <%lastOrder.getPhone_num();%>
          </tr>
        </tbody>
      </table>
      <table class="table">
        <thead>
          <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <%= str.toString() %>
        </tbody>
        <tfoot>
          <tr>
            <td colspan='3'>Total</td>
            <td id = "totalPrice" name = "totalPrice"><%= totalPrice%></td>
          </tr>
        </tfoot>
      </table>
    </div>

    <footer id="Contact">
      <p>TEAM 21: Lu He, Tongxi Zhou, Zhaoteng Li</p>
      <p>Copyright Orange&copy;</p>
    </footer>
  </body>
</html>
