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

@WebServlet("/showAllProduct")
public class AllProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        ConnectDatabase connectDatabase = new ConnectDatabase();
        List<Product> products = connectDatabase.productInfo(response);
        // Creating a new parameter map with an updated value for param1

        Map<String, String[]> parameterMap = new HashMap<>();
        for (int i = 0; i < products.size(); i++) {
            parameterMap.put("phoneName" + i, new String[]{products.get(i).getPhoneName()});
            parameterMap.put("id" + i, new String[]{String.valueOf(products.get(i).getId())});
            parameterMap.put("img" + i, new String[]{products.get(i).getImageOne()});
            parameterMap.put("storage" + i, new String[]{products.get(i).getStorage()});
            parameterMap.put("ram" + i, new String[]{products.get(i).getRam()});
            parameterMap.put("rate" + i, new String[]{String.valueOf(products.get(i).getRate())});
            parameterMap.put("screenSize" + i, new String[]{products.get(i).getScreenSize()});
            parameterMap.put("numPeople" + i, new String[]{String.valueOf(products.get(i).getNumPeople())});
            parameterMap.put("price" + i , new String[]{String.valueOf(products.get(i).getPrice())});
        }

        request.setAttribute("parameterMap", parameterMap);

        // Creating a new HttpServletRequestWrapper with the updated parameter map
        HttpServletRequestWrapper wrappedRequest = new ParameterOverrideRequestWrapper(request, parameterMap);

        System.out.println("mainpage");
        // Forwarding the wrapped request and response to the JSP page
        RequestDispatcher dispatcher = (RequestDispatcher)request.getRequestDispatcher("/OrderInfo");
        dispatcher.include(wrappedRequest, response);

    }
}
