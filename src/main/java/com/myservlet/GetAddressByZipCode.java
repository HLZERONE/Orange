package com.myservlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/GetAddressByZipCode")
public class GetAddressByZipCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConnectDatabase connectDatabase = new ConnectDatabase();
        String zipCode = request.getParameter("zipCode");
        String message = "default";
        double taxRate = 0.0;
        if (zipCode.length() == 5) {
            message = connectDatabase.getStateNameByZipCode(zipCode, response);
            taxRate = connectDatabase.getTaxByZipCode(zipCode, response);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<String> dataList = new ArrayList<>();
        dataList.add(message);
        dataList.add(String.valueOf(taxRate));
        String jsonData = new Gson().toJson(dataList); // 将数据转换为JSON格式

        response.getWriter().write(jsonData); // 返回数据给客户端


    }

}

