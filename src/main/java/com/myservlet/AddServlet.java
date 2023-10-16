package com.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/add")
public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        PrintWriter writer = resp.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3333/inf124" + "email", "root",
                    "Ed20001125%123");
            Statement stmt = con.createStatement();
            String sql = String.format("INSERT INTO email (name, email) VALUES(\"%s\", \"%s\")", name, email);
            int rs = stmt.executeUpdate(sql);
            writer.println("<html> <body>");
            writer.println("Name: " + name + " Email: " + email);
            writer.println("<h3> Data was submitted </h3>");
            writer.println("</body> </html> ");

        } catch (ClassNotFoundException e) {
            writer.println("<html> <body>");
            writer.println("<h3> Could not load driver </h3>");
            writer.println("</body> </html> ");
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("<html> <body>");
            writer.println("Name: " + name + " Email: " + email);
            writer.println("<h3> There was an error inserting the data </h3>");
            writer.println("</body> </html> ");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
