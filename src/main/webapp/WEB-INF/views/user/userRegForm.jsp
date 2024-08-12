<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IDO 회원가입</title>
    <%--    <link rel="stylesheet" href="/css/table.css"/>--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/static/lib/wow/wow.min.js"></script>
    <script src="/static/lib/easing/easing.min.js"></script>
    <script src="/static/lib/waypoints/waypoints.min.js"></script>
    <script src="/static/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">


        // 아이디 중복체크여부 (중복 Y / 중복아님 : N)
        let userIdCheck = "Y";

        // 이메일 중복체크 인증번호 발송 값
        let emailAuthNumber = "";

        // HTML로딩이 완료되고, 실행됨
        $(document).ready(function () {

            let f = document.getElementById("f"); // form 태그

            // 아이디 중복체크
            $("#btnUserId").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                userIdExists(f)

            })

            // 이메일 중복체크
            $("#btnEmail").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                emailExists(f)

            })

            // 우편번호 찾기
            $("#btnAddr").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                kakaoPost(f);
            })

            // 회원가입
            $("#btnSend").on("click", function () { // 버튼 클릭했을때, 발생되는 이벤트 생성함(onclick 이벤트와 동일함)
                doSubmit(f);
            })

        })

        // 회원아이디 중복 체크
        function userIdExists(f) {

            if (f.userId.value === "") {
                alert("아이디를 입력하세요.");
                f.userId.focus();
                return;
            }

            // Ajax 호출해서 회원가입하기
            $.ajax({
                    url: "/user/getUserIdExists",
                    type: "post", // 전송방식은 Post
                    dataType: "JSON", // 전송 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                    success: function (json) { // 호출이 성공했다면..

                        if (json.existsYn === "Y") {
                            alert("이미 가입된 아이디가 존재합니다.");
                            f.userId.focus();

                        } else { // 회원가입 실패
                            alert("가입 가능한 아이디입니다.");
                            userIdCheck = "N";
                        }

                    }
                }
            )
        }

        // 이메일 중복 체크
        function emailExists(f) {
            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                f.email.focus();
                return;
            }

            // Ajax 호출해서 회원가입하기
            $.ajax({
                    url: "/user/getEmailExists",
                    type: "post", // 전송방식은 Post
                    dataType: "JSON", // 전송 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                    success: function (json) { // 호출이 성공했다면..

                        if (json.existsYn === "Y") {
                            alert("이미 가입된 이메일 주소가 존재합니다.");
                            f.email.focus();

                        } else {
                            alert("이메일로 인증번호가 발송되었습니다. \n받은 메일의 인증번호를 입력하기 바랍니다.");
                            emailAuthNumber = json.authNumber;

                        }

                    }
                }
            )
        }

        // 카카오 우편번호 조회 API 호출
        function kakaoPost(f) {
            new daum.Postcode({
                oncomplete: function (data) {

                    // Kakao에서 제공하는 data는 JSON구조로 주소 조회 결과값을 전달함
                    // 주요 결과값
                    // 주소 : data.address
                    // 우편번호 : data.zonecode
                    let address = data.address; // 주소
                    let zonecode = data.zonecode; // 우편번호
                    f.addr1.value = "(" + zonecode + ")" + address
                }
            }).open();
        }

        //회원가입 정보의 유효성 체크하기
        function doSubmit(f) {

            if (f.userId.value === "") {
                alert("아이디를 입력하세요.");
                f.userId.focus();
                return;
            }

            if (userIdCheck !== "N") {
                alert("아이디 중복 체크 및 중복되지 않은 아이디로 가입 바랍니다.");
                f.userId.focus();
                return;
            }

            if (f.userName.value === "") {
                alert("이름을 입력하세요.");
                f.userName.focus();
                return;
            }

            if (f.password.value === "") {
                alert("비밀번호를 입력하세요.");
                f.password.focus();
                return;
            }

            if (f.password2.value === "") {
                alert("비밀번호확인을 입력하세요.");
                f.password2.focus();
                return;
            }

            if (f.password.value !== f.password2.value) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                f.password.focus();
                return;
            }

            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                f.email.focus();
                return;
            }

            if (f.authNumber.value === "") {
                alert("이메일 인증번호를 입력하세요.");
                f.authNumber.focus();
                return;
            }

            if (f.authNumber.value != emailAuthNumber) {
                alert("이메일 인증번호가 일치하지 않습니다.");
                f.authNumber.focus();
                return;
            }

            if (f.addr1.value === "") {
                alert("주소를 입력하세요.");
                f.addr1.focus();
                return;
            }

            if (f.addr2.value === "") {
                alert("상세주소를 입력하세요.");
                f.addr2.focus();
                return;
            }

            // Ajax 호출해서 회원가입하기
            $.ajax({
                    url: "/user/insertUserInfo",
                    type: "post", // 전송방식은 Posts
                    dataType: "JSON", // 전송 결과는 JSON으로 받기
                    data: $("#f").serialize(), // form 태그 내 input 등 객체를 자동으로 전송할 형태로 변경하기
                    success: function (json) { // /notice/noticeUpdate 호출이 성공했다면..

                        if (json.result === 1) { // 회원가입 성공
                            alert(json.msg); // 메시지 띄우기
                            location.href = "/user/login"; // 로그인 페이지 이동

                        } else { // 회원가입 실패
                            alert(json.msg); // 메시지 띄우기
                            location.href="/index"
                        }

                    }
                }
            )
        }
        function checkUserId() {
            const userId = document.getElementById('userId').value;
            fetch(`/user/checkId?userId=${userId}`)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        alert('ID가 이미 존재합니다.');
                    } else {
                        alert('사용 가능한 ID입니다.');
                    }
                });
        }
    </script>
<%--    <script src="/javascript/popup_2.js"></script>--%>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="static/img/favicon.ico" rel="icon">

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
            /*background-image: url("img/IDOmainBackground.png");*/
            font-family: 'TmoneyRoundWindExtraBold';
        }

        #f {
            /*text-align: center;*/
            /*width: 500px;*/
            /*position: relative;*/
            /*top: 300px;*/
            margin-left: 15%;
            margin-right: 15%;


        }

        .form-control2 {
            margin-top: 0px;
        }

        #signup {

            color: white;
            font-size: 20px;

        }

        #input-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 5px solid #ffffff;
            border-radius: 5%;
            /*padding-left: 1%;*/
            /*padding-right: 1%;*/
            width: 500px;
            padding-top: 3%;
            padding-bottom: 3%;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .signUpHeading {
            text-align: center;
            color: white;
            font-size: 40px;

        }

        /*// #UserAdd2::placeholder*/
        /*//     color: #fa6848;*/

    </style>
</head>
<body>
<%--<h2>회원 가입하기</h2>--%>
<%--<hr/>--%>
<%--<br/>--%>
<%--<form id="f">--%>
<%--    <div class="divTable minimalistBlack">--%>
<%--        <div class="divTableBody">--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">* 아이디--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="text" name="userId" style="width:80%" placeholder="아이디"/>--%>
<%--                    <button id="btnUserId" type="button">아이디 중복체크</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">* 이름--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="text" name="userName" style="width:95%" placeholder="이름"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">* 비밀번호--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="password" name="password" style="width:95%" placeholder="비밀번호"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">* 비밀번호확인--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="password" name="password2" style="width:95%" placeholder="비밀번호 확인"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">* 이메일--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="email" name="email" style="width:40%" placeholder="이메일주소"/>--%>
<%--                    <input type="text" name="authNumber" style="width:30%" placeholder="메일로 발송된 인증번호"/>--%>
<%--                    <button id="btnEmail" type="button">이메일 중복체크</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">* 주소--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="text" name="addr1" style="width:85%" placeholder="주소"/>--%>
<%--                    <button id="btnAddr" type="button">우편번호</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="divTableRow">--%>
<%--                <div class="divTableCell">* 상세 주소--%>
<%--                </div>--%>
<%--                <div class="divTableCell">--%>
<%--                    <input type="text" name="addr2" style="width:95%" placeholder="상세주소"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <button id="btnSend" type="button">회원가입</button>--%>
<%--    </div>--%>
<%--</form>--%>
<div class="container-xxl bg-white p-0">
    <!-- Spinner Start -->
    <!--    <div id="spinner"-->
    <!--         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">-->
    <!--        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">-->
    <!--            <span class="sr-only">Loading...</span>-->
    <!--        </div>-->
    <!--    </div>-->
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
        <a href="IDOindex.html" class="navbar-brand">
            <!--            <h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Kider</h1>-->

            <a href="/main" class="IDOLogo"><img src="/static/img/IDOLogo.png"
                                                 style="width:180px; margin-left: 7%; margin-right: 50%;"
                                                 alt="IDOLOGO"></a>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 내비바 -->
        <div class="collapse navbar-collapse" id="navbarCollapse" style="width: 100%;">
            <div class="navbar-nav mx-auto">
                <!--                <a href="IDOindex.html" class="nav-item nav-link active">홈</a>-->
                <a href="/main" class="nav-item nav-link" id="Home-Button"
                   style="font-family: 'Katuri'; font-size: 25px;">홈</a>
                <a href="about.html" class="nav-item nav-link" id="Class-Button"
                   style="font-family: 'Katuri';font-size: 25px;">수업</a>
                <a href="/user/intro" class="nav-item nav-link" id="Contact-Button"
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
            <a href="/user/login"
               style="background-color: #0d6efd; color:#FFFFFF; font-family: 'Katuri'; font-size: 25px; border-radius:15px; width: 8%; height: 8%; text-align: center; margin-right: 7%;">로그인</a>
        </div>
    </nav>
    <!-- Navbar End -->

    <div class="container-fluid p-0 mb-5">


        <div class="imgTest">
            <img class="img-fluid background" src="/static/img/IDOmainBackground.png" style="z-index: 1;" alt="">
            <div id="input-box" style="z-index: 5;padding-top: 20px;padding-bottom: 20px;">
                <!--    <h2 class="signUpHeading" >회원가입</h2>-->
                <div class="joinForm">
                    <!--    <form id="f">-->
                    <!--        Id<div class="input"><input name="userId" id="userId" type="text"></div><br>-->
                    <!--        PW<div class="input"><input name="userPassword" id="userPassword" type="password"></div><br>-->
                    <!--        Email<div class="input"><input name="userEmail" id="userEmail" type="text"></div><br>-->
                    <!--        주소<div class="input"><input name="userAddress" id="userAddress" type="text"></div><br>-->

                    <!--        <button id="signup" type="button" style="margin-top: 15px; width: 192px; height: 32px; flex-shrink: 0; border-radius: 50px; border: 1px solid #000; background: #54A1FC; box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);">전송</button>-->
                    <!--    </form>-->
                    <form id="f">

                        <div class="login-input">
                            <input name="userId" placeholder="아이디" id="userId" type="text"
                                   style=" width:238px; height: 50px; border-radius:10px; border: none; margin-right: 10px;font-family: 'TmoneyRoundWindExtraBold';">
                            <button type="button" class="mem_ID" id="btnUserId"
                                    style="height: 50px; border-radius:10px; margin-left: 10px;font-family: 'TmoneyRoundWindExtraBold';  background-color: #FFFFFF;color:#0d6efd; border:2px solid #0d6efd;">
                                중복확인
                            </button>

                        </div>

                        <div class="login-input">
                            <input name="userName" placeholder="이름" id="userName" type="text"
                                   style=" width:340px; height: 50px; margin-top: 15px; border-radius:10px; border: none; margin-right: 10px;font-family: 'TmoneyRoundWindExtraBold';">
                        </div>

                        <div class="login-input">
                            <input name="password" placeholder="비밀번호" id="userPassword" type="password"
                                   style="width:340px; height: 50px; margin-top: 15px; border-radius:10px; border: none; font-family: 'TmoneyRoundWindExtraBold';">
                        </div>
                        <div class="login-input">
                            <input name="password2" placeholder="비밀번호 확인" id="userPassword2" type="password"
                                   style="width:340px; height: 50px; margin-top: 15px; border-radius:10px; border: none; margin-top: 20px; font-family: 'TmoneyRoundWindExtraBold';">
                        </div>

                        <div class="login-input" style="display: flex; align-items: center;">
                            <input type="text" name="email" id="user_email" class="align-left" required
                                   placeholder="이메일 입력"
                                   style="width:260px; height: 50px; margin-top: 15px; border-radius:10px; border: none; margin-right: 10px; font-family: 'TmoneyRoundWindExtraBold';">
                            <!--            <span id="middle"><small>@</small></span>-->
                            <!--            <select id="email_address" name="email_address" title="이메일 선택" class="email_address" style="width:100px; height: 50px; border-radius:10px; border: none; margin-left: 10px; margin-right: 10px;">-->
                            <!--                <option value="naver.com">naver.com</option>-->
                            <!--                <option value="gmail.com">gmail.com</option>-->
                            <!--                <option value="daum.net">daum.net</option>-->
                            <!--                <option value="hanmail.net">hanmail.net</option>-->
                            <!--                <option value="nate.com">nate.com</option>-->
                            <!--                <option value="direct">직접입력</option>-->
                            <!--            </select>-->
                            <button type="button" class="mem_email" id="btnEmail"
                                    style="height: 50px; border-radius:10px; margin-top: 15px; margin-left: 8px; width:100px; font-family: 'TmoneyRoundWindExtraBold'; font-size: small; background-color: #FFFFFF;color:#0d6efd; border:2px solid #0d6efd;">
                                이메일<br>인증
                            </button>
                            <input type="hidden" id="mem_email" name="mem_email" value="">
                        </div>

                        <div class="login-input" style="display: flex; align-items: center;">
                            <input type="text" name="authNumber"  placeholder="메일로 발송된 인증번호"
                                   style=" width:340px; height: 50px; margin-top: 15px; border-radius:10px; border: none; margin-right: 10px;font-family: 'TmoneyRoundWindExtraBold';">
                        </div>

                        <div class="adressInput">
                            <!--label for="zipp_btn" class="form-label"> </label-->
                            <input type="text" class="form-control mb-2" id="zipp_code_id" name="addr1"
                                   maxlength="10"
                                   placeholder="주소"
                                   style="width:210px; height: 50px; margin-top: 15px; padding-left: 2px; border-radius:10px; border: none; display: inline;font-family: 'TmoneyRoundWindExtraBold';">
                            <!--                            <button type="button" id="zipp_btn" class="btn btn-primary" onclick="execDaumPostcode()"-->
                            <!--                                   value="우편번호 찾기"-->
                            <!--                                    style="height: 50px; width:100px;border-radius:10px;color:#000000; margin-left: 5px;font-family: 'TmoneyRoundWindExtraBold';  background-color: #FFFFFF"></button><br>-->

                            <button type="button" id="btnAddr" class="mem_addres" onclick="execDaumPostcode()"
                                    style="height: 50px; border-radius:10px; margin-top: 15px; margin-left: 10px;font-family: 'TmoneyRoundWindExtraBold';  background-color: #FFFFFF;color:#0d6efd; border:2px solid #0d6efd;">
                                우편번호 찾기
                            </button>
                            <input type="text" class="form-control" name="addr2" id="UserAdd1" maxlength="40"
                                   placeholder="상세 주소" required
                                   style="width:340px; height: 50px; margin-top: 10px; padding-left: 2px; border-radius:10px; border: none; display: inline;font-family: 'TmoneyRoundWindExtraBold';">
                            <!--                            <input type="text" class="form-control2" name="dt_addr" id="UserAdd2" maxlength="40"-->
                            <!--                                   placeholder="상세 주소를 입력하세요"-->
                            <!--                                   style="width:185px; height: 50px; border-radius:10px; border: none; margin-left: 12px; display: inline;font-family: 'TmoneyRoundWindExtraBold';">-->
                        </div>
                        <button id="btnSend" type="button"
                                style="margin-top: 15px;  width: 260px; height: 55px; flex-shrink: 0; border-radius: 50px; border: none; background: #0d6efd; box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);font-family: 'TmoneyRoundWindExtraBold'; font-size:25px; margin-top: 15px; display: flex; justify-content: center; align-items:center; margin-left:9%;">
                            회원가입
                        </button>

                    </form>
                </div>
            </div>
        </div>
    </div>
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

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
<script src="/static/js/main.js"></script>

</body>
</html>