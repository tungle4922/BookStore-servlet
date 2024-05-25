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
                    <h2 class="title">Danh sách người dùng</h2>
                    <button onclick="location.href = './userAdd.jsp'" style="margin-right: 100px" class="button">Thêm mới</button>
                </div>
                <table border='1'>
                    <tr>
                        <th>Id</th>
                        <th>Username</th>
                        <th>Tên người dùng</th>
                        <th>Email</th>
                        <th>Vai trò</th>
                        <th>Thời gian tạo</th>
                        <th>Thời gian sửa</th>
                        <th>Thao tác</th>
                    </tr>
                    <%
                        Dao dao = new Dao();
                        List<User> list = dao.getAllUser();
                        for (User item : list) {
                    %>
                    <tr>
                        <td><%= item.getId()%></td>
                        <td><%= item.getUserName()%></td>
                        <td><%= item.getName()%></td>
                        <td><%= item.getEmail()%></td>
                        <td><%= item.getRole()%></td>
                        <td><%= item.getCreatedAt()%></td>
                        <td><%= item.getModifiedAt()%></td>

                        <td style="display: flex; align-items: center">
                            <form style="margin: 0" action="UserDelete" method="post">
                                <input type="hidden" name="id" value="<%= item.getId()%>">
                                <input class="button" type="submit" value="Xóa">
                            </form>
                            <button class="button" onclick="location.href = './userUpdate.jsp?userId=<%= item.getId()%>'">Update</button> <br>
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