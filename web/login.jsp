<%@page import="model.Mathang"%>
<%@page import="java.util.List"%>
<%@page import="dao.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book store</title>
        <link rel="icon" type="image/x-icon" href="https://openlearning.vercel.app/static/media/logo.6706f228d11b4351144c707e387cef80.svg">
        <link rel="stylesheet" href="./style/header.css">
        <link rel="stylesheet" href="./style/home.css">
        <link rel="stylesheet" href="./style/grid.css">
        <link rel="stylesheet" href="./style/bookCard.css">
        <link rel="stylesheet" href="./style/login.css">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <style>
            /*header*/


            /*home*/

        </style>
    </head>
    <body>
        <!-- HEADER -->
        <%@ include file="./component/header.jsp" %>

        <section class="login-page">
            <div class="login-page-img-wrap">
                <img
                    class="login-page-img"
                    src="https://img.freepik.com/premium-vector/school-seamless-pattern-with-doodles-wrapping-paper-stationary-scrapbooking-wallpaper_67074-1422.jpg"
                    />
            </div>

            <div class="login-container">
                <div class="login-title"> Log in</div>
                <form action="Login" method="post" class="login-form">
                    <label class="login-label">Username</label>
                    <input
                        class="login-input"
                        type="text"
                        placeholder="Enter your username"
                        id="username" name="username"
                        />
                    <label class="login-label">Password</label>
                    <input
                        class="login-input"
                        type="password"
                        placeholder="Enter your password"
                        id="password" name="password"
                        />
                    <button onclick="login()" type="submit" class="login-btn">
                        Đăng nhập
                    </button>
                </form>
                <div class="login-register">
                    <p class="login-register-title">Bạn chưa có tài khoản?</p>
                    <a class="login-register-link" href="./signup.jsp">
                        Đăng ký
                    </a>
                    <!--<div id="displayArea"></div>-->
                </div>

            </div>
        </section>;

        <script>
            function login() {
                if (localStorage.getItem('username') && localStorage.getItem('username') !== "null") {
                    window.location.href = "./index.jsp";
                } else {
                    var userId = '<%= request.getAttribute("userId")%>';
                    var username = '<%= request.getAttribute("username")%>';
                    var role = '<%= request.getAttribute("role")%>';
                    var name = '<%= request.getAttribute("name")%>';
                    var email = '<%= request.getAttribute("email")%>';
                    var cartId = '<%= request.getAttribute("cartId")%>';

                    localStorage.setItem('userId', userId);
                    localStorage.setItem('username', username);
                    localStorage.setItem('role', role);
                    localStorage.setItem('name', name);
                    localStorage.setItem('email', email);
                    if (cartId) {
                        localStorage.setItem('cartId', cartId);
                    }
                    if (username !== "null") {
                        window.location.href = "./index.jsp";
                    }
                }
            }
            login()
        </script>
    </body>
</html>