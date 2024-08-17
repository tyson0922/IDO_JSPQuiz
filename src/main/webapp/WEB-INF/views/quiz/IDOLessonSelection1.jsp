<%--
  Created by IntelliJ IDEA.
  User: data8320-06
  Date: 2024-08-15
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>IDOLevel1</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/static/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&display=swap" rel="stylesheet">

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


        #Contact-Button{
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
        .dashed-border {
            position: relative;
        }

        .dashed-line1 {
            border: none;
            border-top: 7px dashed #8382cc;
            color: rgb(0 0 0 / 0%);
            position: absolute;
            top: 10%;
            left: 10%;
            right: 15%;
            width: 70%;
            height: auto;
            z-index: 2;
            margin: auto 0 ;
        }
        .dashed-line2 {
            border: none;
            border-top: 7px dashed #04046c;
            color: rgb(0 0 0 / 0%);
            position: absolute;
            top: 80%;
            left: 10%;
            right: 15%;
            width: 70%;
            height: auto;
            z-index: 2;
        }
        .depth1 {
            position: absolute;
            top: 7.5%;
            left: calc(10% + 76%);
            transform: translateX(10px);
            color: black;
            z-index: 3;
        }
        .depth2 {
            position: absolute;
            top: 80%;
            left: calc(10% + 76%);
            transform: translateX(10px);
            color: black;
            z-index: 3;
        }

        .selection-heading {
            position: absolute;
            top: 15%;
            left: 8%;
            width: 80%;
            height: auto;
            text-align: center;
            z-index: 3;

        }
        .Lesson-selection1 {
            position: absolute;
            width: 132%;
            top: 50%; /* 세로 중앙에 배치 */
            left: 10%; /* 좌측에 배치 */
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            z-index: 4; /* 우선순위 높게 설정 */
        }

        .Lesson-selection1 img {
            max-width: 52%; /* 이미지 크기 조정 */
            height: auto; /* 높이 자동 조정 */
        }
        .Lesson-selection1-heading {
            position: absolute;
            top: 77%; /* 세로 중앙에 배치 */
            left: 16%; /* 좌측에 배치 */
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            z-index: 4; /* 우선순위 높게 설정 */
        }
        .Lesson-selection2 {
            position: absolute;
            width: 132%;
            top: 50%; /* 세로 중앙에 배치 */
            left: 37%; /* 좌측에 배치 */
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            z-index: 4; /* 우선순위 높게 설정 */
        }

        .Lesson-selection2 img {
            max-width: 52%; /* 이미지 크기 조정 */
            height: auto; /* 높이 자동 조정 */
        }
        .Lesson-selection2-heading {
            position: absolute;
            top: 77%; /* 세로 중앙에 배치 */
            left: 44%; /* 좌측에 배치 */
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            z-index: 4; /* 우선순위 높게 설정 */
        }
        /*.Lesson-selection2-lock {*/
        /*    position: absolute;*/
        /*    top: 60%; !* 세로 중앙에 배치 *!*/
        /*    left: 37%; !* 좌측에 배치 *!*/
        /*    transform: translateY(-50%); !* 세로 중앙 정렬 보정 *!*/
        /*    z-index: 5; !* 우선순위 높게 설정 *!*/
        /*}*/
        /*.Lesson-selection2-lock img {*/
        /*    max-width: 34.5%; !* 이미지 크기 조정 *!*/
        /*    height: auto; !* 높이 자동 조정 *!*/
        /*    opacity: 80%;*/
        /*}*/
        .Lesson-selection3 {
            position: absolute;
            width: 132%;
            top: 50%; /* 세로 중앙에 배치 */
            left: 64%; /* 좌측에 배치 */
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            z-index: 4; /* 우선순위 높게 설정 */
        }

        .Lesson-selection3 img {
            max-width: 61%; /* 이미지 크기 조정 */
            height: auto; /* 높이 자동 조정 */
        }
        .Lesson-selection3-heading {
            position: absolute;
            top: 77%; /* 세로 중앙에 배치 */
            left: 71%; /* 좌측에 배치 */
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            z-index: 5; /* 우선순위 높게 설정 */
        }
        .selection-down {
            position: absolute;
            top: 90%; /* 세로 중앙에 배치 */
            left: 44%; /* 좌측에 배치 */
            width: 30%;
            transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
            z-index: 4; /* 우선순위 높게 설정 */
        }
        .selection-down img {
            max-width: 25%; /* 이미지 크기 조정 */
            height: auto; /* 높이 자동 조정 */
        }





    </style>
</head>

<body>
<div class="container-xxl bg-white p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
        <a href="/user/loginIndex" class="navbar-brand">
            <!--            <h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Kider</h1>-->

            <a href="/user/loginIndex" class="IDOLogo"><img src="/static/img/IDOLogo.png" style="width:180px; margin-left: 7%; margin-right: 50%;" alt="IDOLOGO"></a>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 내비바 -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
                <!--                <a href="index.html" class="nav-item nav-link active">홈</a>-->
                <a href="user/index" class="nav-item nav-link" id="Home-Button" style="font-family: 'Katuri'; font-size: 25px;">홈</a>
                <a href="about.html" class="nav-item nav-link" id="Class-Button" style="font-family: 'Katuri';font-size: 25px;" >수업</a>
                <a href="quiz/IDOLessonSelection1" class="nav-item nav-link" id="Contact-Button" style="font-family: 'Katuri';font-size: 25px;">소개</a>


            </div>
            <!--            <a href="" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">Join Us<i class="fa fa-arrow-right ms-3"></i></a>-->
            <a href="user/login" style="background-color: #0d6efd; color:#FFFFFF; font-family: 'Katuri'; font-size: 25px; border-radius:15px; width: 8%; height: 8%; text-align: center; margin-right: 7%;" >로그인</a>
        </div>


    </nav>
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <!-- 메인 본문 -->


    <div class="container-fluid p-0 mb-5">


        <div class="imgTest">
            <!--            <div class="dashed-border1">-->
            <hr class="dashed-line1">
            <a class="depth1" style="font-family: 'Katuri';font-size: 25px;">0m</a>
            <!--            </div>-->
            <!--            <div class="dashed-border2">-->
            <hr class="dashed-line2">
            <a class="depth2" style="font-family: 'Katuri';font-size: 25px;">100m</a>
            <!--            </div>-->
            <div class="selection-heading">
                <a style="font-family: 'Katuri'; font-size: 50px; color:#2b2b70">동화를 선택하세요</a>
            </div>
            <div class="Lesson-selection1">
                <img src="/static/img/IDOselection1-1.png" alt="">
            </div>
            <div class="Lesson-selection1-heading">
                <a style="font-family: 'Katuri'; font-size: 30px; color:black">해님 달님</a>
            </div>
            <div class="Lesson-selection2">
                <img src="/static/img/IDOselection1-2.png" alt="">
            </div>
            <div class="Lesson-selection2-heading">
                <a style="font-family: 'Katuri'; font-size: 30px; color:black">콩쥐 팥쥐</a>
            </div>
            <!--        <div class="Lesson-selection2-lock">-->
            <!--            <img src="img/IDOselectionLock.png" alt="">-->
            <!--        </div>-->
            <div class="Lesson-selection3">
                <img src="/static/img/IDOselection1-3.png" alt="">
            </div>
            <div class="Lesson-selection3-heading">
                <a style="font-family: 'Katuri'; font-size: 30px; color:black">흥부 놀부</a>
            </div>
            <!--        <div class="Lesson-selection3-lock">-->
            <!--            <img src="img/IDOselectionLock.png" alt="">-->
            <!--        </div>-->

            <div class="selection-down">
                <a href="IDOLessonSelection2">
                    <img src="/static/img/IDOselectionDown.png" alt="">
                </a>
            </div>

            <img class="img-fluid background" src="/static/img/IDOmainBackground.png" alt="">

        </div>




    </div>


</div>


<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s" style="width:100%;">
    <!--        <div class="container py-5">-->

    <!--        </div>-->
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


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

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