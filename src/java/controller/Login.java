/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.Dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.User;

/**
 *
 * @author DELL
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set UTF-8 as the character encoding
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Gọi phương thức thêm từ DAO hoặc thực hiện câu lệnh SQL để thêm dữ liệu vào database
        Dao dao = new Dao();
        try {
            User user = dao.login(username, password);
            request.setAttribute("userId", user.getId());
            request.setAttribute("username", user.getUserName());
            request.setAttribute("role", user.getRole());
            request.setAttribute("name", user.getName());
            request.setAttribute("email", user.getEmail());
            
            Cart cart = dao.getCartByUserId(user.getId());
            request.setAttribute("cartId", cart.getCartId());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("./login.jsp");
        dispatcher.forward(request, response);
    }
}
