<%@page import="model.Product"%>
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
                    <h2 class="title">Danh sách sản phẩm</h2>
                    <button onclick="location.href = './productAdd.jsp'" style="margin-right: 100px" class="button">Thêm mới</button>
                </div>
                <table border='1'>
                    <tr>
                        <th>Id</th>
                        <th>Tên sản phẩm</th>
                        <!--<th>Mô tả</th>-->
                        <!--<th>Link ảnh sản phẩm</th>-->
                        <th>Giá</th>
                        <th>Giá khuyến mại</th>
                        <th>Phân loại 1</th>
                        <th>Phân loại 2</th>
                        <th>Thời gian tạo</th>
                        <th>Thời gian sửa</th>
                        <th>Thao tác</th>
                    </tr>
                    <%
                        Dao dao = new Dao();
                        List<Product> list = dao.getAllProduct();
                        for (Product item : list) {
                    %>
                    <tr>
                        <td><%= item.getId()%></td>
                        <td><%= item.getName()%></td>
                        <!--<td><%= item.getDescription()%></td>-->
                        <!--<td style="width: 100px"><%= item.getImgUrl()%></td>-->
                        <td><%= item.getPrice()%></td>
                        <td><%= item.getDiscountPrice()%></td>
                        <td><%= item.getType1()%></td>
                        <td><%= item.getType2()%></td> 
                        <td><%= item.getCreatedAt()%></td>
                        <td><%= item.getModifiedAt()%></td>

                        <td style="display: flex; align-items: center">
                            <form style="margin: 0" action="ProductDelete" method="post">
                                <input type="hidden" name="id" value="<%= item.getId()%>">
                                <input class="button" type="submit" value="Xóa">
                            </form>
                            <button class="button" onclick="location.href = './productUpdate.jsp?productId=<%= item.getId()%>'">Update</button> <br>
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