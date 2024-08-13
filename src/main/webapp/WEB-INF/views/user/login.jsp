<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IDO 로그인</title>
    <%--    <link rel="stylesheet" href="/css/table.css"/>--%>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">

        // HTML로딩이 완료되고, 실행됨
        $(document).ready(function () {

            // 회원가입
            $("#btnUserReg").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                location.href = "/user/userRegForm";
            })

            // 아이디 찾기
            $("#btnSearchUserId").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                location.href = "/user/searchUserId";
            })

            // 비밀번호 찾기
            $("#btnSearchPassword").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                location.href = "/user/searchPassword";
            })

            // 로그인
            $("#btnLogin").on("click", function () {
                let f = document.getElementById("f"); // form 태그

                if (f.userId.value === "") {
                    alert("아이디를 입력하세요.");
                    f.userId.focus();
                    return;
                }

                if (f.password.value === "") {
                    alert("비밀번호를 입력하세요.");
                    f.password.focus();
                    return;
                }

                // Ajax 호출해서 로그인하기
                $.ajax({
                        url: "/user/loginProc",
                        type: "post", // 전송방식은 Post
                        dataType: "JSON", // 전송 결과는 JSON으로 받기
                        data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                        success: function (json) { // /notice/noticeUpdate 호출이 성공했다면..

                            if (json.result === 1) { // 로그인 성공
                                alert(json.msg); // 메시지 띄우기
                                location.href = "/user/loginResult"; // 로그인 성공 페이지 이동

                            } else { // 로그인 실패
                                alert(json.msg); // 메시지 띄우기
                                $("#userId").focus(); // 아이디 입력 항목에 마우스 커서 이동
                            }

                        }
                    }
                )

            })
        })
    </script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/static/lib/wow/wow.min.js"></script>
    <script src="/static/lib/easing/easing.min.js"></script>
    <script src="/static/lib/waypoints/waypoints.min.js"></script>
    <script src="/static/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/static/js/main.js"></script>
    <meta charset="utf-8">
    <title>Kider - Preschool Website Template</title>
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
            font-size: 50px;

        }

        #userId::placeholder {
            font-size: 18px;
            padding-left: 4px; /* 입력 상자 내부의 왼쪽 여백 추가 */
            padding-top: 10px; /* 입력 상자 내부의 위쪽 여백 추가 */
            position: relative;
            top: 3px;
        }


        #userPassword::placeholder {
            font-size: 18px;
            padding-left: 4px; /* 입력 상자 내부의 왼쪽 여백 추가 */
            padding-top: 10px; /* 입력 상자 내부의 위쪽 여백 추가 */
            position: relative;
            top: 3px;
        }

        #loggingIn{

            color:white;
            font-size: 20px;

        }

        /*.signUp{*/
        /*    !*margin-left:40%;*!*/
        /*    color:white;*/
        /*    font-size:15px;*/
        /*    text-decoration:underline;*/
        /*}*/

        .forgotPw, .signUp, .forgotId{
            margin-left:10%;
            color:white;
            font-size:15px;
            text-decoration:underline;
            cursor: pointer;
        }

        /*.forgotId{*/
        /*    margin-left:10%;*/
        /*    color:white;*/
        /*    font-size:15px;*/
        /*    text-decoration:underline;*/
        /*}*/



        #forgot{
            margin-top:20px;

        }
    </style>



</head>
<body>
<%--<h2>로그인하기</h2>--%>
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
<%--                <div class="divTableCell">비밀번호--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="password" name="password" id="password" style="width:95%"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <button id="btnLogin" type="button">로그인</button>--%>
<%--        <button id="btnUserReg" type="button">회원가입</button>--%>
<%--        <button id="btnSearchUserId" type="button">아이디 찾기</button>--%>
<%--        <button id="btnSearchPassword" type="button">비밀번호 찾기</button>--%>
<%--    </div>--%>
<%--</form>--%>

<div class="container-xxl bg-white p-0">

    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
        <a href="IDOindex.html" class="navbar-brand">
            <!--            <h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Kider</h1>-->

            <a href="/main" class="IDOLogo"><img src="/static/img/IDOLogo.png" style="width:180px; margin-left: 7%; margin-right: 50%;" alt="IDOLOGO"></a>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 내비바 -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
                <!--                <a href="IDOindex.html" class="nav-item nav-link active">홈</a>-->
                <a href="/main" class="nav-item nav-link" id="Home-Button" style="font-family: 'Katuri'; font-size: 25px;">홈</a>
                <a href="/selectone" class="nav-item nav-link" id="Class-Button" style="font-family: 'Katuri';font-size: 25px;" >수업</a>
                <a href="/user/intro" class="nav-item nav-link" id="Contact-Button" style="font-family: 'Katuri';font-size: 25px;">소개</a>


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
            <a href="/user/login" style="background-color: #0d6efd; color:#FFFFFF; font-family: 'Katuri'; font-size: 25px; border-radius:15px; width: 8%; height: 8%; text-align: center; margin-right: 7%;"  >로그인</a>
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
                    <div class="login-input"><input name="userId" placeholder="아이디" id="userId" type="text" style="width:250px; height: 50px; border-radius:10px; border: none; font-family: 'TmoneyRoundWindExtraBold'; "></div><br>
                    <div class="login-input"><input name="password" placeholder="비밀번호" id="userPassword" type="password" style="width:250px; height: 50px; border-radius:10px; border: none; font-family: 'TmoneyRoundWindExtraBold'; "></div><br>
                    <div id="signUp">
                        <a href="/user/join" class="gotojoin"><span class="signUp" style="font-family: 'TmoneyRoundWindExtraBold'; margin-left:38%;" id="btnUserReg">회원가입</span></a>
                    </div>
                    <button id="btnLogin" type="button" style="margin-top: 15px; width: 250px; height: 45px; flex-shrink: 0; border-radius: 50px; border: none; background: #0d6efd; box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); font-family: 'TmoneyRoundWindExtraBold';">로그인</button>

                </form>
                <div id="forgot">
                    <span class="forgotId" style="font-family: 'TmoneyRoundWindExtraBold';" id="btnSearchUserId">아이디 찾기</span>
                    <span class="forgotPw" style="font-family: 'TmoneyRoundWindExtraBold';" id="btnSearchPassword">비밀번호 찾기</span>

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

</body>
</html>