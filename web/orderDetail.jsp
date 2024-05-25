<%@page import="model.User"%>
<%@page import="model.OrderItem"%>
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
                            <h1 style="marginBottom: 25px;">Chi tiết đơn hàng</h1>
                            <%
                                String status = request.getParameter("status");
                                String orderId = request.getParameter("orderId");
                                String phoneNumber = request.getParameter("phoneNumber");
                                Dao dao = new Dao();
                                List<OrderItem> list = dao.getAllOrderItemByOrderId(orderId);
                                for (OrderItem item : list) {
                            %>
                            <%
                                String productId = item.getProductId();
                                Product product = dao.getProductById(productId);
                                if (product != null) {
                            %>
                            <div class="course-cart">
                                <div class="col l-3">
                                    <img
                                        src="<%= product.getImgUrl()%>"
                                        alt=""
                                        class="cart-img"
                                        />
                                </div>
                                <div class="col l-3">
                                    <div class="name-and-type">
                                        <p class="cart-name"><%= product.getName()%></p>
                                        <p class="cart-type">Type: <%= product.getType1()%></p>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="price-and-quantity">
                                        <p class="cart-price"><%= product.getPrice()%> ₫</p>
                                        <% totalPrice += Integer.parseInt(product.getDiscountPrice()) * Integer.parseInt(item.getQuantity());%>
                                        <p class="cart-quantity">Số lượng: x<%= item.getQuantity()%></p>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <a href="./productUpdate.jsp?productId=<%= product.getId()%>" class="btn-group">
                                        <button type="submit" class="cart-btn">Xem sản phẩm</button>
                                    </a>
                                </div>
                            </div>
                            <%} else {
                                    out.println("");
                                }%>
                            <% }%>

                            <div class="cart-box-bottom">
                                <div></div>
                                <div style="display: flex; align-items: center;">
                                    <p style="margin-right: 10px">Đổi trạng thái: </p>
                                    <form style="margin: 0;" action="UpdateOrderStatusAdmin" method="post">
                                        <input type="hidden" name="status" value="2">
                                        <input type="hidden" name="orderId" value="<%= orderId%>">
                                        <button type="submit" class="cart-btn" style="text-decoration: none; margin-right: 8px; background-color: #2081E2; color: #fff; padding: 9px 16px" href="./index.jsp">
                                            Đã nhận hàng
                                        </button>
                                    </form>
                                    <form style="margin: 0;" action="UpdateOrderStatusAdmin" method="post">
                                        <input type="hidden" name="status" value="1">
                                        <input type="hidden" name="orderId" value="<%= orderId%>">
                                        <button type="submit" class="cart-btn" style="text-decoration: none; margin-right: 8px; background-color: #2081E2; color: #fff; padding: 9px 16px" href="./index.jsp">
                                            Đang giao hàng
                                        </button>
                                    </form>
                                    <form style="margin: 0;" action="UpdateOrderStatusAdmin" method="post">
                                        <input type="hidden" name="status" value="0">
                                        <input type="hidden" name="orderId" value="<%= orderId%>">
                                        <button type="submit" class="cart-btn" style="text-decoration: none; margin-right: 8px; background-color: #2081E2; color: #fff; padding: 9px 16px" href="./index.jsp">
                                            Đang chờ duyệt
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            String userId = request.getParameter("userId");
                            User user = dao.getUserById(userId);

                            if (user != null) {
                        %>
                        <div class="payment-box l-3" style="padding: 0 0 0 25px;">
                            <div class="payment-box-2">
                                <div class="payment-box-2-item">
                                    <p class="purchase-text">Trạng thái:</p>
                                    <p class="purchase-text"><% if ("0".equals(status)) { %>
                                        Đang chờ duyệt
                                        <% } else if ("1".equals(status)) { %>
                                        Đang giao hàng
                                        <% } else if ("2".equals(status)) { %>
                                        Đã nhận hàng
                                        <% }%></p>
                                </div>
                                <div class="payment-box-2-item">
                                    <p class="purchase-text">Tên khách hàng:</p>
                                    <p class="purchase-text"><%= user.getName()%></p>
                                </div>
                                <div class="payment-box-2-item">
                                    <p class="purchase-text">Số điện thoại:</p>
                                    <p class="purchase-text"><%= phoneNumber%></p>
                                </div>
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
                            </div>
                        </div>
                        <%
                            } else {
                                out.println("");
                            }
                        %>
                    </div>
                </div>
            </div>

        </section>
        <%%>

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

    <script>
    </script>
</html>