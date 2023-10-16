package com.myservlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/SubmitOrder")
public class SubmitOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                ConnectDatabase connectDatabase = new ConnectDatabase();
                Map<String, String[]> parameterMap = new HashMap<>();
                HttpSession session = request.getSession();
                ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
                Order order = new Order();
                //get address: city + state
                String zipCode = request.getParameter("zip-code");
                String address = "default";
                address = connectDatabase.getStateNameByZipCode(zipCode, response);

                order.setFirstName(request.getParameter("first-name"));
                order.setLastName(request.getParameter("last-name"));
                order.setAddress(request.getParameter("address") + ", " + address + ", " + request.getParameter("zip-code"));
                order.setPhone_num(request.getParameter("phone"));
                order.setShippingMethod(request.getParameter("shipping-method"));
                order.setCredit_card_num(request.getParameter("creditcard"));
                order.setExpiryDate(request.getParameter("expiryDate"));
                order.setCvv(request.getParameter("cvv"));
                order.setOrderDetail(cart);

                //should return orderId for futher query
                connectDatabase.insertOrder(order, response);
                
                // Creating a new HttpServletRequestWrapper with the updated parameter map
                HttpServletRequestWrapper wrappedRequest = new ParameterOverrideRequestWrapper(request, parameterMap);
        
        
                // Forwarding the wrapped request and response to the JSP page
                String zip = request.getParameter("zip-code");
                RequestDispatcher dispatcher = (RequestDispatcher)request.getRequestDispatcher("./Order_Detail.jsp?zip="+zip);
                dispatcher.forward(wrappedRequest, response);
    }
}