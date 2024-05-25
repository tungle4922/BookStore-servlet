<%@page import="model.CartItem"%>
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
        <link rel="stylesheet" href="./style/cart.css">
        <link rel="stylesheet" href="./style/checkOut.css">
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
                int totalPrice = 0;
            %>
            <div class="app-container">
                <div class="grid wide1">
                    <div class="row">
                        <div class="cart-box l-7">
                            <h1 style="marginBottom: 25px;">Giỏ hàng</h1>
                            <%
                                String id = request.getParameter("cartId");
                                String userId = request.getParameter("userId");
                                Dao dao = new Dao();
                                List<CartItem> list = dao.getAllCartItemByCartId(id);
                                for (CartItem item : list) {
                            %>
                            <%
                                String productId = item.getProduct_id();
                                Product product = dao.getProductById(productId);
                                if (product != null) {
                            %>
                            <div class="course-cart">
                                <div class="col l-3">
                                    <a href="./bookDetail.jsp?id=<%= product.getId()%>">
                                        <img
                                            src="<%= product.getImgUrl()%>"
                                            alt=""
                                            class="cart-img"
                                            />
                                    </a>
                                </div>
                                <div class="col l-3">
                                    <div class="name-and-type">
                                        <p class="cart-name"><%= product.getName()%></p>
                                        <p class="cart-type">Type: <%= product.getType1()%></p>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="price-and-quantity">
                                        <p class="cart-price"><%= product.getDiscountPrice()%> ₫</p>
                                        <% totalPrice += Integer.parseInt(product.getDiscountPrice()) * Integer.parseInt(item.getQuantity());%>
                                        <p class="cart-quantity">Số lượng: x<%= item.getQuantity()%></p>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="btn-group">
                                        <button class="cart-heart">
                                            <i class="fa-solid fa-heart"></i>
                                        </button>
                                        <form style="margin: 0;" action="CartItemDelete" method="post">
                                            <input type="hidden" name="id" value="<%= item.getId()%>">
                                            <button type="submit" class="cart-btn">Xóa</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <%} else {
                                    out.println("");
                                }%>
                            <% }%>

                            <div class="cart-box-bottom">
                                <a class="cart-btn" style="text-decoration: none" href="./index.jsp">
                                    <i class="fa-solid fa-angle-left"></i>
                                    Tiếp tục mua sắm
                                </a>
                                <div class="cart-box-bottom-img">
                                    <img
                                        class="me-2"
                                        width="45px"
                                        src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                                        alt="Visa"
                                        ></img>
                                    <img
                                        class="me-2"
                                        width="45px"
                                        src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                                        alt="American Express"
                                        ></img>
                                    <img
                                        class="me-2"
                                        width="45px"
                                        src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                                        alt="Mastercard"
                                        ></img>
                                </div>
                            </div>
                        </div>

                        <div class="payment-box l-3" style="padding: 0 0 0 25px;">
                            <div class="payment-box-2">
                                <div class="payment-box-2-item">
                                    <p class="purchase-text">Tổng tiền:</p>
                                    <p class="purchase-text"><%= totalPrice%> ₫</p>
                                </div>
                                <div class="payment-box-2-item">
                                    <p class="purchase-text">Giảm giá:</p>
                                    <p class="purchase-text">0₫</p>
                                </div>
                                <div class="payment-box-2-item">
                                    <p class="purchase-text">Thành tiền:</p>
                                    <p class="purchase-text" style="font-weight: 700"><%= totalPrice%> ₫</p>
                                </div>
                                <div class="payment-box-2-img">
                                    <button id="myBtn" class="purchase-btn">Thanh toán</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- Footer -->
        <%@ include file="./component/footer.jsp" %>

        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <form action="OrderByUser" method="post" class="modal-content">
                <span class="close">&times;</span>
                <div class="checkout-page">
                    <div class="checkout-page-row1">
                        <h2 class="checkout-title">Nhập số điện thoại</h2>
                        <i class="fa-solid fa-xmar checkout-page-close"></i>
                    </div>
                    <textarea class="address-input" placeholder="Nhập số điện thoại" id="phoneNumber" name="phoneNumber" rows="1" cols="50"></textarea>
                    <div class="checkout-page-row1">
                        <h2 class="checkout-title">Nhập địa chỉ của bạn</h2>
                        <i class="fa-solid fa-xmar checkout-page-close"></i>
                    </div>
                    <textarea class="address-input" placeholder="Nhập địa chỉ nhận hàng" id="address" name="address" rows="4" cols="50"></textarea>
                    <h2 class="checkout-title">Phương thức thanh toán</h2>
                    <div class="checkout-page-row2">
                        <p class="checkout-note-detail">
                            Thanh toán khi nhận hàng
                        </p>
                    </div>
                    <div class="checkout-page-row4">
                        <div class="checkout-page-row4-left">
                            <h2 class="checkout-title">Lưu ý</h2>
                            <p class="checkout-note">
                                Tối đa 5 phút sau thời gian chuyển khoản, nếu hệ thống không phản hồi
                                vui lòng liên hệ ngay bộ phận hỗ trợ của BookStore.
                            </p>
                            <p class="checkout-note-detail">
                                <i class="fa-solid fa-phone"></i>
                                035.777.9452
                            </p>
                            <p class="checkout-note-detail">
                                <i class="fa-solid fa-envelope"></i>
                                contact@.bookStore.vn
                            </p>
                        </div>
                        <div class="checkout-page-row4-right">
                            <h2 class="checkout-title">Chi tiết hóa đơn</h2>
                            <div class="checkout-bill-wrap">
                                <div class="bank-info-box">
                                    <h2 class="bank-info-box-content">Tổng tiền :</h2>
                                    <h1
                                        class="bank-info-box-content"
                                        >
                                        <%= totalPrice%>đ
                                    </h1>
                                </div>
                                <input type="hidden" name="total" value="<%= totalPrice%>">
                                <input type="hidden" name="cartId" value="<%= id%>">
                                <input type="hidden" name="userId" value="<%= userId%>">
                                <button onclick="orderClick()" type="submit" class="confirm-checkout-btn">
                                    <span>Xác nhận đặt hàng</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
        <%%>
    </body>

    <script>
// Get the modal
        var modal = document.getElementById("myModal");

// Get the button that opens the modal
        var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "block";
        }

// When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

// When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        function orderClick() {
            window.alert("Đặt hàng thành công");
        }

        function checkUrl() {
            var currentUrl = window.location.href;
            var role = localStorage.getItem("role");

            if (!role || role === 'null') {
                window.location.href = "./index.jsp";
            }

            if (role === "ROLE_ADMIN") {
                window.location.href = "./userList.jsp";
            }

            if (!currentUrl.includes("?cartId=" + localStorage.getItem("cartId")) || !currentUrl.includes("&userId=" + localStorage.getItem("userId"))) {
                window.location.href = "./cart.jsp?cartId=" + localStorage.getItem("cartId") + "&userId=" + localStorage.getItem("userId");
            }
        }

        checkUrl()
    </script>
</html>