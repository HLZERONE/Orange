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
import java.util.List;
import java.util.Map;

@WebServlet("/UpdateRate")
public class UpdateRatingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ConnectDatabase connectDatabase = new ConnectDatabase();
        int id = Integer.parseInt(request.getParameter("idReturn"));
        double rate = Double.parseDouble(request.getParameter("rateReturn"));
        System.out.println(id);
        System.out.println(rate);
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
        Map<String, String[]> parameterMap = new HashMap<>();

        //should return orderId for futher query
        String s = connectDatabase.updateRate(id, rate, response);
        System.out.println(s);

        // Creating a new HttpServletRequestWrapper with the updated parameter map
        //HttpServletRequestWrapper wrappedRequest = new ParameterOverrideRequestWrapper(request, parameterMap);

        // System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");

        // // Forwarding the wrapped request and response to the JSP page
        // RequestDispatcher dispatcher = (RequestDispatcher)request.getRequestDispatcher("/showAllProduct");
        // dispatcher.forward(wrappedRequest, response);
        response.sendRedirect("./index.jsp");
    }
}