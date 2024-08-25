<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
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
            width: 1300px;
            height: 500px;
            border: 10px solid white;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }

        video {
            width: 100%;
            height: 100%;
            object-fit: cover;
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

        .words-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            white-space: nowrap;
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
            margin: 0 130px;
            display: inline-block;
            position: relative;
        }

        .selected-word-container {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-family: 'Katuri';
            color: yellow;
            font-size: 4em;
            text-shadow:
                    -3px -3px 2px black,
                    3px -3px 2px black,
                    -3px 3px 2px black,
                    3px 3px 2px black;
            opacity: 1;
        }
    </style>
<%--    <script src="${pageContext.request.contextPath}/static/js/face-api.min.js" defer></script>--%>
    <script src="${pageContext.request.contextPath}/static/js/face-api.min.js" defer></script>


    <script src="${pageContext.request.contextPath}/static/js/face-api-example2.js" defer></script>
</head>
<body>
<div class="container">
    <div class="video-heading">
        <h2 id="mainHeading">몸으로 말해요!</h2>
    </div>
    <div id="wordsContainer" class="words-container">
        <div class="word" id="word1">되었어요</div> <!-- 첫 번째 단어 -->
        <div class="word" id="word2">아우는</div> <!-- 두 번째 단어 -->
        <div class="word" id="word3">부자가</div> <!-- 세 번째 단어 -->
    </div>
    <div class="video-container">
        <video id="video" autoplay muted playsinline></video>
        <div id="countdown" class="countdown">5</div>
        <canvas id="overlay" style="position: absolute; top: 0; left: 0;"></canvas>
    </div>
    <div id="selectedWordContainer" class="selected-word-container"></div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', async () => {
        const video = document.getElementById('video');
        const overlay = document.getElementById('overlay');

        if (typeof faceapi === 'undefined') {
            console.error('faceapi is not defined. Ensure that face-api.min.js is loaded.');
            return;
        }

        async function loadModels() {
            try {
                await faceapi.nets.tinyFaceDetector.loadFromUri('/static/models');
                console.log('Models loaded successfully');
                startVideo();
            } catch (error) {
                console.error('Error loading models:', error);
            }
        }

        function startVideo() {
            navigator.mediaDevices.getUserMedia({ video: {} })
                .then(stream => {
                    video.srcObject = stream;
                    video.onloadeddata = () => {
                        overlay.width = video.videoWidth;
                        overlay.height = video.videoHeight;
                        onPlay();
                    };
                })
                .catch(err => console.error('Error accessing webcam:', err));
        }

        async function onPlay() {
            const displaySize = { width: video.videoWidth, height: video.videoHeight };

            if (!overlay) {
                console.error('Overlay canvas element is null');
                return;
            }

            faceapi.matchDimensions(overlay, displaySize);

            const context = overlay.getContext('2d');
            context.setTransform(-1, 0, 0, 1, overlay.width, 0); // Mirror effect

            setInterval(async () => {
                if (video.paused || video.ended) return;

                const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks();
                const resizedDetections = faceapi.resizeResults(detections, displaySize);

                context.clearRect(0, 0, overlay.width, overlay.height);
                faceapi.draw.drawFaceLandmarks(overlay, resizedDetections);

                context.strokeStyle = 'red';
                context.beginPath();
                context.moveTo(overlay.width / 3, 0);
                context.lineTo(overlay.width / 3, overlay.height);
                context.stroke();

            }, 100);
        }

        loadModels();
    });

    // Countdown and word detection logic
    let currentWordIndex = 0; // 현재 인식해야 할 단어의 인덱스
    let selectedWords = []; // 선택된 단어들을 저장할 배열

    async function startVideo() {
        const video = document.getElementById('video');
        try {
            const stream = await navigator.mediaDevices.getUserMedia({ video: {} });
            video.srcObject = stream;
        } catch (err) {
            console.error('Error accessing webcam: ', err);
        }
    }

    setTimeout(() => {
        document.getElementById('mainHeading').textContent = '문장을 완성해보아요!';

        setTimeout(() => {
            document.getElementById('mainHeading').textContent = '단어 앞으로 이동해요!';
            document.getElementById('wordsContainer').style.opacity = '1';
            document.getElementById('video').style.opacity = '0.5';

            let countdown = 5;
            const countdownInterval = setInterval(() => {
                countdown--;
                document.getElementById('countdown').textContent = countdown;
                if (countdown === 0) {
                    clearInterval(countdownInterval);
                    checkUserPosition();
                }
            }, 1000);
        }, 3500);
    }, 0);

    function getWordRegions() {
        const words = document.getElementsByClassName('word');
        const wordRegions = [];

        for (let i = 0; i < words.length; i++) {
            const wordBox = words[i].getBoundingClientRect();
            const wordCenterX = wordBox.left + wordBox.width / 3;
            wordRegions.push({
                element: words[i],
                centerX: wordCenterX,
                wordText: words[i].textContent
            });
        }

        return wordRegions;
    }

    async function checkUserPosition() {
        const video = document.getElementById('video');
        const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions());

        if (detections.length > 0) {
            const box = detections[0].box;
            const faceCenterX = box.x + box.width / 3;
            const wordRegions = getWordRegions();

            const targetRegion = wordRegions[currentWordIndex];
            const wordRegionCenterX = targetRegion.centerX;

            if (Math.abs(faceCenterX - wordRegionCenterX) < 100) {
                if (!selectedWords.includes(targetRegion.wordText)) {
                    selectedWords.push(targetRegion.wordText);
                    document.getElementById('selectedWordContainer').textContent = `선택된 단어: ${selectedWords.join(', ')}`;
                }
                currentWordIndex++;

                if (currentWordIndex >= wordRegions.length) {
                    currentWordIndex = 0;
                }
            }
        } else {
            document.getElementById('selectedWordContainer').textContent = '얼굴을 인식하지 못했습니다.';
        }

        setTimeout(checkUserPosition, 1000);
    }
</script>
</body>
</html>
