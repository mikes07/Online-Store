package com.mystore;

import java.sql.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

/**
 * Created by michael on 09.09.2015.
 */
public class DbBean {

    public String dbUrl = "";
    public String dbUserName = "";
    public String dbPassword = "";

    public void setDbUrl(String url) {
        dbUrl = url;
    }

    public void setDbUserName(String userName) {
        dbUserName = userName;
    }

    public void setDbPassword(String password) {
        dbPassword = password;
    }

    public Hashtable getCategories() {

        Hashtable categories = new Hashtable();

        try {

            Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

            Statement s = connection.createStatement();

            String sql = "SELECT CategoryID, Category FROM categories";

            ResultSet rs = s.executeQuery(sql);

            while (rs.next()) {
                categories.put(rs.getString(1), rs.getString(2));
            }

            rs.close();
            s.close();
            connection.close();

        } catch(SQLException e) {
        }

        return categories;

    }

    public ArrayList getSearchResult(String keyword) {

        ArrayList products = new ArrayList();

        try {

            Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

            Statement s = connection.createStatement();

            String sql = "SELECT ProductId, Name, Description, Price FROM products WHERE Name LIKE '%" + keyword.trim() + "%' OR Description LIKE '%" + keyword.trim() + "%'";

            ResultSet rs = s.executeQuery(sql);

            while (rs.next()) {

                Product product = new Product();

                product.id = rs.getInt(1);
                product.name = rs.getString(2);
                product.description = rs.getString(3);
                product.price = rs.getDouble(4);

                products.add(product);

            }

            rs.close();
            s.close();
            connection.close();

        } catch(SQLException e) {
        }

        return products;

    }

    public ArrayList getProductsInCategory(String categoryId) {

        ArrayList products = new ArrayList();

        try {

            Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

            Statement s = connection.createStatement();

            String sql = "SELECT ProductId, Name, Description, Price FROM Products WHERE CategoryId =" + categoryId;

            ResultSet rs = s.executeQuery(sql);

            while (rs.next()) {

                Product product = new Product();

                product.id = rs.getInt(1);
                product.name = rs.getString(2);
                product.description = rs.getString(3);
                product.price = rs.getDouble(4);

                products.add(product);

            }

            rs.close();
            s.close();
            connection.close();

        } catch (SQLException e) {
        }

        return products;

    }

    public Product getProductDetails(int productId) {

        Product product = null;

        try {

            Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

            Statement s = connection.createStatement();

            String sql = "SELECT ProductId, Name, Description, Price FROM Products WHERE ProductId =" + Integer.toString(productId);

            ResultSet rs = s.executeQuery(sql);

            if (rs.next()) {

                product = new Product();

                product.id = rs.getInt(1);
                product.name = rs.getString(2);
                product.description = rs.getString(3);
                product.price = rs.getDouble(4);

            }

            rs.close();
            s.close();
            connection.close();

        } catch (SQLException e) {
        }

        return product;

    }

    public boolean insertOrder(String contactName, String deliveryAddress, String ccName, String ccNumber, String ccExpireDate, Hashtable shoppingCart) {

        boolean returnValue = false;

        int orderId = (int) System.currentTimeMillis();

        Connection connection = null;

        try {

            connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

            connection.setAutoCommit(false);

            Statement s = connection.createStatement();

            String sql = "INSERT INTO orders (OrderId, ContactName, DeliveryAddress, CCName, CCNumber, CCExpireDate) VALUES (" + orderId + ", '" + contactName + "', '" + deliveryAddress + "', '" + ccName + "', '" + ccNumber + "', '" + ccExpireDate + "')";

            s.executeUpdate(sql);

            Enumeration enumeration = shoppingCart.elements();

            while (enumeration.hasMoreElements()) {

                ShoppingItem item = (ShoppingItem) enumeration.nextElement();

                sql = "INSERT INTO orderdetails (OrderId, ProductId, Quantity, Price) VALUES (" + orderId + ", " + item.productId + ", " + item.quantity + ", " + item.price + ")";

                s.executeUpdate(sql);

            }

            s.close();
            connection.commit();
            connection.close();

            returnValue = true;

        } catch (SQLException e) {

            try {
                connection.rollback();
                connection.close();
            } catch (SQLException se) {
            }

        }

        return returnValue;

    }

}
