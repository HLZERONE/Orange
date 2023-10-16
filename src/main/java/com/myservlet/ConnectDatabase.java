package com.myservlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

public class ConnectDatabase {
    private String dburl = "jdbc:mysql://localhost:3306/inf124";
    private String dbuname = "root";
    private String dbpassword = "12345";
    private String dbdriver = "com.mysql.jdbc.Driver";
    
    public void loadDriver(String dbDriver, HttpServletResponse resp) throws IOException
    { 
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            if(resp != null){
                PrintWriter writer = resp.getWriter();
                writer.println("<html> <body>");
                writer.println("<h3> Could not load driver </h3>");
                writer.println("</body> </html> ");
            }
            else{
                e.printStackTrace();
            }
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
    
    //GETTING FROM THE DATABASE
    //Home page: return AllproductInfo
    public List<Product> productInfo(HttpServletResponse resp) throws IOException {
        loadDriver(dbdriver, resp);
        Connection con = getConnection();
        String sql = "SELECT * FROM inf124.productinfo";
        List<Product> p = new ArrayList<>();
        try{
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery(sql);
            while(rs.next()){
                p.add(new Product(
                    rs.getInt("id"),
                    rs.getString("phoneName"),
                    rs.getString("imageOne"),
                    rs.getString("imageTwo"),
                    rs.getString("imageThree"),
                    rs.getString("screenSize"),
                    rs.getString("resolution"),
                    rs.getString("processor"),
                    rs.getString("ram"),
                    rs.getString("storage"),
                    rs.getString("operatingSystem"),
                    rs.getString("RearFacingCamera"),
                    rs.getString("price"),
                    rs.getDouble("rate"),
                    rs.getInt("numPeople")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    //Detailed Page: return specific productInfo
    public Product detailInfo(int id, HttpServletResponse resp) throws IOException {
        loadDriver(dbdriver, resp);
        Connection con = getConnection();
        String sql = "SELECT * FROM inf124.productinfo WHERE id = ?";
        try{
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                Product p = new Product(
                    rs.getInt("id"),
                    rs.getString("phoneName"),
                    rs.getString("imageOne"),
                    rs.getString("imageTwo"),
                    rs.getString("imageThree"),
                    rs.getString("screenSize"),
                    rs.getString("resolution"),
                    rs.getString("processor"),
                    rs.getString("ram"),
                    rs.getString("storage"),
                    rs.getString("operatingSystem"),
                    rs.getString("RearFacingCamera"),
                    rs.getString("price"),
                    rs.getDouble("rate"),
                    rs.getInt("numPeople")
                );
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Checkout page: Return the last five order information (from Order table)
    public List<Product> lastFiveOrder(HttpServletResponse resp) throws IOException {
        loadDriver(dbdriver, resp);
        Connection con = getConnection();
        String sql = "SELECT * FROM inf124.order ORDER BY id DESC LIMIT 5";
        int count = 0;
        List<Product> products = new ArrayList<>();
        try{
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                if(count >= 5){
                    break;
                }
                String orderDetailJson = rs.getString("orderDetail");
                JSONArray jsonArray = new JSONArray(orderDetailJson);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    int productId = jsonObject.getInt("productId");
                    products.add(detailInfo(productId, resp));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Check out comfirm page: Return the latest order’s info
    public Order lastOrder(HttpServletResponse resp) throws IOException {
        loadDriver(dbdriver, resp);
        Connection con = getConnection();
        String sql = "SELECT * FROM inf124.order ORDER BY id DESC LIMIT 1";
        try{
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setFirstName(rs.getString("firstName"));
                order.setLastName(rs.getString("lastName"));
                order.setAddress(rs.getString("shippingAddress"));
                order.setPhone_num(rs.getString("phoneNumber"));
                order.setCredit_card_num(rs.getString("creditCard"));
                order.setShippingMethod(rs.getString("shippingMethod"));
                order.setExpiryDate(rs.getString("expiryDate"));
                order.setCvv(rs.getString("cvv"));
                String orderDetailJson = rs.getString("orderDetail");
                ShoppingCart orderDetail = new ShoppingCart();
                JSONArray jsonArray = new JSONArray(orderDetailJson);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    int productId = jsonObject.getInt("productId");
                    int quantity = jsonObject.getInt("quantity");
                    orderDetail.addNew(productId, quantity);
                }
                order.setOrderDetail(orderDetail);
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Checkout page: Return the shoppingCart information (from ShoppingCart table)
    public ShoppingCart shoppingCart(HttpServletResponse resp) throws IOException {
        loadDriver(dbdriver, resp);
        Connection con = getConnection();
        String sql = "SELECT * FROM inf124.shoppingcart";
        try{
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            ShoppingCart cart = new ShoppingCart();
            while(rs.next()){
                int productId = rs.getInt("productid");
                int quantity = rs.getInt("quantity");
                cart.addNew(productId, quantity);
            }
            return cart;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }



    //UPDATE TO THE DATABASE
    //Detail page: insert data into shopping cart 
    //input: productId(int), quantity(int), resp(HttpServletResponse)
    //output: HTML string(h3) that informing user if the item successfully add to the shopping cart
    public String insertShoppingCart(int productId, int quantity, HttpServletResponse resp) throws IOException{
        String result = "<h3> Item successfully added to the shopping cart.</h3>";
        try {
            loadDriver(dbdriver, resp);
            Connection con = getConnection();
            String sql = "INSERT INTO inf124.shoppingcart (productid, quantity) VALUES(?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, productId);
            statement.setInt(2, quantity);
            statement.executeUpdate();
        }catch (SQLException e) {
            result = "<h3> Item failed to add to the shopping cart.</h3>";
        }
        return result;
    }

    //check out page: insert data into order table
    //output: HTML string(h3) that informing user if the order successfully place
    public String insertOrder(Order order, HttpServletResponse resp) throws IOException{
        String result = "<h3>Your order has been successfully placed.</h3>";
        try {
            loadDriver(dbdriver, resp);
            Connection con = getConnection();
            String sql = "INSERT INTO inf124.order (firstName, lastName, phoneNumber, shippingAddress, shippingMethod, creditCard, expiryDate, cvv, orderDetail) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, order.getFirstName());
            statement.setString(2, order.getLastName());
            statement.setString(3, order.getPhone_num());
            statement.setString(4, order.getAddress());
            statement.setString(5, order.getShippingMethod());
            statement.setString(6, order.getCredit_card_num());
            statement.setString(7, order.getExpiryDate());
            statement.setString(8, order.getCvv());

            JSONArray jsonArray = new JSONArray();
            HashMap<Integer, Integer> orderDetail = order.getOrderDetail().getProduct();
            for (Map.Entry<Integer, Integer> entry : orderDetail.entrySet()) {
                int productId = entry.getKey();
                int quantity = entry.getValue();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("productId", productId);
                jsonObject.put("quantity", quantity);
                jsonArray.put(jsonObject);
            }

            statement.setString(9, jsonArray.toString());
            statement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
            result = "<h3> The Order failed to place.</h3>";
        }
        return result;
    }

    //Detail page: insert data into shopping cart 
    //input: productId(int), new add rate(double), resp(HttpServletResponse)
    //output: HTML string(h3) that informing user if the rating successfully submit
    public String updateRate(int productId, double newRate, HttpServletResponse resp) throws IOException{
        String result = "<h3> Successfully submit rating.</h3>";
        try {
            loadDriver(dbdriver, resp);
            Connection con = getConnection();
            String sql = "SELECT rate, numPeople FROM inf124.productinfo WHERE id = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                double rate = rs.getDouble("rate");
                int numPeople = rs.getInt("numPeople");
                System.out.println("This work " + rate + " " + numPeople);
                rate = (rate * numPeople + newRate)/(numPeople + 1);
                
                //update rate
                String updatesql = "UPDATE inf124.productinfo SET rate = ? , numPeople = ? WHERE id = ?";
                statement = con.prepareStatement(updatesql);
                statement.setDouble(1, rate);
                statement.setInt(2, numPeople+1);
                statement.setInt(3, productId);
                statement.executeUpdate();
            }
        }catch (SQLException e) {
            e.printStackTrace();
            result = "<h3> Fail to submit rating</h3>";
        }
        return result;
    }


    public String getStateNameByZipCode(String zipCode, HttpServletResponse resp) throws IOException{
        loadDriver(dbdriver, resp);
        Connection con = getConnection();
        String sql = "SELECT * FROM inf124.state WHERE ZipCode = ?";
        try{
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, zipCode);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                StringBuffer location = new StringBuffer();
                location.append(rs.getString("City"));
                location.append(", ");
                location.append(rs.getString("State"));
                return location.toString();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public double getTaxByZipCode(String zipCode, HttpServletResponse resp) throws IOException{
        loadDriver(dbdriver, resp);
        Connection con = getConnection();
        String sql = "SELECT * FROM inf124.tax WHERE ZipCode = ?";
        try{
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, zipCode);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                String tax =  rs.getString("CombinedRate");
                return Double.parseDouble(tax);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}