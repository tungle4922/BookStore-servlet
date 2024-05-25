<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book store</title>
        <link rel="stylesheet" href="./style/header.css">
        <link rel="stylesheet" href="./style/home.css">
        <link rel="stylesheet" href="./style/grid.css">
        <link rel="stylesheet" href="./style/bookCard.css">
        <link rel="stylesheet" href="./style/footer.css">
        <link rel="stylesheet" href="./style/category.css">
        <link rel="icon" type="image/x-icon" href="https://openlearning.vercel.app/static/media/logo.6706f228d11b4351144c707e387cef80.svg">
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

            <div class="category">
                <div class="grid wide2">
                    <div class="row">
                        <div class="col l-2" style="margin-right: 50px">
                            <div class="filter-title-box" style="width: 230px">
                                <h4 class="filter-title">Lọc theo: </h4>
                            </div>
                            <div class="cat-filter">
                                <h4 class="filter-title" style="margin-bottom: 15px">
                                    Danh mục
                                </h4>
                                <div><a href="./category.jsp?type1=all"><button class="cate-btn">Tất cả sách</button></a></div>
                                <div><a href="./category.jsp?type1=englishBook"><button class="cate-btn">Sách tiếng Anh</button></a></div>
                                <div><a href="./category.jsp?type1=comic"><button class="cate-btn">Truyện tranh</button></a></div>
                                <div><a href="./category.jsp?type1=novel"><button class="cate-btn">Tiểu thuyết</button></a></div>
                            </div>
                        </div>

                        <div class="col l-9">
                            <div class="row" style="width: 1150px; margin-left: 100px">
                                <%
                                    Dao dao = new Dao();
                                    String type1 = request.getParameter("type1");
                                    List<Product> list = dao.getAllProductByType1(type1);
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