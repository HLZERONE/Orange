package com.myservlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/OrderInfo")
public class OrderInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                //test
                ConnectDatabase connectDatabase = new ConnectDatabase();
                List<Product> products = connectDatabase.lastFiveOrder(response);
                // Creating a new parameter map with an updated value for param1
        
                Map<String, String[]> parameterMap = (Map<String, String[]>)request.getAttribute("parameterMap");
                for (int i = 0; i < products.size(); i++) {
                    parameterMap.put("phoneName_order" + i, new String[]{products.get(i).getPhoneName()});
                    parameterMap.put("id_order" + i, new String[]{String.valueOf(products.get(i).getId())});
                    parameterMap.put("img_order" + i, new String[]{products.get(i).getImageOne()});
                    parameterMap.put("storage_order" + i, new String[]{products.get(i).getStorage()});
                    parameterMap.put("ram_order" + i, new String[]{products.get(i).getRam()});
                    parameterMap.put("rate_order" + i, new String[]{String.valueOf(products.get(i).getRate())});
                    parameterMap.put("screenSize_order" + i, new String[]{products.get(i).getScreenSize()});
                    parameterMap.put("numPeople_order" + i, new String[]{String.valueOf(products.get(i).getNumPeople())});
                    parameterMap.put("price_order" + i , new String[]{String.valueOf(products.get(i).getPrice())});
                }
        
                
        
                // Creating a new HttpServletRequestWrapper with the updated parameter map
                HttpServletRequestWrapper wrappedRequest = new ParameterOverrideRequestWrapper(request, parameterMap);
        
        
                // Forwarding the wrapped request and response to the JSP page
                RequestDispatcher dispatcher = (RequestDispatcher)request.getRequestDispatcher("index.jsp");
                dispatcher.forward(wrappedRequest, response);
    }
}