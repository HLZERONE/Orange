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
import java.util.Map;

@WebServlet("/showProduct")
public class ProductInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productId = request.getParameter("id");

        int productIdInt = Integer.parseInt(productId);

        ConnectDatabase connectDatabase = new ConnectDatabase();
        Product product = connectDatabase.detailInfo(productIdInt, response);
        // Creating a new parameter map with an updated value for param1

        Map<String, String[]> parameterMap = new HashMap<>();
        
        parameterMap.put("phoneName", new String[]{product.getPhoneName()});
        parameterMap.put("id", new String[]{String.valueOf(product.getId())});
        parameterMap.put("img1", new String[]{product.getImageOne()});
        parameterMap.put("img2", new String[]{product.getImageTwo()});
        parameterMap.put("img3", new String[]{product.getImageThree()});
        parameterMap.put("screenSize", new String[]{product.getScreenSize()});
        parameterMap.put("resolution", new String[]{product.getResolution()});
        parameterMap.put("processor", new String[]{product.getProcessor()});
        parameterMap.put("ram", new String[]{product.getRam()});
        parameterMap.put("storage", new String[]{product.getStorage()});
        parameterMap.put("operatingSystem", new String[]{product.getOpratingSystem()});
        parameterMap.put("camera", new String[]{product.getRearFacingCamera()});


        // Creating a new HttpServletRequestWrapper with the updated parameter map
        HttpServletRequestWrapper wrappedRequest = new ParameterOverrideRequestWrapper(request, parameterMap);

    
        // Forwarding the wrapped request and response to the JSP page
        RequestDispatcher dispatcher = (RequestDispatcher) request.getRequestDispatcher("detailed-page.jsp");
        dispatcher.forward(wrappedRequest, response);
    
    }


}
