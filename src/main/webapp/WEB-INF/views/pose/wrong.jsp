<%--
  Created by IntelliJ IDEA.
  User: data8320-06
  Date: 2024-08-02
  Time: 오후 4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
        body {
            background-image: url("/static/img/IDOmainBackground.png");
            background-color: #1D2025;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden; /* 가로 스크롤바 숨기기 */
        }

        .main {
            width: 90vw;
            text-align: center;
            z-index: 1; /* 텍스트가 이미지 위에 보이도록 */
        }

        .animation {
            position: relative;
            z-index: 1; /* 텍스트가 이미지 위에 보이도록 */
        }

        .two_text {
            display: inline-block;
            color: #fa6848;
            font-size: 7em;
            font-family: 'Katuri';
            padding-top: 0; /* 더 위로 올림 */
            animation: animate 3s infinite;
            text-shadow:
                    -2.5px -2.5px 0 #fff,
                    2.5px -2.5px 0 #fff,
                    -2.5px  2.5px 0 #fff,
                    2.5px  2.5px 0 #fff;
        }

        @keyframes animate {
            0% {
                transform: rotateZ(-3deg);
            }
            50% {
                transform: rotateZ(3deg);
            }
            100% {
                transform: rotateZ(-3deg);
            }
        }

        .sellfish {
            display: flex;
            justify-content: center;
            position: absolute;
            bottom: 20vh; /* 아래 여백 조정 */
            left: 0;
            right: 0;
            z-index: 0; /* 이미지가 텍스트 뒤에 보이도록 */
        }

        .sellfish .pinkshellfish,
        .sellfish .grayshellfish {
            margin: 0 20px; /* 이미지 사이의 간격 조정 */
        }

        .sellfish img {
            width: 120px; /* 이미지 크기 조정 */
            height: auto;
        }

        .navigation {
            position: absolute;
            bottom: 20px; /* 아래 여백 조정 */
            display: flex;
            justify-content: space-between;
            width: 90%; /* 양쪽 여백 조정 */
            margin: 0 auto;
        }

        .navigation .left, .navigation .right {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .replay, .home {
            margin-bottom: 10px; /* 각 링크 사이의 간격 조정 */
        }

        .replay a, .home a {
            text-decoration: none; /* 링크 텍스트의 밑줄 제거 */
            color: #ffffff; /* 링크 텍스트 색상 */
            font-family: 'TmoneyRoundWindExtraBold'; /* 글꼴 변경 */
            font-size: 24px; /* 글꼴 크기 변경 */
            display: flex;
            align-items: center; /* 텍스트와 이미지 아이콘을 수직 정렬 */
        }

        .replay a img, .home a img {
            width: 35px; /* 이미지 아이콘 크기 조정 */
            height: auto;
            margin-right: 10px; /* 이미지 아이콘과 텍스트 사이의 간격 조정 */
        }

        .home a img {
            margin-right: 0; /* 오른쪽 이미지 아이콘의 여백 제거 */
            margin-left: 10px; /* 텍스트와 이미지 사이의 간격 조정 */
        }

        .right{
            padding-top: 40px;
        }

        .main{
            padding-bottom: 10%;
        }
    </style>
</head>
<body>

<div class="main">
    <div class="animation">
        <span class="two_text">틀렸습니다!</span>
    </div>
</div>

<div class="sellfish">
    <div class="pinkshellfish">
        <img src="/static/img/IDOGrayShellfish.png" alt="Pink Shellfish">
    </div>
    <div class="grayshellfish">
        <img src="/static/img/IDOGrayShellfish.png" alt="Gray Shellfish">
    </div>
    <div class="grayshellfish">
        <img src="/static/img/IDOGrayShellfish.png" alt="Gray Shellfish">
    </div>
</div>

<div class="navigation">
    <div class="left">
        <div class="replay">
            <a href="IDOQuizOx.html">
                <img src="/static/img/IDOPlayBack-button.png" alt="다시풀기 아이콘"> 다시풀기
            </a>
        </div>
        <div class="replay">
            <a href="IDOLessonSelection1.html">
                <img src="/static/img/IDOPlayBack-button.png" alt="동화선택 아이콘"> 동화선택
            </a>
        </div>
    </div>
    <div class="right">
        <div class="home">
            <a href="index.html">
                다음퀴즈 <img src="/static/img/IDOPlayNext-button.png" alt="다음퀴즈 아이콘">
            </a>
        </div>
    </div>
</div>

</body>
</html>
