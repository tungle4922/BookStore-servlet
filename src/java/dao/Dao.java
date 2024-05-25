package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Mathang;
import model.Order;
import model.OrderItem;
import model.Product;
import model.Student;
import model.User;

public class Dao {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/book_web";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Tung4922@";

    ///////////Product///////////////////
    public List<Product> getAllProduct() throws ClassNotFoundException {
        List<Product> list = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM `book_web`.`product`";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String id = resultSet.getString("product_id");
                    String name = resultSet.getString("name");
                    String description = resultSet.getString("description");
                    String imgUrl = resultSet.getString("imgUrl");
                    String price = resultSet.getString("price");
                    String discountPrice = resultSet.getString("discount_price");
                    String type1 = resultSet.getString("type1");
                    String type2 = resultSet.getString("type2");
                    String createdAt = resultSet.getString("created_at");
                    String modifiedAt = resultSet.getString("modified_at");
                    Product product = new Product(id, name, description, imgUrl, price, discountPrice, type1, type2, createdAt, modifiedAt);
                    list.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Product> getAllProductByType1(String type1) throws ClassNotFoundException {
        List<Product> list = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = null;
            if ("all".equals(type1)) {
                query = "SELECT * FROM book_web.product";
            } else {
                query = "SELECT * FROM book_web.product WHERE type1 = ?";
            }
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                if (!"all".equals(type1)) {
                    preparedStatement.setString(1, type1);
                }
                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        String id = resultSet.getString("product_id");
                        String name = resultSet.getString("name");
                        String description = resultSet.getString("description");
                        String imgUrl = resultSet.getString("imgUrl");
                        String price = resultSet.getString("price");
                        String discountPrice = resultSet.getString("discount_price");
                        String type2 = resultSet.getString("type2");
                        String createdAt = resultSet.getString("created_at");
                        String modifiedAt = resultSet.getString("modified_at");
                        Product product = new Product(id, name, description, imgUrl, price, discountPrice, type1, type2, createdAt, modifiedAt);
                        list.add(product);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void addProduct(String name, String description, String imgUrl, String price, String discountPrice, String type1, String type2) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "INSERT INTO `book_web`.`product` ( name, description, imgUrl, price, discount_price, type1, type2, created_at, modified_at ) VALUES ( ?, ?, ?, ?, ?, ?, ?, now(), now() )";
            statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, imgUrl);
            statement.setString(4, price);
            statement.setString(5, discountPrice);
            statement.setString(6, type1);
            statement.setString(7, type2);

            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateProduct(String name, String description, String imgUrl, String price, String discountPrice, String type1, String type2, String productId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "UPDATE `book_web`.`product` SET name = ?, description = ?, imgUrl = ?, price = ?, discount_price = ?, type1 = ?, type2 = ?, modified_at = now() WHERE product_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, imgUrl);
            statement.setString(4, price);
            statement.setString(5, discountPrice);
            statement.setString(6, type1);
            statement.setString(7, type2);
            statement.setString(8, productId);

            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public Product getProductById(String id) throws ClassNotFoundException {
        Product product = null;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Tạo kết nối đến cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Chuẩn bị câu truy vấn SQL
            String sql = "SELECT * FROM `book_web`.`product` WHERE product_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, id);

            // Thực hiện truy vấn
            resultSet = statement.executeQuery();

            // Kiểm tra xem có kết quả nào không
            if (resultSet.next()) {
                product = new Product();
                product.setId(resultSet.getString("product_id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setImgUrl(resultSet.getString("imgUrl"));
                product.setPrice(resultSet.getString("price"));
                product.setDiscountPrice(resultSet.getString("discount_price"));
                product.setType1(resultSet.getString("type1"));
                product.setType2(resultSet.getString("type2"));
                product.setCreatedAt(resultSet.getString("created_at"));
                product.setModifiedAt(resultSet.getString("modified_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In thông tin lỗi ra console
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // In thông tin lỗi ra console
            }
        }

        return product;
    }

    public void deleteProduct(String id) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "DELETE FROM `book_web`.`product` WHERE product_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    ///////////User///////////////////
    public List<User> getAllUser() throws ClassNotFoundException {
        List<User> list = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM `book_web`.`user`";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String id = resultSet.getString("user_id");
                    String username = resultSet.getString("username");
                    String password = resultSet.getString("password");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String role = resultSet.getString("role");
                    String createdAt = resultSet.getString("created_at");
                    String modifiedAt = resultSet.getString("modified_at");
                    User user = new User(id, username, password, name, email, role, createdAt, modifiedAt);
                    list.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

//    public void addUser(String username, String password, String name, String email) throws ClassNotFoundException, SQLException {
//        Connection conn = null;
//        PreparedStatement statement = null;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
//
//            String sql = "INSERT INTO `book_web`.`user` ( username, password, name, email, role, created_at, modified_at ) VALUES ( ?, ?, ?, ?, 'ROLE_USER', NOW(), NOW() ); SET @newUserId = LAST_INSERT_ID(); INSERT INTO `book_web`.`cart` ( user_id, total, created_at, modified_at ) VALUES ( @newUserId, 0, NOW(), NOW() )";
//            statement = conn.prepareStatement(sql);
//            statement.setString(1, username);
//            statement.setString(2, password);
//            statement.setString(3, name);
//            statement.setString(4, email);
//
//            statement.executeUpdate();
//        } finally {
//            if (statement != null) {
//                statement.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//    }
    public void addUser(String username, String password, String name, String email) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Statement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            statement = conn.createStatement();

            // Insert user
            String userSql = "INSERT INTO `book_web`.`user` (username, password, name, email, role, created_at, modified_at) VALUES ('" + username + "', '" + password + "', '" + name + "', '" + email + "', 'ROLE_USER', NOW(), NOW())";
            statement.executeUpdate(userSql, Statement.RETURN_GENERATED_KEYS);

            // Get the generated user ID
            ResultSet rs = statement.getGeneratedKeys();
            int newUserId = 0;
            if (rs.next()) {
                newUserId = rs.getInt(1);
            }

            // Insert cart
            String cartSql = "INSERT INTO `book_web`.`cart` (user_id, total, created_at, modified_at) VALUES (" + newUserId + ", 0, NOW(), NOW())";
            statement.executeUpdate(cartSql);
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateUser(String username, String password, String name, String email, String userId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "UPDATE `book_web`.`user` SET username = ?, password = ?, name = ?, email = ?, role = 'ROLE_USER', modified_at = now() WHERE user_id = ?;";
            statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, email);
            statement.setString(5, userId);

            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public User getUserById(String id) throws ClassNotFoundException {
        User user = null;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Tạo kết nối đến cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Chuẩn bị câu truy vấn SQL
            String sql = "SELECT * FROM `book_web`.`user` WHERE user_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, id);

            // Thực hiện truy vấn
            resultSet = statement.executeQuery();

            // Kiểm tra xem có kết quả nào không
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getString("user_id"));
                user.setUserName(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                user.setCreatedAt(resultSet.getString("created_at"));
                user.setModifiedAt(resultSet.getString("modified_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In thông tin lỗi ra console
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // In thông tin lỗi ra console
            }
        }

        return user;
    }

    public void deleteUser(String id) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "DELETE FROM `book_web`.`user` WHERE user_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public User login(String username, String password) throws ClassNotFoundException {
        User user = null;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Tạo kết nối đến cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Chuẩn bị câu truy vấn SQL
            String sql = "SELECT * FROM `book_web`.`user` WHERE username = ? AND password = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // Thực hiện truy vấn
            resultSet = statement.executeQuery();

            // Kiểm tra xem có kết quả nào không
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getString("user_id"));
                user.setUserName(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                user.setCreatedAt(resultSet.getString("created_at"));
                user.setModifiedAt(resultSet.getString("modified_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In thông tin lỗi ra console
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // In thông tin lỗi ra console
            }
        }

        return user;
    }

    ///////Cart//////
    public Cart getCartByUserId(String userId) throws ClassNotFoundException {
        Cart cart = null;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Tạo kết nối đến cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Chuẩn bị câu truy vấn SQL
            String sql = "SELECT * FROM book_web.cart WHERE user_id = ?;";
            statement = conn.prepareStatement(sql);
            statement.setString(1, userId);

            // Thực hiện truy vấn
            resultSet = statement.executeQuery();

            // Kiểm tra xem có kết quả nào không
            if (resultSet.next()) {
                cart = new Cart();
                cart.setCartId(resultSet.getString("cart_id"));
                cart.setUserId(resultSet.getString("user_id"));
                cart.setTotal(resultSet.getString("total"));
                cart.setCreatedAt(resultSet.getString("created_at"));
                cart.setModifiedAt(resultSet.getString("modified_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In thông tin lỗi ra console
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // In thông tin lỗi ra console
            }
        }

        return cart;
    }

    //////CartItem/////
    public void addCartItem(String cartId, String productId, String quantity) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "INSERT INTO `book_web`.`cart_item` (cart_id, product_id, quantity, created_at, modified_at ) VALUES (?, ?, ?, now(), now() )";
            statement = conn.prepareStatement(sql);
            statement.setString(1, cartId);
            statement.setString(2, productId);
            statement.setString(3, quantity);

            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<CartItem> getAllCartItemByCartId(String cartId) throws ClassNotFoundException {
        List<CartItem> list = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM book_web.cart_item WHERE cart_id = ?";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, cartId);
                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        String cartItemId = resultSet.getString("cart_item_id");
                        String productId = resultSet.getString("product_id");
                        String quantity = resultSet.getString("quantity");
                        String createdAt = resultSet.getString("created_at");
                        String modifiedAt = resultSet.getString("modified_at");
                        CartItem cartItem = new CartItem(cartItemId, cartId, productId, quantity, createdAt, modifiedAt);
                        list.add(cartItem);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int getCartCount() throws ClassNotFoundException {
        int rowCount = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT COUNT(*) as count FROM book_web.cart_item WHERE cart_id = ?";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    rowCount = resultSet.getInt("count");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowCount;
    }

    public void deleteCartItem(String id) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "DELETE FROM `book_web`.`cart_item` WHERE cart_item_id = ? ";
            statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    ////Order////
    public void addOrderByUser(String userId, String phoneNumber, String address, String total, String cartId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Statement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            statement = conn.createStatement();

            // Insert order
            String orderSql = "INSERT INTO `book_web`.`order` ( user_id, phoneNumber, address, total, status, created_at, modified_at ) VALUES ( '" + userId + "', '" + phoneNumber + "', '" + address + "', '" + total + "', '0', now(), now() )";
            statement.executeUpdate(orderSql, Statement.RETURN_GENERATED_KEYS);

            // Get the generated order ID
            ResultSet rs = statement.getGeneratedKeys();
            int newOrderId = 0;
            if (rs.next()) {
                newOrderId = rs.getInt(1);
            }

            // Insert orderItem
            this.addOrderItem(Integer.toString(newOrderId), cartId);
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<Order> getAllOrder() throws ClassNotFoundException {
        List<Order> list = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM book_web.order";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String orderId = resultSet.getString("order_id");
                    String userId = resultSet.getString("user_id");
                    String phoneNumber = resultSet.getString("phoneNumber");
                    String address = resultSet.getString("address");
                    String total = resultSet.getString("total");
                    String status = resultSet.getString("status");
                    String createdAt = resultSet.getString("created_at");
                    String modifiedAt = resultSet.getString("modified_at");
                    Order order = new Order(orderId, userId, phoneNumber, address, total, status, createdAt, modifiedAt);
                    list.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Order> getAllOrderByUserId(String userId) throws ClassNotFoundException {
        List<Order> list = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM book_web.order WHERE user_id = ?";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, userId);
                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        String orderId = resultSet.getString("order_id");
                        String phoneNumber = resultSet.getString("phoneNumber");
                        String address = resultSet.getString("address");
                        String total = resultSet.getString("total");
                        String status = resultSet.getString("status");
                        String createdAt = resultSet.getString("created_at");
                        String modifiedAt = resultSet.getString("modified_at");
                        Order order = new Order(orderId, userId, phoneNumber, address, total, status, createdAt, modifiedAt);
                        list.add(order);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateOrderStatus(String status, String orderId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "UPDATE `book_web`.`order` SET status = ? WHERE order_id = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, orderId);

            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void deleteOrder(String id) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "DELETE FROM `book_web`.`order` WHERE `order_id` = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    ////Order item////
    public void addOrderItem(String orderId, String cartId) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String selectQuery = "SELECT * FROM book_web.cart_item WHERE cart_id = ?";
            try ( PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
                selectStatement.setString(1, cartId);
                try ( ResultSet resultSet = selectStatement.executeQuery()) {
                    while (resultSet.next()) {
                        String productId = resultSet.getString("product_id");
                        String quantity = resultSet.getString("quantity");

                        // Using a PreparedStatement to avoid SQL injection
                        String orderItemSql = "INSERT INTO `book_web`.`order_item` (order_id, product_id, quantity, created_at, modified_at) VALUES (?, ?, ?, NOW(), NOW())";
                        try ( PreparedStatement insertStatement = connection.prepareStatement(orderItemSql)) {
                            insertStatement.setString(1, orderId);
                            insertStatement.setString(2, productId);
                            insertStatement.setString(3, quantity);

                            // Execute the insert statement
                            insertStatement.executeUpdate();
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderItem> getAllOrderItemByOrderId(String orderId) throws ClassNotFoundException {
        List<OrderItem> list = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try ( Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT * FROM book_web.order_item WHERE order_id = ?;";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, orderId);
                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        String orderItemId = resultSet.getString("order_item_id");
                        String productId = resultSet.getString("product_id");
                        String quantity = resultSet.getString("quantity");
                        String createdAt = resultSet.getString("created_at");
                        String modifiedAt = resultSet.getString("modified_at");
                        OrderItem orderItem = new OrderItem(orderItemId, orderId, productId, quantity, createdAt, modifiedAt);
                        list.add(orderItem);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
