<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>단어 앞으로 이동해요!</title>
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
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
            overflow: hidden;
        }

        .video-heading {
            position: absolute;
            top: 30px;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
            text-align: center;
        }

        h2 {
            font-family: Katuri;
            color: #0d6efd;
            font-size: 4.5em;
            text-shadow:
                    -3px -3px 2px white,
                    3px -3px 2px white,
                    -3px 3px 2px white,
                    3px 3px 2px white;
            transition: opacity 0.5s ease;
        }

        .video-container {
            margin-top: 60px;
            width: 1200px;
            height: 500px;
            border: 10px solid white;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }

        .video-container img,
        .video-container video {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            transition: opacity 0.5s ease; /* 이미지와 비디오 전환을 부드럽게 하기 위한 트랜지션 */
        }

        .video-container video {
            opacity: 0; /* 초기에는 비디오를 숨김 */
            transform: scaleX(-1); /* 거울 모드 적용 */
        }

        .countdown {
            position: absolute;
            bottom: 150px;
            right: 40px;
            font-size: 8em;
            font-family: 'TmoneyRoundWindExtraBold';
            color: white;
            text-shadow:
                    -4px -4px 2px #0d6efd,
                    4px -4px 2px #0d6efd,
                    -4px 4px 2px #0d6efd,
                    4px 4px 2px #0d6efd;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        /* New words around image */
        .words-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            white-space: nowrap; /* Prevents words from wrapping to the next line */
            opacity: 0;
            transition: opacity 0.5s ease;
            z-index: 100;
        }

        .word {
            font-family: 'Katuri';
            color: white;
            font-size: 5.5em;
            text-shadow:
                    -5px -5px  #0d6efd,
                    5px -5px  #0d6efd,
                    -5px 5px  #0d6efd,
                    5px 5px  #0d6efd;
            margin: 0 100px; /* Add spacing between words */
            display: inline-block;
        }


    </style>

    <script src="${pageContext.request.contextPath}/static/js/face-api.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/static/js/face-api-example.js" defer></script>


</head>
<body>
<div class="container">
    <div class="video-heading">
        <h2 id="mainHeading">몸으로 말해요!</h2>
    </div>
    <div id="wordsContainer" class="words-container">
        <div class="word">되었어요</div>
        <div class="word">아우는</div>
        <div class="word">부자가</div>
    </div>
    <div class="video-container">
        <img id="videoImage" src="/static/img/IDOQuizJP.PNG">
        <video id="webcamVideo" autoplay></video>
        <div id="countdown" class="countdown">
            5
        </div>
    </div>
</div>

<script>
    // Get access to the webcam
    function startWebcam() {
        const video = document.getElementById('webcamVideo');

        // Request access to the user's webcam
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function(stream) {
                    video.srcObject = stream;
                    video.play();
                });
        }
    }

    // Start the webcam as soon as the page loads
    startWebcam();

    // Step 1: Show the first message
    setTimeout(() => {
        document.getElementById('mainHeading').textContent = '문장을 완성해보아요!';

        setTimeout(() => {
            // Step 2: Change the message to the next one after 3.5 seconds
            document.getElementById('mainHeading').textContent = '단어 앞으로 이동해요!';
            document.getElementById('wordsContainer').style.opacity = '1'; // Show words
            document.getElementById('videoImage').style.opacity = '0'; // Hide the image
            document.getElementById('webcamVideo').style.opacity = '1'; // Show webcam

            // Continue with the remaining logic
            setTimeout(() => {
                document.getElementById('countdown').style.opacity = '0'; // Hide countdown

                let countdown = 5;
                const countdownInterval = setInterval(() => {
                    countdown--;
                    document.getElementById('countdown').textContent = countdown;
                    if (countdown === 0) {
                        clearInterval(countdownInterval);
                    }
                }, 1000);
            }, 500);

        }, 3500); // Delay between first and second messages
    }, 0);

</script>
</body>
</html>
