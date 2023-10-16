package com.myservlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/com.myservlet.SearchServlet")
public class SearchServlet extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3333/inf124";
    private String dbUser = "root";
    private String dbPass = "Ed20001125%123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("here!!!!!!!!!!!!!!!");
        String keyword = request.getParameter("keyword");
        List<Contact> contacts = searchContacts(keyword);
        for (Contact c : contacts) {
            System.out.println(c.name);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        JsonArray jsonArray = gson.toJsonTree(contacts).getAsJsonArray();
        out.print(jsonArray);
        out.flush();
    }

    private List<Contact> searchContacts(String keyword) {
        List<Contact> contacts = new ArrayList<Contact>();
        String query = "SELECT * FROM produname WHERE name LIKE ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Contact contact = new Contact(name, id);
                contacts.add(contact);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return contacts;
    }

    private class Contact {
        private int id;
        private String name;

        public Contact(String name, int id) {
            this.id = id;
            this.name = name;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }




    }
}
