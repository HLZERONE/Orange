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
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/show")
public class ListServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
                writer.println("<html> <body>");
                writer.println("<h3> Could not load driver </h3>");
                writer.println("</body> </html> ");
        /*
        PrintWriter writer = resp.getWriter();
        try{
            ConnectDatabase connectDatabase = new ConnectDatabase();
            ResultSet rs = connectDatabase.display(resp);
            writer.println("<html> <body>");
            writer.println("<h3>Email list</h3>");
            while(rs.next()){                  
                String name = rs.getString("name");
                String email = rs.getString("email");
                writer.println(String.format("<li>Name: %s . Email: %s</li>", name, email));
            }
            writer.println("</body> </html> ");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        */
    }

    @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                // String productId = request.getParameter("productId");
                // int productIdInt = Integer.parseInt(productId);
        
                // //ConnectDatabase connectDatabase = new ConnectDatabase();
                // //Product product = connectDatabase.detailInfo(productIdInt, response);
                // // Creating a new parameter map with an updated value for param1
                // Map<String, String[]> parameterMap = new HashMap<>();
                // parameterMap.put("phoneName", new String[]{"orange123"});
                // //System.out.println(parameterMap.get("phoneName"));
                // /*parameterMap.put("phoneName", new String[]{product.getPhoneName()});
                // parameterMap.put("id", new String[]{String.valueOf(product.getId())});
                // parameterMap.put("img1", new String[]{product.getImageOne()});
                // parameterMap.put("img2", new String[]{product.getImageTwo()});
                // parameterMap.put("img3", new String[]{product.getImageThree()});
                // parameterMap.put("screenSize", new String[]{product.getScreenSize()});
                // parameterMap.put("resolution", new String[]{product.getResolution()});
                // parameterMap.put("processor", new String[]{product.getProcessor()});
                // parameterMap.put("ram", new String[]{product.getRam()});
                // parameterMap.put("storage", new String[]{product.getStorage()});
                // parameterMap.put("operatingSystem", new String[]{product.getOpratingSystem()});
                // parameterMap.put("camera", new String[]{product.getRearFacingCamera()});*/
        
        
                // // Creating a new HttpServletRequestWrapper with the updated parameter map
                // HttpServletRequestWrapper wrappedRequest = new ParameterOverrideRequestWrapper(request, parameterMap);
        
                // // Forwarding the wrapped request and response to the JSP page
                // RequestDispatcher dispatcher = (RequestDispatcher) request.getRequestDispatcher("detailed-page.html");
                // dispatcher.forward(wrappedRequest, response);
    }
}
