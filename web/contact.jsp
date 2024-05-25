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
        <link rel="stylesheet" href="./style/contact.css">
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

            <div class="contact_container">
                <div class="grid wide">
                    <div class="row contact_row">
                        <div class="col l-4 m-12 c-12">
                            <h3 class="contact_tittle">Gửi phản hồi cho chúng tôi</h3>
                            <div class="contact_input-wrap">
                                <input type="text" class="contact_input-name" placeholder="Nhập tên">
                                <input type="text" class="contact_input-email" placeholder="Nhập email">
                                <input type="text" class="contact_input-phone" placeholder="Nhập số điện thoại">
                                <div class="contact_input-content-wrap">
                                    <input type="text" class="contact_input-content" placeholder="Nhập nội dung phản hồi">
                                </div>
                            </div>
                            <button class="contact_button btn btn--primary">Gửi phản hồi</button>
                        </div>

                        <div class="col l-7 m-12 c-12">
                            <ul class="contact__list">
                                <li class="contact__list-item">
                                    <i class="contact__list-item-icon fa-solid fa-location-dot"></i>
                                    <a href="" class="contact__list-item-tittle">102 Trần Phú, Phường Mộ Lao, Quận Hà Đông,
                                        TP Hà Nội</a>
                                </li>
                                <li class="contact__list-item">
                                    <i class="contact__list-item-icon fa-solid fa-phone"></i>
                                    <a href="tel:+8435777945" class="contact__list-item-tittle">035 777 9452</a>
                                </li>
                                <li class="contact__list-item">
                                    <i class="contact__list-item-icon fa-solid fa-envelope"></i>
                                    <a href="mailto:marketg10@gmail.com?subject=Mail from our Website"
                                       class="contact__list-item-tittle">marketg10@gmail.com</a>
                                </li>
                                <li class="contact__list-item">
                                    <i class="contact__list-item-icon fa-brands fa-telegram"></i>
                                    <a href="" class="contact__list-item-tittle">@g10support</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col l-12 m-12 c-12" style="padding-bottom:40px ;">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.339004812735!2d105.78345761488258!3d20.97904378602539!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acd27916caa5%3A0xd1a865aa1cacdd14!2zMTAyIFRy4bqnbiBQaMO6LCBQLiBN4buZIExhbywgSMOgIMSQw7RuZywgSMOgIE7hu5lpLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1665161130785!5m2!1sen!2s"
                                width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
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