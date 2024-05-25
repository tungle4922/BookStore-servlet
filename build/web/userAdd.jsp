<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book store</title>
        <link rel="icon" type="image/x-icon" href="https://openlearning.vercel.app/static/media/logo.6706f228d11b4351144c707e387cef80.svg">
        <link rel="stylesheet" href="./style/header.css">
        <link rel="stylesheet" href="./style/adminTable.css">
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
                    <h2 class="title">Thêm mới người dùng</h2>
                    <div></div>
                </div>
                <form class="form" action="UserAdd" method="post">
                    <div class="input-wrap">
                        <span>Nhập username:</span>
                        <input class="input" type="text" id="username" name="username" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập password:</span>
                        <input class="input" type="password" id="password" name="password" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập tên người dùng:</span>
                        <input class="input" type="text" id="name" name="name" required>
                    </div>

                    <div class="input-wrap">
                        <span>Nhập email:</span>
                        <input class="input" type="text" id="email" name="email" required>
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