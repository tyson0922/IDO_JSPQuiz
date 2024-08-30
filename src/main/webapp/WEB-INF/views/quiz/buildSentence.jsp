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
            z-index: 1; /* canvas를 포함하는 video-container의 z-index를 낮게 설정 */
        }

        canvas {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 2; /* canvas의 z-index를 2로 설정 */
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
            opacity: 1; /* 수정: 초기값을 1로 설정하여 보이도록 함 */
            transition: opacity 0.5s ease;
            z-index: 3;
        }

        .word {
            font-family: 'Katuri';
            color: white;
            font-size: 5.5em;
            text-shadow:
                    2px 2px 4px #0d6efd,   /* 추가: 부드러운 테두리 효과를 위해 그림자 값 조정 */
                    -2px -2px 4px #0d6efd,
                    2px -2px 4px #0d6efd,
                    -2px 2px 4px #0d6efd;
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

        #choicesDisplay {
            position: absolute;
            bottom: 20px;
            top:82%;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            padding: 20px;
            text-align: center;
        }

        #choicesDisplay p {
            font-family: 'Katuri';
            color: white;
            font-size: 1.5em;
            margin: 10px 0;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }

    </style>
<%--    <script src="${pageContext.request.contextPath}/static/js/face-api.min.js" defer></script>--%>
    <script src="${pageContext.request.contextPath}/static/js/face-api.min.js" defer></script>


    <script src="${pageContext.request.contextPath}/static/js/face-api-example2.js" defer></script>

    <script>
        document.addEventListener('DOMContentLoaded', async () => {
            


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
            loadModels();
        });

    </script>
</head>
<body>
<div class="container">
    <div class="video-heading">
        <h2 id="mainHeading">문장을 완성해보아요!</h2>
    </div>
    <div id="wordsContainer" class="words-container">
        <div class="word" id="word1">되었어요</div> <!-- 첫 번째 단어 -->
        <div class="word" id="word2">아우는</div> <!-- 두 번째 단어 -->
        <div class="word" id="word3">부자가</div> <!-- 세 번째 단어 -->
    </div>
    <div class="video-container">
        <img id="initialImage" src="/static/img/IDORich.png" alt="Initial Display" style="width: 100%; height: 100%; object-fit: cover;" />
        <video id="video" autoplay muted playsinline style="display: none;"></video>
        <div id="countdown" class="countdown" style="display: none;">5</div>
        <canvas id="overlay" style="position: absolute; top: 0; left: 0; display: none;"></canvas>
    </div>
    <div id="selectedWordContainer" class="selected-word-container"></div>
</div>
<div id="choicesDisplay">
    <p>첫 번째 선택된 단어 : <span id="choice1">___</span></p>
    <p>두 번째 선택된 단어 : <span id="choice2">___</span></p>
    <p>세 번째 선택된 단어 : <span id="choice3">___</span></p>
</div>


</body>
</html>
