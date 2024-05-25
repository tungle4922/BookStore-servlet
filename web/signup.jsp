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
        <link rel="stylesheet" href="./style/signup.css">
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

        <section class="signup-page">
            <div class="signup-page-img-wrap">
                <img
                    class="signup-page-img"
                    src="https://img.freepik.com/premium-vector/school-seamless-pattern-with-doodles-school-supplies-stationary_67074-1429.jpg"
                    />
            </div>

            <div class="register-container">
                <div class="register-title"> Sign up </div>
                <form action="SignUp" method="post" class="signup-form">
                    <label class="register-label">Nhập tên của bạn</label>
                    <input
                        id="name" name="name"
                        class="signup-input"
                        placeholder="Enter your email"
                        required
                        />

                    <label class="register-label">Nhập email</label>
                    <input
                        id="email" name="email"
                        class="signup-input"
                        type="email"
                        placeholder="Enter your email"
                        required
                        />

                    <label class="register-label">Nhập username</label>
                    <input
                        id="username" name="username"
                        class="signup-input"
                        type="text"
                        placeholder="Enter your username"
                        required
                        />

                    <label class="register-label">Nhập password</label>
                    <input
                        id="password" name="password"
                        class="signup-input"
                        type="password"
                        placeholder="Enter your password"
                        required
                        />

                    <!--                    <label class="register-label">Confirm Password</label>
                                        <input
                                            id="confirmedPassword"
                                            class="signup-input"
                                            type="password"
                                            placeholder="Enter your password"
                                            />-->

                    <button onclick="signup()" type="submit" class="signup-btn">
                        Đăng ký
                    </button>
                </form>
            </div>
        </section>;

        <script>
            function signup() {
                window.alert("Đăng ký thành công");
                window.location.href = "./login.jsp"
            }

            function checkUrl() {
                if (localStorage.getItem('username') && localStorage.getItem('username') !== "null") {
                    window.location.href = "./index.jsp";
                }
            }
            checkUrl();
        </script>
    </body>
</html>