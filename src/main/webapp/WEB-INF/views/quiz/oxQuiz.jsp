<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OX퀴즈</title>

    <script>
        function showCountdown() {
            document.getElementById("mainText").style.display = 'none';
            document.getElementById("instruction").style.display = 'none';
            document.getElementById("countdown").style.display = 'block';

            var count = 3;
            var countdown = setInterval(function() {
                document.getElementById("countdown").textContent = count;
                count--;
                if (count < 0) {
                    clearInterval(countdown);
                    showQuiz();
                }
            }, 1000);
        }

        function showQuiz() {
            document.getElementById("countdown").style.display = 'none';
            document.getElementById("mainText").style.display = 'block';
            document.getElementById("answerContainer").style.display = 'flex';
            document.querySelector('.question-container').style.top = '1%';
            document.getElementById("mainText").style.fontSize = '6em';

            // 2초 후 카메라 화면 켜기
            setTimeout(function() {
                startVideo();
                document.getElementById("video").style.opacity = '0.5';
                document.getElementById("video").style.zIndex = '5';

                // 5초 후 정답 영역 활성화
                setTimeout(function() {
                    document.getElementById("answerContainer").style.pointerEvents = 'auto';
                }, 5000);
            }, 2000);
        }

        function startVideo() {
            navigator.mediaDevices.getUserMedia({ video: {} })
                .then(stream => {
                    const video = document.getElementById('video');
                    video.srcObject = stream;
                    video.play();
                })
                .catch(err => console.error(err));
        }

        window.onload = function() {
            setTimeout(showCountdown, 4000);
        };
    </script>

    <style>
        #answerContainer {
            position: relative;
            width: 800px;
            height: 560px;
            margin: 0 auto;
            display: none;
            pointer-events: none; /* 초기에는 정답 영역 비활성화 */
        }

        #video, #overlay {
            position: absolute;
            top: 0;
            left: -15px;
            width: 100%;
            height: 100%;
        }

        #video {
            transform: scaleX(-1); /* 좌우 반전(거울 효과) */
            opacity: 0; /* 초기에는 투명하게 설정 */
            z-index: 1; /* 초기 z-index */
        }

        #leftBox, #rightBox {
            position: absolute;
            top: 0;
            width: 50%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 3em; /* 폰트 크기 조정 */
            color: rgba(255, 255, 255, 0.7);
            pointer-events: none;
        }

        #leftBox {
            left: 0;
        }

        #rightBox {
            right: 0;
        }

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
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
            flex-direction: column;
            overflow: hidden;
        }

        h2 {
            font-family: 'Katuri';
            color: #0d6efd;
            text-shadow:
                    -2px -2px 0 white,
                    2px -2px 0 white,
                    -2px 2px 0 white,
                    2px 2px 0 white;
            font-size: 8em;
        }

        #instruction {
            font-family: 'Katuri';
            color: #0d6efd;
            text-shadow:
                    -1.5px -1.5px 0 white,
                    1.5px -1.5px 0 white,
                    -1.5px 1.5px 0 white,
                    1.5px 1.5px 0 white;
            font-size: 4.5em;
            margin-top: 20px;
        }

        #countdown {
            font-family: 'TmoneyRoundWindExtraBold';
            font-size: 24em;
            font-weight: bold;
            color: #0d6efd;
            text-shadow:
                    -4px -4px 0 white,
                    4px -4px 0 white,
                    -4px 4px 0 white,
                    4px 4px 0 white;
            display: none;
        }

        .answer-container {
            flex-direction: row;
            justify-content: center;
            align-items: center;
            gap: 80px;
            width: 100%;
            height: 200px;
            position: absolute;
            top: 15%;
        }

        .answer {
            width: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'TmoneyRoundWindExtraBold';
            font-size: 10em; /* 폰트 크기 조정 */
            font-weight: bold;
            color: #000042;
            text-shadow:
                    -4px -4px 0 white,
                    4px -4px 0 white,
                    -4px 4px 0 white,
                    4px 4px 0 white;
        }

        .question-container {
            position: absolute;
            top: 10%;
        }
    </style>
    <script src="${pageContext.request.contextPath}/static/js/face-api.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/static/js/face-api-example.js" defer></script>
</head>
<body>
<div class="question-container">
    <h2 id="mainText">도깨비들은<br>형을 찾아냈나요?</h2>
    <p id="instruction">정답으로 이동하세요!</p>
</div>
<p id="countdown">3</p>
<div class="answer-container" id="answerContainer">
    <video id="video" autoplay muted></video>
    <canvas id="overlay"></canvas>
    <div class="answer">
        <div id="leftBox">O</div>
        <div id="rightBox">X</div>
    </div>
</div>
</body>
</html>
