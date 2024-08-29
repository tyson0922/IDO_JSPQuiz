
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
        // More API functions here:
        // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose

        // the link to your model provided by Teachable Machine export panel
        const URL = "static/models/";
        let model, webcam, ctx, labelContainer, maxPredictions;
        let timeoutHandle;  // To store the timeout ID
        let poseDetected = false; // Flag to determine if pose has been detected

        async function init() {
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";

            model = await tmPose.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();

            const size = 640; // 낮은 해상도로 설정하여 처리 속도 개선
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

            // 웹캠 및 모델 초기화가 완료되면 바로 예측 시작
            window.requestAnimationFrame(loop);

            // Check for pose after 5 seconds
            setTimeout(checkPoseAfterDelay, 5000); // 5 seconds delay

            // redirectToResultCorrectAfterDelay(5000);
        }

        async function loop(timestamp) {
            webcam.update();
            await predict();
            window.requestAnimationFrame(loop);
        }

        async function predict() {
            // Prediction #1: run input through posenet
            // estimatePose can take in an image, video or canvas html element
            const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
            // Prediction 2: run input through teachable machine classification model
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

            // finally draw the poses
            drawPose(pose);
        }


        if (timeoutHandle) {
            clearTimeout(timeoutHandle);
        }

        // 지연 시간 단축
        timeoutHandle = setTimeout(() => compareAnswers(predictedAnswer), 2000);




        function drawPose(pose) {
            if (webcam.canvas) {
                ctx.drawImage(webcam.canvas, 0, 0);
                // draw the keypoints and skeleton
                if (pose) {
                    const minPartConfidence = 0.5;
                    tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                    tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
                }
            }
        }

        // 페이지 로드 후 6초 뒤에 자동으로 canvas를 띄우기 위해 초기화 함수 호출
        window.onload = function() {
            setTimeout(init, 6000); // 6초 후에 init 함수를 호출합니다.
        };

        // function redirectToResultCorrectAfterDelay(delay) {
        //     setTimeout(() => {
        //         window.location.href = '/result/correct';
        //     }, delay);
        // }






        let k1 = 0;
        let k2 = 0;
        let predictedAnswer = 0;
        let maxProbability = 0;
        let startTime;

        const correctAnswer = "<%=rDTO.getCorrect()%>";
        const content = "<%=rDTO.getContent()%>";

        async function loadModel() {
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";

            // load the model and metadata
            // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
            // Note: the pose library adds a tmPose object to your window (window.tmPose)
            model = await tmPose.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();
        }

        function delay(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        // window.onload = async function () {
        //     await Promise.all([loadModel(), delay(3000)]);
        //     alert('3초 지남');
        //     init();
        // };

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
                    // if (grading === '정답') {
                    if (response.includes('정답')) {
                        /**
                         * correct 뒤에 number 쿼리파라미터 붙여서 보내기
                         * @type {string}
                         */
                        window.location.href = '/result/correct75';
                    } else {
                        window.location.href = '/result/wrong';
                    }
                },
                error: function (error) {
                    console.error("에러 발생 : ", error);
                }
            })


            // const resultUrl = data.correct ? '/result/correct' : '/result/wrong';
            // window.location.href = resultUrl;
            // return;
        }

        function checkPoseAfterDelay() {
            if (poseDetected) {
                window.location.href = '/result/correct75';
            } else {
                window.location.href = '/result/wrong';
            }
        }

    </script>


    <script>
        setTimeout(() => {
            document.getElementById('videoImage').style.opacity = '0.5';
            document.getElementById('questionOverlay').style.opacity = '1';

            setTimeout(() => {
                document.getElementById('questionOverlay').style.opacity = '0';

                setTimeout(() => {
                    document.getElementById('mainHeading').style.opacity = '0';
                    document.getElementById('countdown').style.opacity = '0'; // Hide countdown
                    document.getElementById('webcamVideo').style.opacity = '1'; // Show webcam
                    document.getElementById('questionReplacement').style.opacity = '1'; // Show replacement image

                    // Initialize webcam
                    const video = document.getElementById('webcamVideo');
                    navigator.mediaDevices.getUserMedia({video: true})
                        .then(stream => {
                            video.srcObject = stream;
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
                    }, 1000);
                }, 500);

            }, 3500);

        }, 3500);



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
            transition: opacity 0.5s ease;
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