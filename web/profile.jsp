<%@page import="model.User"%>
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
        <link rel="stylesheet" href="./style/adminTable.css">
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
                <h2 style="margin-left: 50px">Thông tin cá nhân</h2>
                <div style="display: flex; justify-content: center">
                    <img style="border-radius: 50%; width: 150px; height: 150px;" src="https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg" alt="alt"/>
                </div>
                <%
                    String id = request.getParameter("userId");
                    Dao dao = new Dao();
                    User user = dao.getUserById(id);

                    if (user != null) {
                %>
                <div style="display: flex; justify-content: center; margin-top: 50px">
                    <form class="form" action="ProfileUpdate" method="post">
                        <div class="input-wrap">
                            <span>UserId:</span>
                            <input class="input" type="text" id="userId" name="userId" value="<%= user.getId()%>" required readonly>
                        </div>

                        <div class="input-wrap">
                            <span>Username:</span>
                            <input class="input" type="text" id="username" name="username" value="<%= user.getUserName()%>" required readonly>
                        </div>

                        <input class="input" type="hidden" id="password" name="password" value="<%= user.getPassword()%>">

                        <div class="input-wrap">
                            <span>Nhập tên người dùng:</span>
                            <input class="input" type="text" id="name" name="name" value="<%= user.getName()%>" required>
                        </div>

                        <div class="input-wrap">
                            <span>Nhập email:</span>
                            <input class="input" type="text" id="email" name="email" value="<%= user.getEmail()%>" required>
                        </div>

                        <div style="display: flex; justify-content: space-between">
                            <div></div>
                            <input onClick="updateProfile()" class="button" type="submit" value="Cập nhật">
                        </div>                      
                    </form>
                </div>

                <%
                    } else {
                        out.println("");
                    }
                %>
            </div>

            <!-- Footer -->
            <%@ include file="./component/footer.jsp" %>
        </section>

        <script>
            function updateProfile() {
                window.alert("Cập nhật thông tin thành công")
            }
            
            function checkUrl() {
                var currentUrl = window.location.href;
                var role = localStorage.getItem("role");

                if (role === "ROLE_ADMIN") {
                    window.location.href = "./userList.jsp";
                }

                if (!currentUrl.includes("?userId=" + localStorage.getItem("userId"))) {
                    window.location.href = "./profile.jsp?userId=" + localStorage.getItem("userId");
                }
            }

            checkUrl()
        </script>
    </body>
</html>