<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Product Details</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			// Get the product ID from the URL query string
			const queryString = window.location.search;
			console.log(queryString);
			const urlParams = new URLSearchParams(queryString);
			console.log(urlParams);
			const productId = urlParams.get('productId');
			console.log(productId);

			// Call the ProductDetailsServlet to get the product details
			$.ajax({
				url: 'productDetails',
				data: { productId: productId },
				success: function(product) {
					// Update the content of each element using the product data
					$('#product-name').text(product.name);
					$('#product-price').text(product.price);
					// ...
				},
				error: function() {
					alert('Error getting product details');
				}
			});
		});
	</script>
</head>
<body>
	<h1 id="product-name"></h1>
	<p id="product-price"></p>
	<!-- ... -->
</body>
</html>