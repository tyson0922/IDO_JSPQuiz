<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>IDOLevel2</title>
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
      border-top: 7px dashed #f4f3f3;
      color: rgb(0 0 0 / 0%);
      position: absolute;
      top: 14%;
      left: 10%;
      right: 15%;
      width: 70%;
      height: auto;
      z-index: 2;
    }
    .dashed-line2 {
      border: none;
      border-top: 7px dashed #f4f3f3;
      color: rgb(0 0 0 / 0%);
      position: absolute;
      top: 90%;
      left: 10%;
      right: 15%;
      width: 70%;
      height: auto;
      z-index: 2;
    }
    .depth1 {
      position: absolute;
      top: 14%;
      left: calc(10% + 76%);
      transform: translateX(10px);
      color: #f4f3f3;
      z-index: 3;
    }
    .depth2 {
      position: absolute;
      top: 90%;
      left: calc(10% + 76%);
      transform: translateX(10px);
      color: white;
      z-index: 3;
    }

    /*.selection-heading {*/
    /*    position: absolute;*/
    /*    top: 30%;*/
    /*    left: 8%;*/
    /*    width: 80%;*/
    /*    height: auto;*/
    /*    text-align: center;*/
    /*    z-index: 3;*/
    /*}*/
    .Lesson-selection1 {
      position: absolute;
      width: 132%;
      top: 52%; /* 세로 중앙에 배치 */
      left: 10%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 4; /* 우선순위 높게 설정 */
    }

    .Lesson-selection1 img {
      max-width: 50%; /* 이미지 크기 조정 */
      height: auto; /* 높이 자동 조정 */
    }
    .Lesson-selection1-heading {
      position: absolute;
      top: 75%; /* 세로 중앙에 배치 */
      left: 15%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 4; /* 우선순위 높게 설정 */
    }
    .Lesson-selection1-lock {
      position: absolute;
      top: 52%; /* 세로 중앙에 배치 */
      left: 10%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 5; /* 우선순위 높게 설정 */
    }
    .Lesson-selection1-lock img {
      max-width: 24%; /* 이미지 크기 조정 */
      height: auto; /* 높이 자동 조정 */
      opacity: 80%;
    }
    .Lesson-selection2 {
      position: absolute;
      width: 132%;
      top: 52%; /* 세로 중앙에 배치 */
      left: 37%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 4; /* 우선순위 높게 설정 */
    }

    .Lesson-selection2 img {
      max-width: 50%; /* 이미지 크기 조정 */
      height: auto; /* 높이 자동 조정 */
    }
    .Lesson-selection2-heading {
      position: absolute;
      top: 75%; /* 세로 중앙에 배치 */
      left: 40%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 4; /* 우선순위 높게 설정 */
    }
    .Lesson-selection2-lock {
      position: absolute;
      top: 52%; /* 세로 중앙에 배치 */
      left: 37%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 5; /* 우선순위 높게 설정 */
    }
    .Lesson-selection2-lock img {
      max-width: 34.3%; /* 이미지 크기 조정 */
      height: auto; /* 높이 자동 조정 */
      opacity: 80%;
    }
    .Lesson-selection3 {
      position: absolute;
      width: 130%;
      top: 52%; /* 세로 중앙에 배치 */
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
      top: 75%; /* 세로 중앙에 배치 */
      left: 65.5%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 5; /* 우선순위 높게 설정 */
    }
    .selection-down {
      position: absolute;
      top: 85%; /* 세로 중앙에 배치 */
      left: 44%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 4; /* 우선순위 높게 설정 */
    }
    .Lesson-selection3-lock {
      position: absolute;
      top: 52%; /* 세로 중앙에 배치 */
      left: 64%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 5; /* 우선순위 높게 설정 */
    }
    .Lesson-selection3-lock img {
      max-width: 61.4%; /* 이미지 크기 조정 */
      height: auto; /* 높이 자동 조정 */
      opacity: 80%;
    }
    .selection-down img {
      max-width: 17%; /* 이미지 크기 조정 */
      height: auto; /* 높이 자동 조정 */
    }
    .selection-up {
      position: absolute;
      top: 25%; /* 세로 중앙에 배치 */
      left: 44%; /* 좌측에 배치 */
      transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
      z-index: 4; /* 우선순위 높게 설정 */
    }
    .selection-up img {
      max-width: 14%; /* 이미지 크기 조정 */
      height: auto; /* 높이 자동 조정 */
    }

    .IDOLogo {
      position: absolute;
      top: 2%;
      left: 18.5%;
      z-index: 4;
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


  <!--    &lt;!&ndash; Navbar Start &ndash;&gt;-->
  <!--    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">-->
  <!--        <a href="index.html" class="navbar-brand">-->
  <!--            &lt;!&ndash;            <h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Kider</h1>&ndash;&gt;-->

  <!--            <a href="index.html" class="IDOLogo"><img src="img/IDOLogo.png" style="width:180px; margin-left: 7%; margin-right: 50%;" alt="IDOLOGO"></a>-->
  <!--&lt;!&ndash;        </a>&ndash;&gt;-->
  <!--&lt;!&ndash;        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">&ndash;&gt;-->
  <!--&lt;!&ndash;            <span class="navbar-toggler-icon"></span>&ndash;&gt;-->
  <!--&lt;!&ndash;        </button>&ndash;&gt;-->

  <!--&lt;!&ndash;        &lt;!&ndash; 내비바 &ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;        <div class="collapse navbar-collapse" id="navbarCollapse">&ndash;&gt;-->
  <!--&lt;!&ndash;            <div class="navbar-nav mx-auto">&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                <a href="index.html" class="nav-item nav-link active">홈</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                <a href="index.html" class="nav-item nav-link" id="Home-Button" style="font-family: 'Katuri'; font-size: 25px;">홈</a>&ndash;&gt;-->
  <!--&lt;!&ndash;                <a href="about.html" class="nav-item nav-link" id="Class-Button" style="font-family: 'Katuri';font-size: 25px;" >수업</a>&ndash;&gt;-->
  <!--&lt;!&ndash;                <a href="classes.html" class="nav-item nav-link" id="Contact-Button" style="font-family: 'Katuri';font-size: 25px;">소개</a>&ndash;&gt;-->


  <!--&lt;!&ndash;                &lt;!&ndash;                <div class="nav-item dropdown">&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                    <div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                        <a href="facility.html" class="dropdown-item">School Facilities</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                        <a href="team.html" class="dropdown-item">Popular Teachers</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                        <a href="call-to-action.html" class="dropdown-item">Become A Teachers</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                        <a href="appointment.html" class="dropdown-item">Make Appointment</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                        <a href="404.html" class="dropdown-item">404 Error</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                    </div>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                </div>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;                &lt;!&ndash;                <a href="contact.html" class="nav-item nav-link">Contact Us</a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;            </div>&ndash;&gt;-->
  <!--&lt;!&ndash;            &lt;!&ndash;            <a href="" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">Join Us<i class="fa fa-arrow-right ms-3"></i></a>&ndash;&gt;&ndash;&gt;-->
  <!--&lt;!&ndash;            <a href="IDOLogin.html" style="background-color: #0d6efd; color:#FFFFFF; font-family: 'Katuri'; font-size: 25px; border-radius:15px; width: 8%; height: 8%; text-align: center; margin-right: 7%;" >로그인</a>&ndash;&gt;-->
  <!--&lt;!&ndash;        </div>&ndash;&gt;-->


  <!--    </nav>-->
  <!--    &lt;!&ndash; Navbar End &ndash;&gt;-->


  <!-- Carousel Start -->
  <!-- 메인 본문 -->

  <div class="container-fluid p-0 mb-5">

    <a href="/user/loginIndex" class="IDOLogo"><img src="/static/img/IDOLogo.png" style="width:180px; margin-left: 7%; margin-right: 50%;" alt="IDOLOGO"></a>
    <div class="imgTest">
      <div class="dashed-border1">
        <hr class="dashed-line1">
        <a class="depth1" style="font-family: 'Katuri';font-size: 25px;">100m</a>
      </div>
      <div class="dashed-border2">
        <hr class="dashed-line2">
        <a class="depth2" style="font-family: 'Katuri';font-size: 25px;">200m</a>
      </div>
      <div class="Lesson-selection1">
        <img src="/static/img/IDOselection2-1.png" alt="">
      </div>
      <div class="Lesson-selection1-heading">
        <a style="font-family: 'Katuri'; font-size: 30px; color:white">도깨비 감투</a>
      </div>
      <div class="Lesson-selection1-lock">
        <!--                <img src="img/IDOselectionLock.png" alt="">-->
      </div>
      <div class="Lesson-selection2">
        <img src="/static/img/IDOselection2-2.png" alt="">
      </div>
      <div class="Lesson-selection2-heading">
        <a style="font-family: 'Katuri'; font-size: 30px; color:white">소가 된 게으름뱅이</a>
      </div>
      <div class="Lesson-selection2-lock">
        <!--                <img src="img/IDOselectionLock.png" alt="">-->
      </div>
      <div class="Lesson-selection3">
        <a href="quiz/IDOVideo">
          <img src="/static/img/IDOselection2-3.png" alt="">
        </a>
      </div>
      <div class="Lesson-selection3-heading">
        <a style="font-family: 'Katuri'; font-size: 30px; color:white">팥죽 할머니와 호랑이</a>
      </div>
      <div class="Lesson-selection3-lock">
        <!--                <img src="img/IDOselectionLock.png" alt="">-->
      </div>
      <div class="selection-down">
        <a href="IDOLessonSelection3">
          <img src="/static/img/IDOselectionDown.png" alt="">
        </a>
      </div>
      <div class="selection-up">
        <a href="IDOLessonSelection1">
          <img src="/static/img/IDOselectionUp.png" alt="">
        </a>
      </div>
      <img class="img-fluid background" src="/static/img/IDOselection2-Background.png" alt="">
    </div>

    <!--        <div class="selection-heading">-->
    <!--            <a style="font-family: 'Katuri'; font-size: 50px; color:black">동화를 선택하세요</a>-->
    <!--        </div>-->







    <!--        <div class="imgTest">-->
    <!--        <img class="img-fluid" src="img/IDOmainBackground.png" alt="" style="position:relative; z-index: 1;">-->

    <!--        <img class="test" src="img/submarine.png" style="position: absolute; z-index: 2;">-->

    <!--        </div>-->

    <!--        <div class="owl-carousel header-carousel position-relative">-->
    <!--            <div class="owl-carousel-item position-relative">-->
    <!--                <img class="img-fluid" src="img/IDOmainBackground.png" alt="">-->
    <!--                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(0, 0, 0, .2);">-->
    <!--                    <div class="container">-->
    <!--                        <div class="row justify-content-start">-->
    <!--                            <div class="col-10 col-lg-8">-->
    <!--                                <h1 class="display-2 text-white animated slideInDown mb-4">The Best Kindergarten School For Your Child</h1>-->
    <!--                                <p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>-->
    <!--                                <a href="" class="btn btn-primary rounded-pill py-sm-3 px-sm-5 me-3 animated slideInLeft">Learn More</a>-->
    <!--                                <a href="" class="btn btn-dark rounded-pill py-sm-3 px-sm-5 animated slideInRight">Our Classes</a>-->
    <!--                            </div>-->
    <!--                        </div>-->
    <!--                    </div>-->
    <!--                </div>-->
    <!--            </div>-->

    <!--            <div class="owl-carousel-item position-relative">-->
    <!--                <img class="img-fluid" src="img/carousel-2.jpg" alt="">-->
    <!--                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(0, 0, 0, .2);">-->
    <!--                    <div class="container">-->
    <!--                        <div class="row justify-content-start">-->
    <!--                            <div class="col-10 col-lg-8">-->
    <!--                                <h1 class="display-2 text-white animated slideInDown mb-4">Make A Brighter Future For Your Child</h1>-->
    <!--                                <p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>-->
    <!--                                <a href="" class="btn btn-primary rounded-pill py-sm-3 px-sm-5 me-3 animated slideInLeft">Learn More</a>-->
    <!--                                <a href="" class="btn btn-dark rounded-pill py-sm-3 px-sm-5 animated slideInRight">Our Classes</a>-->
    <!--                            </div>-->
    <!--                        </div>-->
    <!--                    </div>-->
    <!--                </div>-->
    <!--            </div>-->



  </div>


</div>

<!-- Carousel End -->


<!--        &lt;!&ndash; Facilities Start &ndash;&gt;-->
<!--        <div class="container-xxl py-5">-->
<!--            <div class="container">-->
<!--                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">-->
<!--                    <h1 class="mb-3">School Facilities</h1>-->
<!--                    <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>-->
<!--                </div>-->
<!--                <div class="row g-4">-->
<!--                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">-->
<!--                        <div class="facility-item">-->
<!--                            <div class="facility-icon bg-primary">-->
<!--                                <span class="bg-primary"></span>-->
<!--                                <i class="fa fa-bus-alt fa-3x text-primary"></i>-->
<!--                                <span class="bg-primary"></span>-->
<!--                            </div>-->
<!--                            <div class="facility-text bg-primary">-->
<!--                                <h3 class="text-primary mb-3">School Bus</h3>-->
<!--                                <p class="mb-0">Eirmod sed ipsum dolor sit rebum magna erat lorem kasd vero ipsum sit</p>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">-->
<!--                        <div class="facility-item">-->
<!--                            <div class="facility-icon bg-success">-->
<!--                                <span class="bg-success"></span>-->
<!--                                <i class="fa fa-futbol fa-3x text-success"></i>-->
<!--                                <span class="bg-success"></span>-->
<!--                            </div>-->
<!--                            <div class="facility-text bg-success">-->
<!--                                <h3 class="text-success mb-3">Playground</h3>-->
<!--                                <p class="mb-0">Eirmod sed ipsum dolor sit rebum magna erat lorem kasd vero ipsum sit</p>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">-->
<!--                        <div class="facility-item">-->
<!--                            <div class="facility-icon bg-warning">-->
<!--                                <span class="bg-warning"></span>-->
<!--                                <i class="fa fa-home fa-3x text-warning"></i>-->
<!--                                <span class="bg-warning"></span>-->
<!--                            </div>-->
<!--                            <div class="facility-text bg-warning">-->
<!--                                <h3 class="text-warning mb-3">Healthy Canteen</h3>-->
<!--                                <p class="mb-0">Eirmod sed ipsum dolor sit rebum magna erat lorem kasd vero ipsum sit</p>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">-->
<!--                        <div class="facility-item">-->
<!--                            <div class="facility-icon bg-info">-->
<!--                                <span class="bg-info"></span>-->
<!--                                <i class="fa fa-chalkboard-teacher fa-3x text-info"></i>-->
<!--                                <span class="bg-info"></span>-->
<!--                            </div>-->
<!--                            <div class="facility-text bg-info">-->
<!--                                <h3 class="text-info mb-3">Positive Learning</h3>-->
<!--                                <p class="mb-0">Eirmod sed ipsum dolor sit rebum magna erat lorem kasd vero ipsum sit</p>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--        &lt;!&ndash; Facilities End &ndash;&gt;-->


<!--        &lt;!&ndash; About Start &ndash;&gt;-->
<!--        <div class="container-xxl py-5">-->
<!--            <div class="container">-->
<!--                <div class="row g-5 align-items-center">-->
<!--                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">-->
<!--                        <h1 class="mb-4">Learn More About Our Work And Our Cultural Activities</h1>-->
<!--                        <p>Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>-->
<!--                        <p class="mb-4">Stet no et lorem dolor et diam, amet duo ut dolore vero eos. No stet est diam rebum amet diam ipsum. Clita clita labore, dolor duo nonumy clita sit at, sed sit sanctus dolor eos, ipsum labore duo duo sit no sea diam. Et dolor et kasd ea. Eirmod diam at dolor est vero nonumy magna.</p>-->
<!--                        <div class="row g-4 align-items-center">-->
<!--                            <div class="col-sm-6">-->
<!--                                <a class="btn btn-primary rounded-pill py-3 px-5" href="">Read More</a>-->
<!--                            </div>-->
<!--                            <div class="col-sm-6">-->
<!--                                <div class="d-flex align-items-center">-->
<!--                                    <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 45px; height: 45px;">-->
<!--                                    <div class="ms-3">-->
<!--                                        <h6 class="text-primary mb-1">Jhon Doe</h6>-->
<!--                                        <small>CEO & Founder</small>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-6 about-img wow fadeInUp" data-wow-delay="0.5s">-->
<!--                        <div class="row">-->
<!--                            <div class="col-12 text-center">-->
<!--                                <img class="img-fluid w-75 rounded-circle bg-light p-3" src="img/about-1.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="col-6 text-start" style="margin-top: -150px;">-->
<!--                                <img class="img-fluid w-100 rounded-circle bg-light p-3" src="img/about-2.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="col-6 text-end" style="margin-top: -150px;">-->
<!--                                <img class="img-fluid w-100 rounded-circle bg-light p-3" src="img/about-3.jpg" alt="">-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--        &lt;!&ndash; About End &ndash;&gt;-->


<!--        &lt;!&ndash; Call To Action Start &ndash;&gt;-->
<!--        <div class="container-xxl py-5">-->
<!--            <div class="container">-->
<!--                <div class="bg-light rounded">-->
<!--                    <div class="row g-0">-->
<!--                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s" style="min-height: 400px;">-->
<!--                            <div class="position-relative h-100">-->
<!--                                <img class="position-absolute w-100 h-100 rounded" src="img/call-to-action.jpg" style="object-fit: cover;">-->
<!--                            </div>-->
<!--                        </div>-->
<!--                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">-->
<!--                            <div class="h-100 d-flex flex-column justify-content-center p-5">-->
<!--                                <h1 class="mb-4">Become A Teacher</h1>-->
<!--                                <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos.-->
<!--                                    Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet-->
<!--                                </p>-->
<!--                                <a class="btn btn-primary py-3 px-5" href="">Get Started Now<i class="fa fa-arrow-right ms-2"></i></a>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--        &lt;!&ndash; Call To Action End &ndash;&gt;-->


<!--        &lt;!&ndash; Classes Start &ndash;&gt;-->
<!--        <div class="container-xxl py-5">-->
<!--            <div class="container">-->
<!--                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">-->
<!--                    <h1 class="mb-3">School Classes</h1>-->
<!--                    <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>-->
<!--                </div>-->
<!--                <div class="row g-4">-->
<!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">-->
<!--                        <div class="classes-item">-->
<!--                            <div class="bg-light rounded-circle w-75 mx-auto p-3">-->
<!--                                <img class="img-fluid rounded-circle" src="img/classes-1.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="bg-light rounded p-4 pt-5 mt-n5">-->
<!--                                <a class="d-block text-center h3 mt-3 mb-4" href="">Art & Drawing</a>-->
<!--                                <div class="d-flex align-items-center justify-content-between mb-4">-->
<!--                                    <div class="d-flex align-items-center">-->
<!--                                        <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 45px; height: 45px;">-->
<!--                                        <div class="ms-3">-->
<!--                                            <h6 class="text-primary mb-1">Jhon Doe</h6>-->
<!--                                            <small>Teacher</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <span class="bg-primary text-white rounded-pill py-2 px-3" href="">$99</span>-->
<!--                                </div>-->
<!--                                <div class="row g-1">-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-primary pt-2">-->
<!--                                            <h6 class="text-primary mb-1">Age:</h6>-->
<!--                                            <small>3-5 Years</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-success pt-2">-->
<!--                                            <h6 class="text-success mb-1">Time:</h6>-->
<!--                                            <small>9-10 AM</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-warning pt-2">-->
<!--                                            <h6 class="text-warning mb-1">Capacity:</h6>-->
<!--                                            <small>30 Kids</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">-->
<!--                        <div class="classes-item">-->
<!--                            <div class="bg-light rounded-circle w-75 mx-auto p-3">-->
<!--                                <img class="img-fluid rounded-circle" src="img/classes-2.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="bg-light rounded p-4 pt-5 mt-n5">-->
<!--                                <a class="d-block text-center h3 mt-3 mb-4" href="">Color Management</a>-->
<!--                                <div class="d-flex align-items-center justify-content-between mb-4">-->
<!--                                    <div class="d-flex align-items-center">-->
<!--                                        <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 45px; height: 45px;">-->
<!--                                        <div class="ms-3">-->
<!--                                            <h6 class="text-primary mb-1">Jhon Doe</h6>-->
<!--                                            <small>Teacher</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <span class="bg-primary text-white rounded-pill py-2 px-3" href="">$99</span>-->
<!--                                </div>-->
<!--                                <div class="row g-1">-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-primary pt-2">-->
<!--                                            <h6 class="text-primary mb-1">Age:</h6>-->
<!--                                            <small>3-5 Years</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-success pt-2">-->
<!--                                            <h6 class="text-success mb-1">Time:</h6>-->
<!--                                            <small>9-10 AM</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-warning pt-2">-->
<!--                                            <h6 class="text-warning mb-1">Capacity:</h6>-->
<!--                                            <small>30 Kids</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">-->
<!--                        <div class="classes-item">-->
<!--                            <div class="bg-light rounded-circle w-75 mx-auto p-3">-->
<!--                                <img class="img-fluid rounded-circle" src="img/classes-3.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="bg-light rounded p-4 pt-5 mt-n5">-->
<!--                                <a class="d-block text-center h3 mt-3 mb-4" href="">Athletic & Dance</a>-->
<!--                                <div class="d-flex align-items-center justify-content-between mb-4">-->
<!--                                    <div class="d-flex align-items-center">-->
<!--                                        <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 45px; height: 45px;">-->
<!--                                        <div class="ms-3">-->
<!--                                            <h6 class="text-primary mb-1">Jhon Doe</h6>-->
<!--                                            <small>Teacher</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <span class="bg-primary text-white rounded-pill py-2 px-3" href="">$99</span>-->
<!--                                </div>-->
<!--                                <div class="row g-1">-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-primary pt-2">-->
<!--                                            <h6 class="text-primary mb-1">Age:</h6>-->
<!--                                            <small>3-5 Years</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-success pt-2">-->
<!--                                            <h6 class="text-success mb-1">Time:</h6>-->
<!--                                            <small>9-10 AM</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-warning pt-2">-->
<!--                                            <h6 class="text-warning mb-1">Capacity:</h6>-->
<!--                                            <small>30 Kids</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">-->
<!--                        <div class="classes-item">-->
<!--                            <div class="bg-light rounded-circle w-75 mx-auto p-3">-->
<!--                                <img class="img-fluid rounded-circle" src="img/classes-4.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="bg-light rounded p-4 pt-5 mt-n5">-->
<!--                                <a class="d-block text-center h3 mt-3 mb-4" href="">Language & Speaking</a>-->
<!--                                <div class="d-flex align-items-center justify-content-between mb-4">-->
<!--                                    <div class="d-flex align-items-center">-->
<!--                                        <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 45px; height: 45px;">-->
<!--                                        <div class="ms-3">-->
<!--                                            <h6 class="text-primary mb-1">Jhon Doe</h6>-->
<!--                                            <small>Teacher</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <span class="bg-primary text-white rounded-pill py-2 px-3" href="">$99</span>-->
<!--                                </div>-->
<!--                                <div class="row g-1">-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-primary pt-2">-->
<!--                                            <h6 class="text-primary mb-1">Age:</h6>-->
<!--                                            <small>3-5 Years</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-success pt-2">-->
<!--                                            <h6 class="text-success mb-1">Time:</h6>-->
<!--                                            <small>9-10 AM</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-warning pt-2">-->
<!--                                            <h6 class="text-warning mb-1">Capacity:</h6>-->
<!--                                            <small>30 Kids</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">-->
<!--                        <div class="classes-item">-->
<!--                            <div class="bg-light rounded-circle w-75 mx-auto p-3">-->
<!--                                <img class="img-fluid rounded-circle" src="img/classes-5.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="bg-light rounded p-4 pt-5 mt-n5">-->
<!--                                <a class="d-block text-center h3 mt-3 mb-4" href="">Religion & History</a>-->
<!--                                <div class="d-flex align-items-center justify-content-between mb-4">-->
<!--                                    <div class="d-flex align-items-center">-->
<!--                                        <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 45px; height: 45px;">-->
<!--                                        <div class="ms-3">-->
<!--                                            <h6 class="text-primary mb-1">Jhon Doe</h6>-->
<!--                                            <small>Teacher</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <span class="bg-primary text-white rounded-pill py-2 px-3" href="">$99</span>-->
<!--                                </div>-->
<!--                                <div class="row g-1">-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-primary pt-2">-->
<!--                                            <h6 class="text-primary mb-1">Age:</h6>-->
<!--                                            <small>3-5 Years</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-success pt-2">-->
<!--                                            <h6 class="text-success mb-1">Time:</h6>-->
<!--                                            <small>9-10 AM</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-warning pt-2">-->
<!--                                            <h6 class="text-warning mb-1">Capacity:</h6>-->
<!--                                            <small>30 Kids</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">-->
<!--                        <div class="classes-item">-->
<!--                            <div class="bg-light rounded-circle w-75 mx-auto p-3">-->
<!--                                <img class="img-fluid rounded-circle" src="img/classes-6.jpg" alt="">-->
<!--                            </div>-->
<!--                            <div class="bg-light rounded p-4 pt-5 mt-n5">-->
<!--                                <a class="d-block text-center h3 mt-3 mb-4" href="">General Knowledge</a>-->
<!--                                <div class="d-flex align-items-center justify-content-between mb-4">-->
<!--                                    <div class="d-flex align-items-center">-->
<!--                                        <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 45px; height: 45px;">-->
<!--                                        <div class="ms-3">-->
<!--                                            <h6 class="text-primary mb-1">Jhon Doe</h6>-->
<!--                                            <small>Teacher</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <span class="bg-primary text-white rounded-pill py-2 px-3" href="">$99</span>-->
<!--                                </div>-->
<!--                                <div class="row g-1">-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-primary pt-2">-->
<!--                                            <h6 class="text-primary mb-1">Age:</h6>-->
<!--                                            <small>3-5 Years</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-success pt-2">-->
<!--                                            <h6 class="text-success mb-1">Time:</h6>-->
<!--                                            <small>9-10 AM</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-4">-->
<!--                                        <div class="border-top border-3 border-warning pt-2">-->
<!--                                            <h6 class="text-warning mb-1">Capacity:</h6>-->
<!--                                            <small>30 Kids</small>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--        &lt;!&ndash; Classes End &ndash;&gt;-->


<!--    &lt;!&ndash; Appointment Start &ndash;&gt;-->
<!--    <div class="container-xxl py-5">-->
<!--        <div class="container">-->
<!--            <div class="bg-light rounded">-->
<!--                <div class="row g-0">-->
<!--                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">-->
<!--                        <div class="h-100 d-flex flex-column justify-content-center p-5">-->
<!--                            <h1 class="mb-4">Make Appointment</h1>-->
<!--                            <form>-->
<!--                                <div class="row g-3">-->
<!--                                    <div class="col-sm-6">-->
<!--                                        <div class="form-floating">-->
<!--                                            <input type="text" class="form-control border-0" id="gname" placeholder="Gurdian Name">-->
<!--                                            <label for="gname">Gurdian Name</label>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-sm-6">-->
<!--                                        <div class="form-floating">-->
<!--                                            <input type="email" class="form-control border-0" id="gmail" placeholder="Gurdian Email">-->
<!--                                            <label for="gmail">Gurdian Email</label>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-sm-6">-->
<!--                                        <div class="form-floating">-->
<!--                                            <input type="text" class="form-control border-0" id="cname" placeholder="Child Name">-->
<!--                                            <label for="cname">Child Name</label>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-sm-6">-->
<!--                                        <div class="form-floating">-->
<!--                                            <input type="text" class="form-control border-0" id="cage" placeholder="Child Age">-->
<!--                                            <label for="cage">Child Age</label>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-12">-->
<!--                                        <div class="form-floating">-->
<!--                                            <textarea class="form-control border-0" placeholder="Leave a message here" id="message" style="height: 100px"></textarea>-->
<!--                                            <label for="message">Message</label>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-12">-->
<!--                                        <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </form>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s" style="min-height: 400px;">-->
<!--                        <div class="position-relative h-100">-->
<!--                            <img class="position-absolute w-100 h-100 rounded" src="img/appointment.jpg" style="object-fit: cover;">-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--    </div>-->
<!--    &lt;!&ndash; Appointment End &ndash;&gt;-->


<!--    &lt;!&ndash; Team Start &ndash;&gt;-->
<!--    <div class="container-xxl py-5">-->
<!--        <div class="container">-->
<!--            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">-->
<!--                <h1 class="mb-3">Popular Teachers</h1>-->
<!--                <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit-->
<!--                    eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>-->
<!--            </div>-->
<!--            <div class="row g-4">-->
<!--                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">-->
<!--                    <div class="team-item position-relative">-->
<!--                        <img class="img-fluid rounded-circle w-75" src="img/team-1.jpg" alt="">-->
<!--                        <div class="team-text">-->
<!--                            <h3>Full Name</h3>-->
<!--                            <p>Designation</p>-->
<!--                            <div class="d-flex align-items-center">-->
<!--                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>-->
<!--                                <a class="btn btn-square btn-primary  mx-1" href=""><i class="fab fa-twitter"></i></a>-->
<!--                                <a class="btn btn-square btn-primary  mx-1" href=""><i class="fab fa-instagram"></i></a>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">-->
<!--                    <div class="team-item position-relative">-->
<!--                        <img class="img-fluid rounded-circle w-75" src="img/team-2.jpg" alt="">-->
<!--                        <div class="team-text">-->
<!--                            <h3>Full Name</h3>-->
<!--                            <p>Designation</p>-->
<!--                            <div class="d-flex align-items-center">-->
<!--                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>-->
<!--                                <a class="btn btn-square btn-primary  mx-1" href=""><i class="fab fa-twitter"></i></a>-->
<!--                                <a class="btn btn-square btn-primary  mx-1" href=""><i class="fab fa-instagram"></i></a>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">-->
<!--                    <div class="team-item position-relative">-->
<!--                        <img class="img-fluid rounded-circle w-75" src="img/team-3.jpg" alt="">-->
<!--                        <div class="team-text">-->
<!--                            <h3>Full Name</h3>-->
<!--                            <p>Designation</p>-->
<!--                            <div class="d-flex align-items-center">-->
<!--                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>-->
<!--                                <a class="btn btn-square btn-primary  mx-1" href=""><i class="fab fa-twitter"></i></a>-->
<!--                                <a class="btn btn-square btn-primary  mx-1" href=""><i class="fab fa-instagram"></i></a>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--    </div>-->
<!--    &lt;!&ndash; Team End &ndash;&gt;-->


<!--    &lt;!&ndash; Testimonial Start &ndash;&gt;-->
<!--    <div class="container-xxl py-5">-->
<!--        <div class="container">-->
<!--            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">-->
<!--                <h1 class="mb-3">Our Clients Say!</h1>-->
<!--                <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>-->
<!--            </div>-->
<!--            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">-->
<!--                <div class="testimonial-item bg-light rounded p-5">-->
<!--                    <p class="fs-5">Tempor stet labore dolor clita stet diam amet ipsum dolor duo ipsum rebum stet dolor amet diam stet. Est stet ea lorem amet est kasd kasd erat eos</p>-->
<!--                    <div class="d-flex align-items-center bg-white me-n5" style="border-radius: 50px 0 0 50px;">-->
<!--                        <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-1.jpg" style="width: 90px; height: 90px;">-->
<!--                        <div class="ps-3">-->
<!--                            <h3 class="mb-1">Client Name</h3>-->
<!--                            <span>Profession</span>-->
<!--                        </div>-->
<!--                        <i class="fa fa-quote-right fa-3x text-primary ms-auto d-none d-sm-flex"></i>-->
<!--                    </div>-->
<!--                </div>-->
<!--                <div class="testimonial-item bg-light rounded p-5">-->
<!--                    <p class="fs-5">Tempor stet labore dolor clita stet diam amet ipsum dolor duo ipsum rebum stet dolor amet diam stet. Est stet ea lorem amet est kasd kasd erat eos</p>-->
<!--                    <div class="d-flex align-items-center bg-white me-n5" style="border-radius: 50px 0 0 50px;">-->
<!--                        <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-2.jpg" style="width: 90px; height: 90px;">-->
<!--                        <div class="ps-3">-->
<!--                            <h3 class="mb-1">Client Name</h3>-->
<!--                            <span>Profession</span>-->
<!--                        </div>-->
<!--                        <i class="fa fa-quote-right fa-3x text-primary ms-auto d-none d-sm-flex"></i>-->
<!--                    </div>-->
<!--                </div>-->
<!--                <div class="testimonial-item bg-light rounded p-5">-->
<!--                    <p class="fs-5">Tempor stet labore dolor clita stet diam amet ipsum dolor duo ipsum rebum stet dolor amet diam stet. Est stet ea lorem amet est kasd kasd erat eos</p>-->
<!--                    <div class="d-flex align-items-center bg-white me-n5" style="border-radius: 50px 0 0 50px;">-->
<!--                        <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-3.jpg" style="width: 90px; height: 90px;">-->
<!--                        <div class="ps-3">-->
<!--                            <h3 class="mb-1">Client Name</h3>-->
<!--                            <span>Profession</span>-->
<!--                        </div>-->
<!--                        <i class="fa fa-quote-right fa-3x text-primary ms-auto d-none d-sm-flex"></i>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--    </div>-->
<!--    &lt;!&ndash; Testimonial End &ndash;&gt;-->


<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s" style="width:100%;">
  <!--        <div class="container py-5">-->


  <!--            <div class="row g-5">-->
  <!--                <div class="col-lg-3 col-md-6">-->
  <!--                    <h3 class="text-white mb-4">Get In Touch</h3>-->
  <!--                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>-->
  <!--                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>-->
  <!--                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>-->
  <!--                    <div class="d-flex pt-2">-->
  <!--                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>-->
  <!--                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>-->
  <!--                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>-->
  <!--                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>-->
  <!--                    </div>-->
  <!--                </div>-->
  <!--                <div class="col-lg-3 col-md-6">-->
  <!--                    <h3 class="text-white mb-4">Quick Links</h3>-->
  <!--                    <a class="btn btn-link text-white-50" href="">About Us</a>-->
  <!--                    <a class="btn btn-link text-white-50" href="">Contact Us</a>-->
  <!--                    <a class="btn btn-link text-white-50" href="">Our Services</a>-->
  <!--                    <a class="btn btn-link text-white-50" href="">Privacy Policy</a>-->
  <!--                    <a class="btn btn-link text-white-50" href="">Terms & Condition</a>-->
  <!--                </div>-->
  <!--                <div class="col-lg-3 col-md-6">-->
  <!--                    <h3 class="text-white mb-4">Photo Gallery</h3>-->
  <!--                    <div class="row g-2 pt-2">-->
  <!--                        <div class="col-4">-->
  <!--                            <img class="img-fluid rounded bg-light p-1" src="img/classes-1.jpg" alt="">-->
  <!--                        </div>-->
  <!--                        <div class="col-4">-->
  <!--                            <img class="img-fluid rounded bg-light p-1" src="img/classes-2.jpg" alt="">-->
  <!--                        </div>-->
  <!--                        <div class="col-4">-->
  <!--                            <img class="img-fluid rounded bg-light p-1" src="img/classes-3.jpg" alt="">-->
  <!--                        </div>-->
  <!--                        <div class="col-4">-->
  <!--                            <img class="img-fluid rounded bg-light p-1" src="img/classes-4.jpg" alt="">-->
  <!--                        </div>-->
  <!--                        <div class="col-4">-->
  <!--                            <img class="img-fluid rounded bg-light p-1" src="img/classes-5.jpg" alt="">-->
  <!--                        </div>-->
  <!--                        <div class="col-4">-->
  <!--                            <img class="img-fluid rounded bg-light p-1" src="img/classes-6.jpg" alt="">-->
  <!--                        </div>-->
  <!--                    </div>-->
  <!--                </div>-->
  <!--                <div class="col-lg-3 col-md-6">-->
  <!--                    <h3 class="text-white mb-4">Newsletter</h3>-->
  <!--                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>-->
  <!--                    <div class="position-relative mx-auto" style="max-width: 400px;">-->
  <!--                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">-->
  <!--                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>-->
  <!--                    </div>-->
  <!--                </div>-->
  <!--            </div>-->


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