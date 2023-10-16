package com.myservlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;


@WebServlet("/OrderDetailInfo")
public class OrderDetailedPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ConnectDatabase database = new ConnectDatabase();
        Order lastOrder = database.lastOrder(response);
        // Retrieve the shopping cart from the session
        ShoppingCart cart = lastOrder.getOrderDetail();
        
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
         
        str.append("<tr>");
        str.append("<td colspan='3'>Total</td>");
        str.append("<td>");
        str.append(String.format("$ %.2f", allSum));
        str.append("</td>");
        str.append("</tr>");
        request.setAttribute("productString", str.toString());
        request.setAttribute("name", String.format("%s %s", lastOrder.getFirstName(), lastOrder.getLastName()));
        request.setAttribute("address", lastOrder.getAddress());
        request.setAttribute("phone", lastOrder.getPhone_num());
        //clear the shoppingcart
        HttpSession session = request.getSession();
        session.setAttribute("cart", null);
        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Order_Detail.jsp");
        dispatcher.forward(request, response);
    }
}