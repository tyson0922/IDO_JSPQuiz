<%--
  Created by IntelliJ IDEA.
  User: data8320-06
  Date: 2024-08-16
  Time: 오후 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kopo.poly.dto.object.QuizDTO" %>
<%
  QuizDTO rDTO = (QuizDTO) request.getAttribute("quiz");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    h2 {
      position: absolute;
      top: 30px;
      left: 50%;
      transform: translateX(-50%);
      font-family: Katuri;
      color: #0d6efd;
      font-size: 4.5em;
      text-shadow:
              -3px -3px 2px white,
              3px -3px 2px white,
              -3px 3px 2px white,
              3px 3px 2px white; /* 텍스트 그림자에 약간의 블러를 추가하여 부드럽게 처리 */
    }

    .video-container {
      margin-top: 60px;
      width: 800px;
      height: 500px;
      border: 10px solid white;
      border-radius: 10px;
      overflow: hidden;
      position: relative;
    }

    .video-container img {
      width: 100%;
      height: 100%;
      transition: opacity 0.5s ease;
    }

    .question-overlay {
      font-size: 4.5em;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-family: Katuri;
      color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      text-align: center;
      opacity: 0;
      transition: opacity 0.5s ease;
      text-shadow:
              -4px -4px 2px #0d6efd,
              4px -4px 2px #0d6efd,
              -4px 4px 2px #0d6efd,
              4px 4px 2px #0d6efd; /* 텍스트 그림자에 약간의 블러를 추가하여 부드럽게 처리 */
      white-space: nowrap;
    }

    .countdown {
      position: absolute;
      bottom: 150px;
      right: 40px; /* 카운트다운을 왼쪽으로 옮김 */
      font-size: 8em;
      font-family: 'TmoneyRoundWindExtraBold';
      color: white;
      text-shadow:
              -4px -4px 2px #0d6efd,
              4px -4px 2px #0d6efd,
              -4px 4px 2px #0d6efd,
              4px 4px 2px #0d6efd; /* 텍스트 그림자에 약간의 블러를 추가하여 부드럽게 처리 */
      opacity: 0;
      transition: opacity 0.5s ease;
    }

    .voice-img {
      position: absolute;
      opacity: 1;left: 580px;top: 150px;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      opacity: 0;
      transition: opacity 0.5s ease;
      width: 30px; /* 이미지 너비를 더 줄임 */
      height: auto; /* 이미지 높이는 자동으로 설정 */
    }

  </style>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.1/annyang.min.js"></script>
</head>

<body>
<div class="container">
  <div class="video-heading"><h2>아우가 ㄴㅁ를 베고 있어요</h2></div>
  <div class="video-container">
    <img id="videoImage" src="/static/img/IDOQuizVC.PNG">
    <div id="questionOverlay" class="question-overlay">
      ㄴㅁ는 무엇일까요? <br><br>정답을 말해주세요!
    </div>
    <img id="voiceImage" class="voice-img" src="/static/img/IDOVoice.png" style="width: 400px; height: auto;">
    <div id="countdown" class="countdown">
      5
    </div>
  </div>
</div>

<script>
  function startListening() {
    if (annyang) {
      annyang.setLanguage('ko'); // 한국어로 설정

      const commands = {
        '나무': function() {
          window.location.href = '/result/correct50';
        },
        '*catchall': function() {
          window.location.href = '/result/wrong';
        }
      };

      annyang.addCommands(commands);
      annyang.start({ autoRestart: false, continuous: false });

      // 5초 후 음성 인식을 중지하고, 인식되지 않았을 때도 IDOWrong.html로 이동합니다.
      setTimeout(() => {
        annyang.abort();
        window.location.href = '/result/wrong';
      }, 5000);
    } else {
      console.error("Annyang is not supported in this browser.");
      window.location.href = '/result/wrong';
    }
  }

  setTimeout(() => {
    document.getElementById('videoImage').style.opacity = '0.5';
    document.getElementById('questionOverlay').style.opacity = '1';

    setTimeout(() => {
      document.getElementById('questionOverlay').style.opacity = '0';

      setTimeout(() => {
        document.getElementById('voiceImage').style.opacity = '1';
        document.getElementById('countdown').style.opacity = '1';

        // 음성 인식을 시작합니다.
        startListening();

        let countdown = 5;
        const countdownInterval = setInterval(() => {
          countdown--;
          document.getElementById('countdown').textContent = countdown;
          if (countdown === 0) {
            clearInterval(countdownInterval);
          }
        }, 1000);
      }, 500);

    }, 3500);

  }, 3500);
</script>
</body>
</html>

