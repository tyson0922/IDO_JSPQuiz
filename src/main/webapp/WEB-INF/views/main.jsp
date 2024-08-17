<%--
  Created by IntelliJ IDEA.
  User: data8320-06
  Date: 2024-08-02
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html lang="en" xmlns:th="http://www.thymeleaf.org">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Title</title>--%>
<%--    <script type="text/javascript">--%>
<%--        function quizInfo(level, number) {--%>
<%--            location.href = "/face/exam?level=" + level + "&number=" + number;--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <div th:each="quiz : ${quizList}">--%>
<%--        <div th:attr="onclick=|quizInfo('${quiz.level}', '${quiz.quizNumber}')|">--%>
<%--            <h3>[[${quiz.level}]] - [[${quiz.quizNumber}]]</h3>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript">
        function quizInfo(level, number) {

            location.href = "/face/exam?level=" + level + "&number=" + number;
        }

    </script>
</head>
<body>
<c:forEach var="quiz" items="${quizList}">
    <div onclick="quizInfo('${quiz.level}', '${quiz.quizNumber}')">
        <h3>${quiz.level} - ${quiz.quizNumber}</h3>
    </div>
</c:forEach>
</body>
</html>