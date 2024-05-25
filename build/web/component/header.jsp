<%-- 
    Document   : header
    Created on : Dec 26, 2023, 3:18:30 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book store</title>
        <link rel="icon" type="image/x-icon" href="https://openlearning.vercel.app/static/media/logo.6706f228d11b4351144c707e387cef80.svg">
        <link rel="stylesheet" href="../style/header.css">
        <link
            href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet" />
        <link
            href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
    </head>
    <body>
        <div class="header">
            <div class="header-left">
                <a href="./index.jsp" style="text-decoration: none">
                    <div class="logo-wrap">
                        <img src="https://t3.ftcdn.net/jpg/02/20/76/12/360_F_220761231_v6LqgQtqhXXgbzfw9br6SmICn5SqYWLJ.jpg" alt="" class="header-logo" />
                        <h3 class="logo-name">BookStore</h3>
                    </div>
                </a>
                <ul class="navbar-list">
                    <li class="navbar-list-item">
                        <a href="./category.jsp?type1=all" class="navbar-list-item-link">
                            Danh mục
                        </a>
                    </li>
                    <li class="navbar-list-item">
                        <a href="./contact.jsp" class="navbar-list-item-link">
                            Liên hệ
                        </a>
                    </li>
                    <li class="navbar-list-item">
                        <a href="./aboutUs.jsp" class="navbar-list-item-link">
                            Giới thiệu
                        </a>
                    </li>
                </ul>
            </div>

            <div class="header-search-wrap">
                <i class="fa-solid fa-magnifying-glass" style="margin-left: 6px"></i>
            </div>

            <div style="display: flex; align-items: center" id="header-right">
                <div id="header-right-1">

                </div>
                <div id="header-right-2">

                </div>
            </div>
        </div>

        <script>
            function checkAuth() {
                var username = localStorage.getItem("username");
                var role = localStorage.getItem("role");
                var headerRight1 = document.getElementById("header-right-1");
                var headerRight2 = document.getElementById("header-right-2");

                if (username && username !== "null" && role === "ROLE_USER") {
                    headerRight2.innerText = username
                    headerRight1.innerHTML = `
                <section class="header-right">
                    <div
                        onClick="goToCart()"
                        class="cart-wrap"
                        >
                        <i class="fa-solid fa-cart-shopping cart-icon"></i>

                    </div>

                    <div class="header-user">
                        <img
                            src="https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"
                            alt=""
                            class="img-user"
                            />
                        <span id="username"> </span>
                        <div class="user-box">
                            <p onClick="goToProfile()" class="header-logout">Thông tin cá nhân</p>
                            <p onClick="goToOrder()" class="header-logout">Đơn hàng của tôi</p>
                            <p onClick = "logOut()"  class="header-logout">Log out</p>
                        </div>
                    </div>
                </section>`;
                } else if (username && username !== "null" && role === "ROLE_ADMIN") {
                    headerRight2.innerText = username
                    headerRight1.innerHTML = `
                <section class="header-right">
                    <div class="header-user">
                        <img
                            src="https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"
                            alt=""
                            class="img-user"
                            />
                        <span id="username"> </span>
                        <div class="user-box">
                            <a style="text-decoration: none;" href="./userList.jsp"><p class="header-logout">Quản lý người dùng</p></a>
                            <a style="text-decoration: none;" href="./productList.jsp"><p class="header-logout">Quản lý sản phẩm</p></a>
                            <a style="text-decoration: none;" href="./orderList.jsp"><p class="header-logout">Quản lý đơn hàng</p></a>
                            <p onClick = "logOut()"  class="header-logout">Log out</p>
                        </div>
                    </div>
                </section>`;
                } else {
                    headerRight1.innerHTML = `
                <button id="log-btn" onclick="location.href = './login.jsp'" class="log-btn">
                    Đăng nhập
                </button>`
                }
            }

            function logOut() {
                localStorage.clear();
                window.location.href = "./login.jsp";
            }

            function goToCart() {
                window.location.href = "./cart.jsp?cartId=" + localStorage.getItem("cartId") + "&userId=" + localStorage.getItem("userId");
            }
            
            function goToProfile() {
                window.location.href = "./profile.jsp?userId=" + localStorage.getItem("userId");
            }

            function goToOrder() {
                window.location.href = "./listOrderUser.jsp"
            }

            checkAuth();
        </script>

    </body>
</html>
