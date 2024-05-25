<%@page import="model.Product"%>
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
        <link rel="stylesheet" href="./style/footer.css">
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
        <section>
            <!-- HEADER -->
            <%@ include file="./component/header.jsp" %>

            <div class="app-container">
                <div class="grid wide2">
                    <div>
                        <img style="width: 100%" src="https://www.artsfactory.co.uk/wp-content/uploads/2016/08/factory_books_banner.jpg" alt="alt"/>
                    </div>
                    <h2 class="course-title1">Khuyến mãi</h2>
                    <div class="row">
                        <div class="col l-3 m-6 c-12">
                            <div class="course-box">
                                <img
                                    src="https://img.freepik.com/free-vector/flat-world-book-day-social-media-promo-template_23-2149298860.jpg"
                                    alt=""
                                    class="cpro-img"
                                    />
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12">
                            <div class="course-box">
                                <img
                                    src="https://img.freepik.com/free-vector/flat-world-book-day-social-media-promo-template_23-2149298860.jpg"
                                    alt=""
                                    class="cpro-img"
                                    />
                            </div>
                        </div>
                    </div>

                    <h2 class="course-title1">Tất cả sách</h2>
                    <div class="row">
                        <%
                            Dao dao = new Dao();
                            List<Product> list = dao.getAllProduct();
                            for (Product item : list) {
                        %>
                        <div class="col l-3 m-6 c-12">
                            <a>
                                <div class="course-card">
                                    <img src="<%= item.getImgUrl()%>" alt="" class="c-card-img" />
                                    <div class="c-card-name-wrap">
                                        <p class="c-card-name">Giảm 50%</p>
                                    </div>
                                    <div class="course-card-row3">
                                        <p class="c-card-price">₫<%= item.getDiscountPrice()%> <span style="color: #ccc; text-decoration: line-through; font-size: 15px"><%= item.getPrice()%></span></p>
                                        <button onclick="location.href = './bookDetail.jsp?id=<%= item.getId()%>'" class="Join-now-btn">Xem chi tiết</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <%@ include file="./component/footer.jsp" %>
        </section>

        <script>
            function checkUrl() {
                var currentUrl = window.location.href;
                var role = localStorage.getItem("role");

                if (role === "ROLE_ADMIN") {
                    window.location.href = "./userList.jsp";
                }
            }

            checkUrl()
        </script>
    </body>
</html>