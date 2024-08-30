<%--
  Created by IntelliJ IDEA.
  User: data8320-06
  Date: 2024-08-29
  Time: 오후 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport">
    <title>마이페이지(회원정보)</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/static/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/static/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/static/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/static/css/style.css" rel="stylesheet">

    <style>

        @font-face {
            font-family: 'Katuri';
            src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/Katuri.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'TmoneyRoundWindExtraBold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .navbar-nav .nav-link {
            padding-right: 0;
            padding-left: 0;
            margin: 0 80px; /* 좌우 간격을 10px로 설정 */
        }

        #Home-Button {
            transition: color 0.3s ease, background-color 0.3s ease;
        }

        #Home-Button:hover {
            color: #007bff;
            /*background-color: #007bff; !* 원하는 색상으로 변경 *!*/
        }

        #Class-Button {
            transition: color 0.3s ease, background-color 0.3s ease;
        }

        #Class-Button:hover {
            color: #007bff;
            /*background-color: #007bff; !* 원하는 색상으로 변경 *!*/
        }


        #Contact-Button {
            transition: color 0.3s ease, background-color 0.3s ease;
        }

        #Contact-Button:hover {
            color: #007bff;
            /*background-color: #007bff; !* 원하는 색상으로 변경 *!*/
        }


        .imgTest {
            position: relative;
        }

        .background {
            position: relative; /* 기본값으로 설정합니다. */
            width: 100%; /* 필요에 따라 조정하세요 */
            height: auto; /* 필요에 따라 조정하세요 */
            z-index: 1;
        }

        body {
            font-family: 'TmoneyRoundWindExtraBold';
            margin: 20px;
        }

        h1, h2, h3 {
            color: #333;
        }

        .container-myInfo {
            position: absolute;
            top: 52%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 2;
            border: 5px solid #ffffff;
            border-radius: 5%;
            padding-left: 3%;
            padding-right: 3%;
            padding-top: 2%;
            padding-bottom: 1%;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width:100%;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .calendar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 1%;
        }

        .calendar div {
            text-align: center;
        }

        .statistics div {
            margin-bottom: 10px;
        }
        .info-container {
            display: flex;
            gap: 70px; /* Adds space between the sections */
            margin-bottom: 4%;
        }
        .info-section {
            flex: 1; /* Ensures sections take up equal width */
        }
        #childCheckListPageButton {
            padding-bottom: 3%;
            padding-top: 3%;
            margin-top: 5%;
            margin-bottom: 2%;
            /*margin-left: 10%;*/
            border-radius: 20px;
            background-color: #f5d537;
            color: black;
        }

        .deleteAccount {
            margin-left:4%;

            color:red;
            font-size:1.5rem;
            text-decoration:underline;
        }
    </style>
</head>

<body>
<div class="container-xxl bg-white p-0">
    <!-- Spinner Start -->
    <div id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
        <a href="user/login" class="navbar-brand">
            <!--            <h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Kider</h1>-->

            <a href="/user/login" class="IDOLogo"><img src="/static/img/IDOLogo.png"
                                                         style="width:180px; margin-left: 7%; margin-right: 50%;"
                                                         alt="IDOLOGO"></a>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 내비바 -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
                <!--                <a href="IDOindex.html" class="nav-item nav-link active">홈</a>-->
                <a href="/user/loginIndex" class="nav-item nav-link" id="Home-Button"
                   style="font-family: 'Katuri'; font-size: 25px;">홈</a>
                <a href="/quiz/IDOLessonSelection1" class="nav-item nav-link" id="Class-Button"
                   style="font-family: 'Katuri';font-size: 25px;">수업</a>
                <a href="classes.html" class="nav-item nav-link" id="Contact-Button"
                   style="font-family: 'Katuri';font-size: 25px;">소개</a>


                <!--                <div class="nav-item dropdown">-->
                <!--                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>-->
                <!--                    <div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">-->
                <!--                        <a href="facility.html" class="dropdown-item">School Facilities</a>-->
                <!--                        <a href="team.html" class="dropdown-item">Popular Teachers</a>-->
                <!--                        <a href="call-to-action.html" class="dropdown-item">Become A Teachers</a>-->
                <!--                        <a href="appointment.html" class="dropdown-item">Make Appointment</a>-->
                <!--                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>-->
                <!--                        <a href="404.html" class="dropdown-item">404 Error</a>-->
                <!--                    </div>-->
                <!--                </div>-->
                <!--                <a href="contact.html" class="nav-item nav-link">Contact Us</a>-->
            </div>
            <!--            <a href="" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">Join Us<i class="fa fa-arrow-right ms-3"></i></a>-->
            <a href="IDOlogin.html"
               style="background-color: #0d6efd; color:#FFFFFF; font-family: 'Katuri'; font-size: 25px; border-radius:15px; width: 8%; height: 8%; text-align: center; margin-right: 7%;">프로필</a>
        </div>


    </nav>
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <!-- 메인 본문 -->
    <div class="container-fluid p-0 mb-5">


        <div class="imgTest">
            <img class="img-fluid background" src="/static/img/IDOmainBackground.png" style="z-index: 1;" alt="">
            <div class="container-myInfo">
                <h1 style="font-family: 'TmoneyRoundWindExtraBold';">마이페이지(회원정보)</h1>
                <div class="info-container">
                    <div class="info-section">

                        <h2 style="font-family: 'TmoneyRoundWindExtraBold';">회원 정보</h2>
                        <!--                        <div class="form-group">-->
                        <!--                            <label for="userID">ID:</label>-->
                        <!--                            <input type="text" id="userID" name="userID">-->
                        <!--                        </div>-->
                        <!--                        <div class="form-group">-->
                        <!--                            <label for="password">Password:</label>-->
                        <!--                            <input type="password" id="password" name="password">-->
                        <!--                        </div>-->
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" value="2420110163@gspace.kopo.ac.kr">
                        </div>
                        <div class="form-group">
                            <label for="address">Address (우편):</label>
                            <input type="text" id="address" name="address" value="10306">
                        </div>
                        <button class="btn" onclick="alert('회원 정보가 수정되었습니다.')" >회원 정보 수정</button>
                    </div>
                    <div class="info-section">
                        <h2 style="font-family: 'TmoneyRoundWindExtraBold';">아이 정보</h2>
                        <div class="form-group">
                            <label for="childName">이름:</label>
                            <input type="text" id="childName" name="childName" value="홍길동">
                        </div>
                        <div class="form-group">
                            <label for="childAge">나이(개월):</label>
                            <input type="number" id="childAge" name="childAge" value="40">
                        </div>
                        <button class="btn" onclick="alert('아이 정보가 수정되었습니다.')" >아이 정보 수정</button>



                        <!--                        <button class="btn" id="childCheckListPageButton" style="height: 20%" >아이 체크리스트 페이지</button>-->
                    </div>
                </div>




                <div id="deleteAccount">
                    <a href="" class="deleteAccount"><span class="deleteAccount" style="font-family: 'TmoneyRoundWindExtraBold'; margin-left:38%;">회원탈퇴</span></a>
                </div>

                <a  href="/user/IDOChildInfoPage"><button class="btn" id="childCheckListPageButton" style="height: 20%" >아이 체크리스트 페이지</button></a>
            </div>


        </div>
    </div>


    <!-- Back to Top -->
    <!--    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>-->
</div>
<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s"
     style="width:100%;">

    <div class="container">

        <div class="copyright">

            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.

                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                    <br>Distributed By: <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <div class="footer-menu">
                        <a href="">Home</a>
                        <a href="">Cookies</a>
                        <a href="">Help</a>
                        <a href="">FQAs</a>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!-- Footer End -->

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/static/lib/wow/wow.min.js"></script>
<script src="/static/lib/easing/easing.min.js"></script>
<script src="/static/lib/waypoints/waypoints.min.js"></script>
<script src="/static/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/static/js/main.js"></script>
</body>

</html>