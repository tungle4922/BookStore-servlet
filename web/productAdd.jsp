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
                    <h2 class="title">Thêm mới sản phẩm</h2>
                    <div></div>
                </div>
                <form class="form" action="ProductAdd" method="post">
                    <div class="input-wrap">
                        <span>Nhập tên sản phẩm:</span>
                        <input class="input" type="text" id="name" name="name" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập mô tả:</span>
                        <input class="input" type="description" id="password" name="description" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập link ảnh sản phẩm:</span>
                        <input class="input" type="text" id="imgUrl" name="imgUrl" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập giá:</span>
                        <input class="input" type="text" id="price" name="price" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập giá khuyến mãi:</span>
                        <input class="input" type="text" id="discountPrice" name="discountPrice" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập phân loại 1:</span>
                        <input class="input" type="text" id="type1" name="type1" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập phân loại 2:</span>
                        <input class="input" type="text" id="type2" name="type2" required>
                    </div> 

                    <input class="button" type="submit" value="Thêm">
                </form>
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