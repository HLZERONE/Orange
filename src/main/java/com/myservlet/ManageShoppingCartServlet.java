package com.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/manageShoppingCart")
public class ManageShoppingCartServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    // Retrieve the shopping cart from the session
    HttpSession session = request.getSession();
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

    // Check if the cart is not empty
    if (cart != null && !cart.getProduct().isEmpty()) {
         ConnectDatabase database = new ConnectDatabase();
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
        
        request.setAttribute("productString", str.toString());
        request.setAttribute("totalPrice", String.format("%.2f", allSum));

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Shopping_Cart.jsp");
        dispatcher.forward(request, response);
    } else {
        // If the cart is empty, display a message on the HTML page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/demo.jsp");
        dispatcher.forward(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      int productId = Integer.parseInt(request.getParameter("product_id"));

      //check if shopping cart exists
      HttpSession session = request.getSession();
      ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
      if(cart == null){
        cart = new ShoppingCart();
        session.setAttribute("cart", cart);
      }
  
      cart.add(productId);
      PrintWriter writer = response.getWriter();
      writer.println("<html> <body>");
      writer.println("Item added to cart!");
      writer.println("</body> </html> ");
    }

    public static String formatProduct(String productName, String price, int quantity, double total){
      //double total = quantity * Double.parseDouble(price);
      String format = String.format("<td>%s</td><td>%s</td><td>%d</td><td>$%.2f</td>", productName, price, quantity, total);
      return format;
    }
}
