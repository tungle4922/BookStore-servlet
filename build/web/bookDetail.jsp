<%@page import="model.Product"%>
<%@page import="model.Mathang"%>
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
        <link rel="stylesheet" href="./style/bookDetail.css">
        <link rel="stylesheet" href="./style/footer.css">
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

            <%
                String id = request.getParameter("id");
                Dao dao = new Dao();
                Product product = dao.getProductById(id);

                if (product != null) {
            %>
            <div class="ProductInfo">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-7">
                            <h1 class="PInfo-title">
                                <%= product.getName()%>
                            </h1>
                            <p class="PInfo-decs1">
                                <%= product.getType1()%>
                            </p>
                            <h3 class="PInfo-title2">Chất lượng sách tại BookStore?</h3>
                            <div class="PInfo-content">
                                <p>
                                    Sách đẹp, giấy đẹp, đóng gói nhiều lớp.
                                </p>
                                <p>
                                    Sách được đánh giá là hay, kinh điển, có nhiều góc nhìn chuyên sâu.
                                </p>
                                <p>
                                    Sách có tính gợi mở, phù hợp cho người thích nghiên cứu, tư duy.
                                </p>
                                <p>
                                    Giao sách nhanh, đóng gói cẩn thận
                                </p>
                            </div>
                            <h3 class="PInfo-title2">Nội dung sản phẩm</h3>
                            <p class="PInfo-decs3"><%= product.getDescription()%></p>

                            <h3 class="PInfo-title2">An tâm mua sắm</h3>
                            <div class="PInfo-content">
                                <p>
                                    Được mở hộp kiểm tra khi nhận hàng.
                                </p>
                                <p>
                                    Được hoàn tiền 111% nếu là hàng giả.
                                </p>
                                <p>
                                    Đổi trả miễn phí tại nhà trong 30 ngày nếu sản phẩm lỗi.
                                </p>
                            </div>
                        </div>

                        <div class="col l-4">
                            <div class="Product-img-wrap">
                                <img src='<%= product.getImgUrl()%>' alt="" class="Product-img" />
                            </div>
                            <div class="PInfo-price-wrap">
                                <h3 class="PInfo-price">₫<%= product.getDiscountPrice()%></h3>
                            </div>
                            <form method="post" action="CartItemAdd">
                                <div class="count-wrap">
                                    <span>Số lượng</span>
                                    <input min="1" class="input-number" type="number" required id="quantity" name="quantity">
                                    <input hidden="true" id="productId" name="productId" value="<%= product.getId()%>">
                                    <input hidden="true" id="cartId" name="cartId">
                                </div>
                                <div type="submit" class="PInfo-btn-wrap">
                                    <button onclick="addToCart()" class="PInfo-btn">
                                        THÊM VÀO GIỎ HÀNG
                                    </button>
                                </div>
                            </form>
                            <div class="content-box">
                                <p class="content-box-title">
                                    Sản phẩm bán chạy
                                </p>
                                <p class="content-box-title">
                                    Top seller
                                </p>
                                <p class="content-box-title">
                                    Đã bán 1000+
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                } else {
                    out.println("Không tìm thấy thông tin mặt hàng.");
                }
            %>
            <!-- Footer -->
            <%@ include file="./component/footer.jsp" %>
        </section>

        <script>
            // Đoạn mã JavaScript để lấy giá trị từ hai input và hiển thị chúng trong console.log
            document.getElementById('quantity').addEventListener('input', function () {
                var quantityValue = this.value;
                console.log('Quantity:', quantityValue);
            });

            document.getElementById('productId').addEventListener('input', function () {
                var productIdValue = this.value;
                console.log('Product ID:', productIdValue);
            });

            // Thiết lập giá trị ban đầu từ localStorage
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy giá trị từ localStorage
                var cartId = localStorage.getItem("cartId");

                // Thiết lập giá trị cho trường input có id là 'productId'
                var cartIdInput = document.getElementById('cartId');
                cartIdInput.value = cartId;

                // In giá trị ra console để kiểm tra
                console.log('Initial Product ID:', cartIdInput.value);
            });

            function addToCart() {
                window.alert("Thêm vào giỏ hàng thành công")
            }
        </script>
    </body>
</html>