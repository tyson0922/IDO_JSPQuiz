<%--
  Created by IntelliJ IDEA.
  User: data8320-06
  Date: 2024-08-07
  Time: 오후 7:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kopo.poly.dto.object.QuizDTO" %>
<%
  QuizDTO rDTO=(QuizDTO) request.getAttribute("quiz");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"> </script>

</head>
<body>
<div>Teachable Machine Pose Model</div>
<div id="label-container"></div>
<div id="content-display">**문제 : <%=rDTO.getContent()%>**</div>
<div id="label-sum-display">
  <p>ㄱ의 합계 : <span id="k1">0</span></p>
  <p>ㄷ의 합계 : <span id="k3">0</span></p>
</div>



<div>Teachable Machine Pose Model</div>
<%--<button type="button" onclick="init()">Start</button>--%>
<div><canvas id="canvas"></canvas></div>
<div id="label-container"></div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript">
  // More API functions here:
  // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose

  // the link to your model provided by Teachable Machine export panel
  const URL = "/models/";
  let model, webcam, ctx, labelContainer, maxPredictions;

  async function init() {
    const modelURL = URL + "model.json";
    const metadataURL = URL + "metadata.json";

    // load the model and metadata
    // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
    // Note: the pose library adds a tmPose object to your window (window.tmPose)
    model = await tmPose.load(modelURL, metadataURL);
    maxPredictions = model.getTotalClasses();

    // Convenience function to setup a webcam
    const size = 200;
    const flip = true; // whether to flip the webcam
    webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
    await webcam.setup(); // request access to the webcam
    await webcam.play();
    window.requestAnimationFrame(loop);

    // append/get elements to the DOM
    const canvas = document.getElementById("canvas");
    canvas.width = size; canvas.height = size;
    ctx = canvas.getContext("2d");
    labelContainer = document.getElementById("label-container");
    for (let i = 0; i < maxPredictions; i++) { // and class labels
      labelContainer.appendChild(document.createElement("div"));
    }
    startTime=new Date().getTime();
  }



  async function loop(timestamp) {
    webcam.update(); // update the webcam frame
    await predict();
    window.requestAnimationFrame(loop);

    const currentTime=new Date().getTime();
    if(currentTime-startTime>=3000){
      const predictedAnswer=k3>k1 ? "ㄷ" : "ㄱ";
      compareAnswers(predictedAnswer);
      startTime=currentTime;
      k1=0;
      k3=0;
    }
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


      if (prediction[i].className === "ㄱ") {
        k1 += prediction[i].probability;
      } else if (prediction[i].className === "ㅇ") {
        k3 += prediction[i].probability;
      }
    }
    document.getElementById("k1").innerText = k1.toFixed(2);
    document.getElementById("k3").innerText = k3.toFixed(2);
    // finally draw the poses
    drawPose(pose);
  }

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

  let k1 = 0;
  let k3=0;
  let predictedAnswer=0;
  let startTime;

  const correctAnswer="<%=rDTO.getCorrect()%>";
  const content="<%=rDTO.getContent()%>";

  async function loadModel() {
    const modelURL = URL + "model.json";
    const metadataURL = URL + "metadata.json";

    // load the model and metadata
    // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
    // Note: the pose library adds a tmPose object to your window (window.tmPose)
    model = await tmPose.load(modelURL, metadataURL);
    maxPredictions = model.getTotalClasses();
  }

  function delay(ms){
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  window.onload = async function() {
    await Promise.all([loadModel(), delay(3000)]);
    alert('3초 지남');
    init();
  };

  // function compareAnswers(predictedAnswer) {
  //   let grading = '';
  //   if (predictedAnswer === correctAnswer) {
  //     alert("정답 추카행~ㅎㅎ");
  //     grading = '정답';
  //   } else {
  //     alert("바봉");
  //     grading = '오답';
  //   }
  //
  //   const urlParams = new URLSearchParams(window.location.search);
  //   const level = urlParams.get('level');
  //   const number = urlParams.get('number');
  //
  //   $.ajax({
  //     url: "/pose-grading",
  //     type: "post",
  //     dataType: "JSON",
  //     contentType: "application/json",
  //     data: JSON.stringify({
  //       grading: grading,
  //       level: level,
  //       number: number
  //     }),
  //     success: function (response) {
  //       console.log("서버 응답 : ", response);
  //     },
  //     error: function (error) {
  //       console.error("에러 발생 : ", error);
  //     }
  //   })
  //
  //   if (grading === '정답') {
  //     window.location.href = '/pose-correct';
  //   } else {
  //     window.location.href = '/pose-wrong';
  //   }
  //
  //   return;
  // }
  function compareAnswers(predictedAnswer){
    let grading = '';
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
      url: "/face/grading",
      type: "post",
      dataType: "JSON",
      contentType: "application/json",
      data: JSON.stringify({
        grading: grading,
        level: level,
        number: number
      }),
      success: function (response) {
        const resultUrl = grading === '정답' ? '/face/correct' : '/face/wrong';
        window.location.href = resultUrl;
      },
      error: function (error) {
        console.error("에러 발생 : ", error);
      }
    });
  }


</script>




</body>
</html>

