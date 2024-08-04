<%--
  Created by IntelliJ IDEA.
  User: data8320-06
  Date: 2024-08-02
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <style>
        #container {
            position:relative;
            width:720px;
            height: 560px;
        }

        #video, #overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        #video {
            transform: scaleX(-1);
        }

        #leftBox, #rightBox {
            position: absolute;
            top: 0;
            width: 50%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 5em;
            color: rgba(255, 255, 255, 0.7);
            pointer-events: none;
        }

        #leftBox {
            left: 0;
            border-right:2px solid red;
        }

        #rightBox {
            right:0;
            border-left: 2px solid red;
        }
    </style>
<%--    <script src="<c:url value='/static/js/face-api.min.js'/>"></script>--%>
<%--    <script src="<c:url value='/static/js/face-api-example.js'/>"></script>--%>
    <script src="${pageContext.request.contextPath}/js/face-api.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/face-api-example.js" defer></script>



</head>
<body>
    <h1>얼굴 인식 예제 OX</h1>
    <h2>문제 - [[${quiz.content}]]</h2>
    <div id="container">
        <video id="video" autoplay muted></video>
        <canvas id="overlay"></canvas>
        <div id="leftBox">O</div>
        <div id="rightBox">X</div>
    </div>
</body>
</html>
