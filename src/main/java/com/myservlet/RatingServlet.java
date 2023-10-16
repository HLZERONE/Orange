//DEPLOYMENT


package com.myservlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RatingServlet extends HttpServlet {
    
    // 处理 GET 请求
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        
        PrintWriter out = response.getWriter();
        
        // 从 URL 参数中获取商品 ID 和评分等级
        String productID = request.getParameter("productID");
        String rating = request.getParameter("rating");
        
        // 将评分信息存储在数据库中
        storeRatingInDatabase(productID, rating);
        
        // 返回确认消息给用户
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>谢谢您的评分！</h1>");
        out.println("</body>");
        out.println("</html>");
    }
    
    // 存储评分信息在数据库中的方法
    private void storeRatingInDatabase(String productID, String rating) {
        // 这里写存储评分信息在数据库中的代码
    }
}
