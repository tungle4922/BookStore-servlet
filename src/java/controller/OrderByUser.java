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
@WebServlet("/OrderByUser")
public class OrderByUser extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set UTF-8 as the character encoding
        request.setCharacterEncoding("UTF-8");
        String userId = request.getParameter("userId");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String total = request.getParameter("total");
        String cartId = request.getParameter("cartId");

        // Gọi phương thức thêm từ DAO hoặc thực hiện câu lệnh SQL để thêm dữ liệu vào database
        Dao dao = new Dao();
        try {
            dao.addOrderByUser(userId, phoneNumber, address, total, cartId);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderByUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderByUser.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Sau khi thêm, chuyển hướng về trang listNCC.jsp hoặc trang khác
        response.sendRedirect("./cart.jsp");
    }
}
