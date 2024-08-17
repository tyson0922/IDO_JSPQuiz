<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <title>IDO 비밀번호 찾기</title>
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

        .foreground {
            position: absolute; /* 부모 컨테이너를 기준으로 위치를 지정합니다. */
            top: 0%; /* 필요한 위치를 설정하세요 */
            left: 22%; /* 필요한 위치를 설정하세요 */
            width: 60%; /* 필요에 따라 조정하세요 */
            height: auto; /* 필요에 따라 조정하세요 */
            z-index: 2;
        }
        #input-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 5px solid #ffffff;
            border-radius: 5%;
            padding-left: 3%;
            padding-right: 3%;
            padding-top: 2%;
            padding-bottom: 1%;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .login-input::placeholder {
            font-size: 70px;

        }

        #userId::placeholder {
            font-size: 16px;
            padding-left: 4px; /* 입력 상자 내부의 왼쪽 여백 추가 */
            padding-top: 10px; /* 입력 상자 내부의 위쪽 여백 추가 */
            position: relative;
            top: 3px;
        }

        #userName::placeholder {
            font-size: 16px;
            padding-left: 4px; /* 입력 상자 내부의 왼쪽 여백 추가 */
            padding-top: 10px; /* 입력 상자 내부의 위쪽 여백 추가 */
            position: relative;
            top: 3px;
        }
        #email::placeholder {
            font-size: 16px;
            padding-left: 4px; /* 입력 상자 내부의 왼쪽 여백 추가 */
            padding-top: 10px; /* 입력 상자 내부의 위쪽 여백 추가 */
            position: relative;
            top: 3px;
        }

        #loggingIn{

            color:white;
            font-size: 20px;
            text-align: center;


        }

        #heading{

            color:black;
            font-size: 30px;
            text-align: center;
            padding-bottom: 70px;


        }


        /*.signUp{*/
        /*    !*margin-left:40%;*!*/
        /*    color:white;*/
        /*    font-size:15px;*/
        /*    text-decoration:underline;*/
        /*}*/

        .forgotPw, .signUp, .forgotId{
            margin-left:3%;
            color:white;
            font-size:15px;
            text-decoration:none;
        }

        .forgotPw{
            text-decoration: underline;
            text-align: center;
            padding-left: 80px;
        }

        .forgotId{
            margin-left:0%;
            color:white;
            font-size:15px;
            text-decoration:none;
        }



        #forgot{

            margin-top:20px;

        }
    </style>

    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/static/css/table.css"/>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        // HTML로딩이 완료되고, 실행됨
        $(document).ready(function () {

            // 로그인 화면 이동
            $("#btnLogin").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                location.href = "/user/login";
            })

            // 비밀번호  찾기
            $("#btnSearchPassword").on("click", function () {
                let f = document.getElementById("f"); // form 태그

                if (f.userId.value === "") {
                    alert("아이디를 입력하세요.");
                    f.userId.focus();
                    return;
                }

                if (f.userName.value === "") {
                    alert("이름을 입력하세요.");
                    f.userName.focus();
                    return;
                }

                if (f.email.value === "") {
                    alert("이메일을 입력하세요.");
                    f.email.focus();
                    return;
                }

                f.method = "post"; // 비밀번호 찾기 정보 전송 방식
                f.action = "/user/searchPasswordProc" // 비밀번호 찾기 URL

                f.submit(); // 아이디 찾기 정보 전송하기
            })
        })
    </script>
</head>
<body>
<%--<h2>비밀번호 찾기</h2>--%>
<%--<hr/>--%>
<%--<br/>--%>
<%--<form id="f">--%>
<%--    <div class="divTable minimalistBlack">--%>
<%--        <div class="divTableBody">--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">아이디--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="text" name="userId" id="userId" style="width:95%"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">이름--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="text" name="userName" id="userName" style="width:95%"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">이메일--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="email" name="email" id="email" style="width:95%"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <button id="btnSearchPassword" type="button">비밀번호 찾기</button>--%>
<%--        <button id="btnLogin" type="button">로그인</button>--%>
<%--    </div>--%>
<%--</form>--%>

<div class="container-xxl bg-white p-0">
    <%--    <!-- Spinner Start -->--%>
    <%--    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">--%>
    <%--        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">--%>
    <%--            <span class="sr-only">Loading...</span>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <%--    <!-- Spinner End -->--%>


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
        <a href="IDOindex.html" class="navbar-brand">
            <!--            <h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Kider</h1>-->

            <a href="IDOindex.html" class="IDOLogo"><img src="/static/img/IDOLogo.png" style="width:180px; margin-left: 7%; margin-right: 50%;" alt="IDOLOGO"></a>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 내비바 -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
                <!--                <a href="IDOindex.html" class="nav-item nav-link active">홈</a>-->
                <a href="IDOindex.html" class="nav-item nav-link" id="Home-Button" style="font-family: 'Katuri'; font-size: 25px;">홈</a>
                <a href="about.html" class="nav-item nav-link" id="Class-Button" style="font-family: 'Katuri';font-size: 25px;" >수업</a>
                <a href="classes.html" class="nav-item nav-link" id="Contact-Button" style="font-family: 'Katuri';font-size: 25px;">소개</a>
            </div>
            <!--            <a href="" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">Join Us<i class="fa fa-arrow-right ms-3"></i></a>-->
            <a href="IDOlogin.html" style="background-color: #0d6efd; color:#FFFFFF; font-family: 'Katuri'; font-size: 25px; border-radius:15px; width: 8%; height: 8%; text-align: center; margin-right: 7%;" >로그인</a>
        </div>


    </nav>
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <!-- 메인 본문 -->
    <div class="container-fluid p-0 mb-5">


        <div class="imgTest">
            <img class="img-fluid background" src="/static/img/IDOmainBackground.png" style="z-index: 1;"alt="">
            <div id="input-box" style="z-index: 5;">
                <form id="f">
                    <div id="heading" style="margin-top: 15px; width: 250px; height: 45px; flex-shrink: 0; border-radius: 50px; border: none; font-family: 'TmoneyRoundWindExtraBold';"> 비밀번호 찾기 </div>
                    <div class="login-input">
                        <input name="userId" placeholder="아이디를 입력해주세요" id="userId" type="text" style="width:250px; height: 50px; margin-bottom: 7px; border-radius:10px; border: none; font-family: 'TmoneyRoundWindExtraBold'; ">
                        <br>
                        <input name="userName" placeholder="이름을 입력해주세요" id="userName" type="text" style="width:250px; height: 50px; margin-bottom: 7px; border-radius:10px; border: none; font-family: 'TmoneyRoundWindExtraBold'; ">
                        <br>
                        <input name="email" placeholder="이메일을 입력해주세요" id="email" type="email" style="width:250px; height: 50px; margin-bottom: 20px; border-radius:10px; border: none; font-family: 'TmoneyRoundWindExtraBold'; ">
                    </div>
                    <button id="btnSearchPassword" type="button" style="color: white; margin-top: 5px; width: 250px; height: 45px; flex-shrink: 0; border-radius: 50px; border: none; background: #0d6efd; box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); font-family: 'TmoneyRoundWindExtraBold';">비밀번호 찾기</button>

                </form>
                <div id="forgot">
                    <!--                    <span class="forgotId" style="font-family: 'TmoneyRoundWindExtraBold';">이미 계정이 있으신가요?</span>-->
                    <a href="/user/login"> <span class="forgotPw" style="font-family: 'TmoneyRoundWindExtraBold';">로그인하기</span></a>

                </div>

            </div>
        </div>



    </div>
</div>


<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s" style="width:100%;">

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

<!— Template Javascript —>
<script src="/static/js/main.js"></script>

</body>
</html>