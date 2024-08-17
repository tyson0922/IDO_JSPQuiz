

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
            background-image: url("/static/img/IDOmainBackground.png"); /*배경 수정할 곳*/
            background-size: cover; /* 배경 이미지를 화면에 맞게 조정 */
            background-repeat: no-repeat; /* 배경 이미지 반복 안함 */
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
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-family: Katuri;
            color: #0d6efd;
            font-size: 4.5em;
            text-shadow:
                    -3px -3px 0 white,
                    3px -3px 0 white,
                    -3px 3px 0 white,
                    3px 3px 0 white;
            /*margin-bottom: 100px;*/
        }

        .video-container {
            margin-top: 20px;
        }

        iframe {
            width: 1000px;
            height: 500px;
            border: 10px solid white;
            border-radius: 10px;
        }

        .navigation {
            position: absolute;
            width: 100%;
            bottom: 30px;
            display: flex;
            /*justify-content: space-between;*/
            padding: 0 20px;
        }

        .back-button{
            padding-right: 38%;
        }

        .navigation a {
            text-decoration: none; /* 밑줄 없애기 */
            font-family: 'TmoneyRoundWindExtraBold';
            font-size: 1.8em;
            color: #fff;
        }

        .navigation img {
            width: 70px;
            vertical-align: middle;
        }

    </style>

    <script type="text/javascript">
        function quizInfo(level, number) {

            location.href = "/quiz/oxQuiz?level=" + level + "&number=" + number;
        }

    </script>

</head>

<body>
<div class="container">
    <div class="video-heading"><h2>도깨비 방망이</h2></div>
    <div class="video-container">
        <iframe src="https://www.youtube.com/embed/rVwefWX58lQ?si=s3JtjdX42-jjWaN2" title="YouTube video" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        <!--        <div class="play-button">-->
        <!--            <img src="img/IDOplayicon.png" style="width: 100px">-->
        <!--        </div>-->
    </div>

    <div class="navigation">
        <div class="back-button">
            <a href="IDOLessonSelection3">
                <img src="/static/img/IDOPlayBack-button.png" alt="뒤로"  style="width: 65px;">  뒤로
            </a>
        </div>



        <c:forEach var="quiz" items="${quizList}">
        <div class="next-button" onclick="quizInfo(100, 1)">
            <a>

                다음 <img src="/static/img/IDOPlayNext-button.png" alt="다음">
            </a>
        </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
