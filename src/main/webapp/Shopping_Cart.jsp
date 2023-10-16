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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"
  ></script>

  <script>
    $(document).ready(function(){
      $("#zip-code").blur(function(){
        var zipCode = $("#zip-code").val();
        $.ajax({
          url: "GetAddressByZipCode",
          type: 'GET',
          data: {zipCode: zipCode},
          success: function(data){
            var tax = parseFloat(data[1], 10) * parseFloat(totalPrice, 10);
            var newTotal = tax + parseFloat(totalPrice, 10);
            $("#zipResult").text(data[0]);
            $("#taxRate").text(tax.toLocaleString('en-US', {style: 'currency', currency: 'USD'}));
            $("#totalPrice").text(newTotal.toLocaleString('en-US', {style: 'currency', currency: 'USD'}));
          }
        });
      });
    });
  </script>
  <title>Shopping Cart</title>
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
  <h1>Shopping Cart</h1>
  <table class="table">
    <thead>
    <tr>
      <th>Product</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Total</th>
    </tr>
    </thead>
    <tbody id = "productDisplay">
    <!-- loop through cart items and display in table rows -->
    </tbody>
    <tfoot>
      <tr>
        <td colspan='3'>Tax</td>
        <td id = "taxRate" name = "taxRate"></td>
      </tr>
      <tr>
        <td colspan='3'>Total</td>
        <td id = "totalPrice" name = "totalPrice"></td>
      </tr>
    </tfoot>

  </table>
  <form id="myForm" method="post" action="./SubmitOrder">
    <h2>Shipping Information</h2>
    <div class="form-group col-sm-8">
      <label for="first-name" class="col-sm-5 col-form-label">
        First name:
      </label>
      <div class="col-sm-10">
        <input
                type="text"
                id="first-name"
                name="first-name"
                class="form-control"
        />
      </div>
    </div>
    <div class="form-group col-sm-8">
      <label for="last-name" class="col-sm-5 col-form-label">
        Last name:
      </label>
      <div class="col-sm-10">
        <input
                type="text"
                id="last-name"
                name="last-name"
                class="form-control"
        />
      </div>
    </div>
    <div class="form-group col-sm-8">
      <label for="zip-code" class="col-sm-5 col-form-label">
        zip code:
      </label>
      <div class="col-sm-10">
        <input
                type="text"
                id="zip-code"
                name="zip-code"
                class="form-control"
        />
        <small class="form-text text-muted">5 digit zip code</small>
      </div>
      <div id="zipResult" name = "zipResult">state</div>
    </div>
    <div class="form-group col-sm-8">
      <label for="address">Address</label>
      <textarea
              class="form-control"
              id="address"
              name="address"
              required
      ></textarea>
    </div>
    <div class="form-group col-sm-8">
      <label for="shipping-method" class="col-sm-5 col-form-label">
        Shipping method:
      </label>
      <div class="col-sm-10">
        <select
                id="shipping-method"
                name="shipping-method"
                class="form-control"
        >
          <option value="overnight">Overnight</option>
          <option value="2-days">2-days expedited</option>
          <option value="6-days">6-days ground</option>
        </select>
      </div>
    </div>
    <div class="form-group col-sm-8">
      <label for="phone">Phone Number</label>
      <input
              type="tel"
              class="form-control"
              id="phone"
              name="phone"
              pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
              required
      />
      <small class="form-text text-muted">Format: 123-456-7890</small>
    </div>
    <div class="form-group col-sm-8">
      <label for="creditcard">Credit Card Number</label>
      <input
              type="tel"
              class="form-control"
              id="creditcard"
              name="creditcard"
              pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}"
              required
      />
      <small class="form-text text-muted">
        Format: 1234-1234-1234-1234
      </small>
    </div>
    <div class="form-group col-sm-8">
      <label for="expiryDate" class="col-sm-5 col-form-label">
        Expiry Date:
      </label>
      <div class="col-sm-10">
        <input
                type="text"
                id="expiryDate"
                name="expiryDate"
                placeholder="Enter expiry date (MM/YY)"
                class="form-control"
        />
      </div>
      <small class="form-text text-muted">
        Format: 02/23
      </small>
    </div>
    <div class="form-group col-sm-8">
      <label for="cvv" class="col-sm-5 col-form-label">CVV:</label>
      <div class="col-sm-10">
        <input
                type="text"
                id="cvv"
                name="cvv"
                placeholder="Enter CVV"
                class="form-control"
        />
      </div>
      <small class="form-text text-muted">
        Format: 123
      </small>
    </div>
  </form>
</div>
<button class="btn btn-primary" type="submit" id="submit-btn">Submit Order</button>



<footer id="Contact">
  <p>TEAM 21: Lu He, Tongxi Zhou, Zhaoteng Li</p>
  <p>Copyright Orange&copy;</p>
</footer>
</body>
</html>

<script>

  var shoppingCartInfo = "${productString}";
  document.getElementById("productDisplay").innerHTML = shoppingCartInfo;
  var totalPrice = "${totalPrice}";
  document.getElementById("totalPrice").innerHTML = "$" + totalPrice;

  const myForm = document.getElementById('myForm');
  const submitButton = document.getElementById('submit-btn');
  submitButton.addEventListener('click', (event) => {
    // prevent the default form submission behavior
    event.preventDefault();
    console.log("im here!!");
    // check if the form is valid
    if (validateForm()) {
      // if the form is valid, submit the form to the submitOrder servlet
      myForm.submit();
    } else {
      alert("please check your input format");
    }
  });
  // declare an array of strings
  function validateForm() {
    // Get form inputs
    console.log("validing!");
    var firstName = document.getElementById("first-name").value;
    var lastName = document.getElementById("last-name").value;
    var address = document.getElementById("address").value;
    var shippingMethod = document.getElementById("shipping-method").value;
    var phone = document.getElementById("phone").value;
    var creditCard = document.getElementById("creditcard").value;
    var expiryDate = document.getElementById("expiryDate").value;
    var cvv = document.getElementById("cvv").value;


    // Check form inputs for validity
    if (firstName == "" || lastName == "" || address == "" || phone == "" || creditCard == "" || expiryDate == "" || cvv == "") {
      return false;
    }
    if (!phone.match(/^\d{3}-\d{3}-\d{4}$/)) {
      return false;
    }
    if (!creditCard.match(/^\d{4}-\d{4}-\d{4}-\d{4}$/)) {
      return false;
    }
    if (!expiryDate.match(/^\d{2}\/\d{2}$/)) {
      return false;
    }
    if (!cvv.match(/^\d{3}$/)) {
      return false;
    }
    // If all inputs are valid, submit the form
    return true;
  }
  function updateTax() {

  }

</script>
