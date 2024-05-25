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
        <link rel="stylesheet" href="../style/footer.css">
        <link rel="stylesheet" href="../style/grid.css">
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
        <section class="footer"><div class="grid wide">
                <div class="row">
                    <div class="col l-2 m-12 c-12" style="padding-left: 36px;">
                        <div style="display: flex; align-items: center; margin-bottom: 19px">
                            <img src="https://openlearning.vercel.app/static/media/logo.6706f228d11b4351144c707e387cef80.svg" alt="" class="footer__logo" />
                            <span style="color: #fff; font-size: 22px; margin: 28px 0 0 9px; font-weight: 600">BookStore</span>
                        </div>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-solid fa-location-dot"></i>
                                <a href="" class="footer__list-item-tittle">102 Trần Phú, Phường Mộ Lao, Quận Hà Đông, TP Hà
                                    Nội</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-solid fa-phone"></i>
                                <a href="tel:+8435777945" class="footer__list-item-tittle">035 777 9452</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-solid fa-envelope"></i>
                                <a href="mailto:marketg10@gmail.com?subject=Mail from our Website"
                                   class="footer__list-item-tittle">bookStore@gmail.com</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-brands fa-telegram"></i>
                                <a href="./index.jsp" class="footer__list-item-tittle">@g10support</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col l-2 m-4 c-6" style="padding-left: 36px;">
                        <h3 class="footer__heading">GIỚI THIỆU</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="./index.jsp" class="footer__list-item-tittle">Giới thiệu</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="./index.jsp" class="footer__list-item-tittle">Liên hệ</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="./index.jsp" class="footer__list-item-tittle">Tin tức</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="./index.jsp" class="footer__list-item-tittle">Tuyển dụng</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="./index.jsp" class="footer__list-item-tittle">Chính sách bảo mật</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="./index.jsp" class="footer__list-item-tittle">Chính sách thanh toán</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col l-2 m-4 c-6" style="padding-left: 36px;">
                        <h3 class="footer__heading">THEO DÕI</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-brands fa-facebook"></i>
                                <a href="" class="footer__list-item-tittle">Facebook</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-brands fa-instagram"></i>
                                <a href="" class="footer__list-item-tittle">Instagram</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-brands fa-twitter"></i>
                                <a href="" class="footer__list-item-tittle">Twitter</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fa-brands fa-linkedin"></i>
                                <a href="" class="footer__list-item-tittle">Linkedin</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col l-2 m-12 c-12" style="padding-left: 36px;">
                        <h3 class="footer__heading">BẢN ĐỒ</h3>
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.339004812735!2d105.78345761488258!3d20.97904378602539!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acd27916caa5%3A0xd1a865aa1cacdd14!2zMTAyIFRy4bqnbiBQaMO6LCBQLiBN4buZIExhbywgSMOgIMSQw7RuZywgSMOgIE7hu5lpLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1665161130785!5m2!1sen!2s"
                            width="300" height="100" style="border: 0" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
            <div class="footer__bottom">
                <div class="grid wide">
                    <p class="footer__bottom-tittle">
                        © 2022 - Bản quyền thuộc về tungle492
                    </p>
                </div>
            </div>
        </section>
    </body>
</html>
