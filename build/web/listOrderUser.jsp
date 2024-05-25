<%@page import="model.Order"%>
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
            <div class="app-container"> 
                <div class="grid wide1">
                    <div style="padding: 0 90px" class="row">
                        <h2 style="marginBottom: 25px;">Danh sách đơn hàng</h2>
                        <%
                            String userId = request.getParameter("userId");
                            Dao dao = new Dao();
                            List<Order> list = dao.getAllOrderByUserId(userId);
                            for (Order item : list) {
                        %>
                        <div style="margin-bottom: 20px; padding: 20px 40px" class="cart-box l-11">
                            <h3 style="marginBottom: 25px;">Đơn hàng #<%= item.getOrderId()%> <span>(
                                    <% if ("0".equals(item.getStatus())) { %>
                                    Đang chờ duyệt
                                    <% } else if ("1".equals(item.getStatus())) { %>
                                    Đang giao hàng
                                    <% } else if ("2".equals(item.getStatus())) { %>
                                    Đã nhận hàng
                                    <% }%>
                                    )</span></h3>
                            <div class="course-cart">
                                <div class="col l-3">
                                    <img
                                        src="data:image/png;base64,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"
                                        alt=""
                                        class="cart-img"
                                        />
                                </div>
                                <div class="col l-3">
                                    <div class="name-and-type">
                                        <p class="cart-name"><i class="fa-solid fa-location-dot"></i> <%= item.getAddress()%></p>
                                        <p class="cart-type">Sđt: <%= item.getPhoneNumber()%></p>
                                    </div>
                                </div>
                                <div class="col l-3">
                                    <div class="price-and-quantity">
                                        <p style="font-weight: 600">Tổng số tiền</p>
                                        <p class="cart-price"><%= item.getTotal()%> ₫</p>
                                    </div>
                                </div>
                            </div>
                            <div class="cart-box-bottom">
                                <div></div>
                                <div style="display: flex; align-items: center;">
                                    <form style="margin: 0;" action="UpdateOrderStatus" method="post">
                                        <input type="hidden" name="status" value="2">
                                        <input type="hidden" name="orderId" value="<%= item.getOrderId()%>">
                                        <% if ("2".equals(item.getStatus())) { %>
                                        <div class="cart-btn" style="text-decoration: none; margin-right: 8px;">
                                            Yêu cầu hoàn trả hàng
                                        </div>
                                        <% } else { %>
                                        <button type="submit" class="cart-btn" style="text-decoration: none; margin-right: 8px; background-color: #2081E2; color: #fff; padding: 9px 16px" href="./index.jsp">
                                            Đã nhận hàng
                                        </button>
                                        <% }%>
                                    </form>
                                    <a href="./orderDetailUser.jsp?orderId=<%= item.getOrderId()%>" class="cart-btn" style="text-decoration: none" href="./index.jsp">
                                        Xem chi tiết đơn hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <%@ include file="./component/footer.jsp" %>
        </section>
    </form>

</div>
<%%>
</body>

<script>
    function checkUrl() {
        var currentUrl = window.location.href;
        var role = localStorage.getItem("role");
        
        if (!role || role === 'null') {
                window.location.href = "./index.jsp";
            }

        if (role === "ROLE_ADMIN") {
            window.location.href = "./userList.jsp";
        }

        if (!currentUrl.includes("?userId=" + localStorage.getItem("userId"))) {
            window.location.href = "./listOrderUser.jsp?userId=" + localStorage.getItem("userId");
        }
    }

    checkUrl()
</script>
</html>