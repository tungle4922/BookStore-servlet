<%@page import="model.Order"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book store</title>
        <link rel="stylesheet" href="./style/header.css">
        <link rel="stylesheet" href="./style/adminTable.css">
        <link rel="icon" type="image/x-icon" href="https://openlearning.vercel.app/static/media/logo.6706f228d11b4351144c707e387cef80.svg">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <style>

        </style>
    </head>
    <body>
        <section>
            <!-- HEADER -->
            <%@ include file="./component/header.jsp" %>

            <div class="container">
                <div class="title-wrap">
                    <h2 class="title">Danh sách đơn hàng</h2>
                    <div></div>
                </div>
                <table border='1'>
                    <tr>
                        <th>Id</th>
                        <th>userId</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Tổng tiền (VNĐ)</th>
                        <th>Trạng thái</th>
                        <th>Thời gian tạo</th>
                        <th>Thời gian sửa</th>
                        <th>Thao tác</th>
                    </tr>
                    <%
                        Dao dao = new Dao();
                        List<Order> list = dao.getAllOrder();
                        for (Order item : list) {
                    %>
                    <tr>
                        <td><%= item.getOrderId()%></td>
                        <td><%= item.getUserId()%></td>
                        <td><%= item.getPhoneNumber()%></td>
                        <td><%= item.getAddress()%></td>
                        <td><%= item.getTotal()%></td>
                        <td>
                            <% if ("0".equals(item.getStatus())) { %>
                            Đang chờ duyệt
                            <% } else if ("1".equals(item.getStatus())) { %>
                            Đang giao hàng
                            <% } else if ("2".equals(item.getStatus())) { %>
                            Đã nhận hàng
                            <% }%>
                        </td>
                        <td><%= item.getCreatedAt()%></td>
                        <td><%= item.getModifiedAt()%></td>

                        <td style="display: flex; align-items: center">
                            <form style="margin: 0" action="OrderDelete" method="post">
                                <input type="hidden" name="id" value="<%= item.getOrderId()%>">
                                <input class="button" type="submit" value="Xóa">
                            </form>
                            <button class="button" onclick="location.href = './orderDetail.jsp?orderId=<%= item.getOrderId()%>&status=<%= item.getStatus()%>&userId=<%= item.getUserId()%>&phoneNumber=<%= item.getPhoneNumber()%>'">Xem chi tiết</button> <br>
                    </tr>
                    <% }%>
                </table>
            </div>
        </section>

        <script>
            function checkUrl() {
                var currentUrl = window.location.href;
                var role = localStorage.getItem("role");

                if (!role || role === 'null' || role === "ROLE_USER") {
                    window.location.href = "./index.jsp";
                }
            }

            checkUrl();
        </script>
    </body>
</html>