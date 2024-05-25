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
@WebServlet("/ProductAdd")
public class ProductAdd extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set UTF-8 as the character encoding
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String imgUrl = request.getParameter("imgUrl");
        String price = request.getParameter("price");
        String discountPrice = request.getParameter("discountPrice");
        String type1 = request.getParameter("type1");
        String type2 = request.getParameter("type2");

        // Gọi phương thức thêm từ DAO hoặc thực hiện câu lệnh SQL để thêm dữ liệu vào database
        Dao dao = new Dao();
        try {
            dao.addProduct(name, description, imgUrl, price, discountPrice, type1, type2);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductAdd.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductAdd.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Sau khi thêm, chuyển hướng về trang listNCC.jsp hoặc trang khác
        response.sendRedirect("./productList.jsp");
    }
}
