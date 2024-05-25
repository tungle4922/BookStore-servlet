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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set UTF-8 as the character encoding
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String userId = request.getParameter("userId");

        // Gọi phương thức cập nhật từ DAO hoặc thực hiện câu lệnh SQL để cập nhật dữ liệu vào database
        Dao dao = new Dao();

        try {
            dao.updateUser(username, password, name, email, userId);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserUpdate.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("./userList.jsp");
    }
}
