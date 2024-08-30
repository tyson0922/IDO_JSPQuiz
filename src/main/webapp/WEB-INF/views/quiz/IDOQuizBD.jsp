<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kopo.poly.dto.object.QuizDTO" %>
<%
    QuizDTO rDTO = (QuizDTO) request.getAttribute("quiz");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>

    <script type="text/javascript">
        window.onload = function() {
            // Hide the small image container initially
            document.getElementById('smallImageContainer').style.opacity = '0';

            // Show the main heading for 6 seconds, then start fading it out
            setTimeout(() => {
                document.getElementById('mainHeading').classList.add('fade-out'); // Start fading out after 6 seconds
                setTimeout(() => {
                    document.getElementById('mainHeading').style.display = 'none'; // Hide it completely after the fade-out transition
                    init(); // Initialize the webcam and model
                }, 1000); // Match this duration with the fade-out transition time
            }, 9500);

            // Show the small image container after 3 seconds
            setTimeout(() => {
                document.getElementById('smallImageContainer').style.opacity = '1'; // Show small image container
            }, 11000);

            // Show video image and question overlay after 3 seconds
            setTimeout(() => {
                document.getElementById('videoImage').style.opacity = '0.5';
                document.getElementById('questionOverlay').style.opacity = '1';

                setTimeout(() => {
                    document.getElementById('questionOverlay').style.opacity = '0';

                    setTimeout(() => {
                        document.getElementById('countdown').style.opacity = '0'; // Hide countdown
                        document.getElementById('webcamVideo').style.opacity = '1'; // Show webcam
                        document.getElementById('questionReplacement').style.opacity = '1'; // Show replacement image

                        // Initialize webcam
                        const video = document.getElementById('webcamVideo');
                        navigator.mediaDevices.getUserMedia({ video: true })
                            .then(stream => {
                                video.srcObject = stream;
                                video.onloadedmetadata = () => {
                                    video.play(); // Play video as soon as it's loaded
                                };
                            })
                            .catch(err => {
                                console.error('Failed to access webcam: ', err);
                            });

                        let countdown = 5;
                        const countdownInterval = setInterval(() => {
                            countdown--;
                            document.getElementById('countdown').textContent = countdown;
                            if (countdown === 0) {
                                clearInterval(countdownInterval);
                                startListening();
                            }
                        }, 1000); // Changed to 1000ms for 1 second countdown intervals
                    }, 300);

                }, 7800); // Adjusted timing here

            }, 3000); // Adjusted timing here
        };

        async function init() {
            const modelURL = "static/models/model.json";
            const metadataURL = "static/models/metadata.json";

            model = await tmPose.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();

            const size = 640; // Set lower resolution for faster processing
            const flip = true;
            webcam = new tmPose.Webcam(size, size, flip);
            await webcam.setup();
            await webcam.play();

            const canvas = document.getElementById("canvas");
            canvas.width = webcam.canvas.width;
            canvas.height = webcam.canvas.height;

            ctx = canvas.getContext("2d");
            labelContainer = document.getElementById("label-container");

            for (let i = 0; i < maxPredictions; i++) {
                labelContainer.appendChild(document.createElement("div"));
            }

            // Start prediction loop
            window.requestAnimationFrame(loop);

            // Check for pose after 5 seconds
            setTimeout(checkPoseAfterDelay, 5000); // 5 seconds delay
        }

        async function loop(timestamp) {
            webcam.update();
            await predict();
            window.requestAnimationFrame(loop);
        }

        async function predict() {
            // Prediction #1: run input through posenet
            // estimatePose can take in an image, video or canvas HTML element
            const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
            // Prediction #2: run input through Teachable Machine classification model
            const prediction = await model.predict(posenetOutput);

            for (let i = 0; i < maxPredictions; i++) {
                const classPrediction =
                    prediction[i].className + ": " + prediction[i].probability.toFixed(2);
                labelContainer.childNodes[i].innerHTML = classPrediction;

                // Check if the pose 'ㄷ' is detected
                if (prediction[i].className === 'ㄷ' && prediction[i].probability > 0.5) {
                    poseDetected = true; // Set flag if pose 'ㄷ' is detected
                }
            }

            // Draw the poses
            drawPose(pose);
        }

        function drawPose(pose) {
            if (webcam.canvas) {
                ctx.drawImage(webcam.canvas, 0, 0);
                // Draw the keypoints and skeleton
                if (pose) {
                    const minPartConfidence = 0.5;
                    tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                    tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
                }
            }
        }

        function checkPoseAfterDelay() {
            if (poseDetected) {
                window.location.href = '/result/correct75';
            } else {
                window.location.href = '/result/wrong';
            }
        }

        function compareAnswers(predictedAnswer) {
            if (!predictedAnswer) {
                return; // No prediction, so nothing to compare
            }

            let grading = '';
            console.log(predictedAnswer)
            if (predictedAnswer === correctAnswer) {
                alert("정답 추카행~ㅎㅎ");
                grading = '정답';
            } else {
                alert("바봉");
                grading = '오답';
            }

            const urlParams = new URLSearchParams(window.location.search);
            const level = urlParams.get('level');
            const number = urlParams.get('number');

            $.ajax({
                url: "/pose-grading",
                type: "post",
                dataType: "JSON",
                contentType: "application/json",
                data: JSON.stringify({
                    grading: grading,
                    level: level,
                    number: number
                }),
                success: function (response) {
                    console.log("서버 응답 : ", response);
                    if (response.includes('정답')) {
                        window.location.href = '/result/correct75';
                    } else {
                        window.location.href = '/result/wrong';
                    }
                },
                error: function (error) {
                    console.error("에러 발생 : ", error);
                }
            });
        }

        function startListening() {
            // Placeholder function for additional functionality
            console.log("Starting to listen for pose...");
        }


    </script>

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
            background-image: url("static/img/IDOmainBackground.png");
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
            text-shadow: -3px -3px 2px white,
            3px -3px 2px white,
            -3px 3px 2px white,
            3px 3px 2px white;
            opacity: 1; /* Default opacity */
            transition: opacity 1s ease; /* Transition for fade-out effect */
        }

        .fade-out {
            opacity: 0; /* Fades out the element */
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
            object-fit: cover;
            transition: opacity 0.5s ease;
        }

        .question-overlay {
            position: absolute;
            top: 45%; /* 위치를 위로 올림 */
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0;
            transition: opacity 0.5s ease;
            width: 500px; /* 크기를 조금 키움 */
            height: auto;
        }

        .countdown {
            position: absolute;
            bottom: 150px;
            right: 40px;
            font-size: 8em;
            font-family: 'TmoneyRoundWindExtraBold';
            color: white;
            text-shadow: -4px -4px 2px #0d6efd,
            4px -4px 2px #0d6efd,
            -4px 4px 2px #0d6efd,
            4px 4px 2px #0d6efd;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        /* WebCam Styles */
        .webcam-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 10px; /* Match the video-container border radius */
            overflow: hidden;
            z-index: 0; /* Make sure it's behind the overlay */
            transform: scaleX(-1);
        }

        #canvas {
            width: 100%; /* videoImage의 너비에 맞춤 */
            height: 100%; /* videoImage의 높이에 맞춤 */
            object-fit: cover; /* 이미지 비율을 유지하면서 크기에 맞춤 */
        }

        video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .question-replacement {
            position: absolute;
            top: 55px; /* Same as video-heading position */
            left: 50%;
            transform: translateX(-50%);
            width: 280px; /* Smaller size for the image */
            height: auto;
            opacity: 0; /* Start hidden */
            transition: opacity 0.5s ease;
            z-index: 3; /* Ensure it's above the webcam */
        }

        .small-image-container {
            position: fixed; /* 화면에 고정 */
            top: 48px; /* 원하는 만큼 상단으로 이동 */
            left: 50%;
            transform: translateX(-50%);
            width: 240px; /* 적절한 크기로 조정 */
            height: auto;
            opacity: 1;
            transition: opacity 0.5s ease;
            z-index: 100; /* 모든 요소 위에 배치 */
        }

        .small-image-container img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="video-heading">
        <h2 id="mainHeading">몸으로 말해요!</h2>
    </div>
    <div class="video-container">
        <img id="videoImage" src="static/img/IDOQuizBD.PNG">
        <img id="questionOverlay" class="question-overlay" src="static/img/IDOQuizBDq.PNG"
             style="width: 500px; height: auto; top: 45%">
        <div id="countdown" class="countdown">
            5
        </div>
        <div class="webcam-container">
            <%--                        <video id="webcamVideo" autoplay></video> <!-- WebCam Video Element -->--%>
            <div>
                <canvas id="canvas"></canvas>
            </div>

            <%--<div>Teachable Machine Pose Model</div>--%>
            <%--            <button type="button" onclick="init()">Start</button>--%>
        </div>
        <!-- New div for the smaller IDOQuizBDq image -->
        <div id="smallImageContainer" class="small-image-container">
            <img id="smallImage" src="static/img/IDOQuizBDq.PNG" alt="IDOQuizBDq" />
        </div>


        <%--        <div class="webcam-container">--%>
        <%--            <div style="position: relative;">--%>
        <%--                <canvas id="canvas"></canvas>--%>
        <%--                <img id="questionReplacement" class="question-replacement" src="static/img/IDOQuizBDq.PNG">--%>
        <%--            </div>--%>
        <%--        </div>--%>

    </div>
    <%--    <img id="questionReplacement" class="question-replacement" src="static/img/IDOQuizBDq.PNG">--%>
    <!-- Replacement Image -->
</div>

<div id="label-container" style="display: none"></div>

<div id="content-display" style="display: none">**문제 : <%=rDTO.getContent()%></div>

<div id="label-sum-display" style="display: none">
    <p>neutral의 합계 : <span id="k1">0</span></p>
    <p>ㄷ의 합계 : <span id="k2">0</span></p>
</div>

</body>
</html>