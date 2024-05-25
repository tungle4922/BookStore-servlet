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
        <link rel="stylesheet" href="./style/aboutUs.css">
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

            <section class="about-us">
                <div class="grid wide2">
                    <div class="row">
                        <div class="col l-6">
                            <h1 class="about-us-title">
                                Nhà sách BookStore
                            </h1>
                            <p class="about-us-content">
                                BookStore chủ yếu hoạt động kinh doanh trong lĩnh vực xuất bản và phát hành sách, luôn đẩy mạnh giao dịch và mua bán sách bản quyền, nhằm giới thiệu tới đa dạng đối tượng độc giả tại Việt nam những tác phẩm nổi tiếng thế giới. Hơn 15 năm qua, BookStore tự hào là thương hiệu làm sách uy tín, chất lượng trên thị trường xuất bản.
                                Trong lĩnh vực sách thiếu nhi, BookStore đã có cơ hội được làm việc với nhiều tập đoàn, công ty xuất bản uy tín và lâu đời trên thế giới như: Disney Southeast Asia (thuộc tập đoàn Disney), Mattel Europa (đơn vị sở hữu hình ảnh nhân vật Barbie), AZbook (Công ty về sách thiếu nhi tại Nga), Children Fun (Trung Quốc), Yearim (Hàn Quốc),…
                                Rất nhiều các nhân vật quen thuộc, gần gũi với các em thiếu nhi Việt Nam hiện đang được BookStore sở hữu bản quyền như: Angry Bird, búp bê Barbie, cô bé Bánh Dâu, Nàng tiên Winx, cô mèo huyền thoại Hello Kitty,...
                            </p>
                        </div>

                        <div class="col l-5">
                            <img
                                style="width: "80%", margin-left: 50"
                                src="https://res.cloudinary.com/daeg8bpax/image/upload/v1679742829/course%20web%20page/All-NFT-Categories-Illustration_auqj8y.svg"
                                alt=""
                                />
                        </div>
                    </div>

                    <div class="row row2">
                        <div class="col l-2"></div>
                        <div class="col l-2 row2-box">
                            <div class="row2-box-wrap">
                                <img
                                    class="row2-img"
                                    src="https://res.cloudinary.com/daeg8bpax/image/upload/v1679742828/course%20web%20page/icon-timeline_ytfwac.svg"
                                    alt=""
                                    />
                            </div>
                            <div class="row2-box-wrap">
                                <h1 class="row2-title">2023</h1>
                            </div>
                            <div class="row2-box-wrap">
                                <p>Founded</p>
                            </div>
                        </div>
                        <div class="col l-2 row2-box">
                            <div class="row2-box-wrap">
                                <img
                                    class="row2-img"
                                    src="https://res.cloudinary.com/daeg8bpax/image/upload/v1679742828/course%20web%20page/icon-employees_aof8xv.svg"
                                    alt=""
                                    />
                            </div>
                            <div class="row2-box-wrap">
                                <h1 class="row2-title">50+</h1>
                            </div>
                            <div class="row2-box-wrap">
                                <p>Employees</p>
                            </div>
                        </div>
                        <div class="col l-2 row2-box">
                            <div class="row2-box-wrap">
                                <img
                                    class="row2-img"
                                    src="https://res.cloudinary.com/daeg8bpax/image/upload/v1679742828/course%20web%20page/icon-collections_wrkvci.svg"
                                    alt=""
                                    />
                            </div>
                            <div class="row2-box-wrap">
                                <h1 class="row2-title">7+</h1>
                            </div>
                            <div class="row2-box-wrap">
                                <p>Courses</p>
                            </div>
                        </div>
                        <div class="col l-2 row2-box">
                            <div class="row2-box-wrap">
                                <img
                                    class="row2-img"
                                    src="https://res.cloudinary.com/daeg8bpax/image/upload/v1679742828/course%20web%20page/nfts_ewgw35.svg"
                                    alt=""
                                    />
                            </div>
                            <div class="row2-box-wrap">
                                <h1 class="row2-title">51421+</h1>
                            </div>
                            <div class="row2-box-wrap">
                                <p>Users</p>
                            </div>
                        </div>
                        <div class="col l-2"></div>
                    </div>
                </div>
            </section>

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