package kopo.poly.controller;

import jakarta.servlet.http.HttpSession;
import kopo.poly.dto.object.QuizDTO;
import kopo.poly.dto.request.AnswerDTO;
import kopo.poly.dto.response.CorrectDTO;
import kopo.poly.service.IQuizService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@RequestMapping("/quiz")
@Controller
@RequiredArgsConstructor
public class QuizController {
    private final IQuizService quizService;


    @PostMapping(value = "/grading")
    @ResponseBody
    public CorrectDTO grading(@RequestBody AnswerDTO request){
        CorrectDTO msg = new CorrectDTO();
        boolean correct;

        QuizDTO quiz = quizService.getQuiz(request);
        correct = quiz.getCorrect().equals(request.getAnswer().trim().toUpperCase());

        msg.setCorrect(correct);
        return msg;
    }

    @GetMapping(value = "/IDOLessonSelection1")
    public String IDOLessonSelection1(HttpSession session) {
        log.info("{}.quiz/IDOLessonSelection1", this.getClass().getName());
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/IDOLessonSelection1";
    }

    @GetMapping(value = "/IDOLessonSelection2")
    public String IDOLessonSelection2(HttpSession session) {
        log.info("{}.quiz/IDOLessonSelection1", this.getClass().getName());
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/IDOLessonSelection2";
    }

    @GetMapping(value = "/IDOLessonSelection3")
    public String IDOLessonSelection3(HttpSession session) {
        log.info("{}.quiz/IDOLessonSelection3", this.getClass().getName());
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/IDOLessonSelection3";
    }

    @GetMapping(value = "/IDOLessonSelection3Unlock")
    public String IDOLessonSelection3Unlock(HttpSession session) {
        log.info("{}.quiz/IDOLessonSelection3Unlock", this.getClass().getName());
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/IDOLessonSelection3Unlock";
    }
    @GetMapping(value = "/IDOVideo")
    public String IDOVideo(HttpSession session, RedirectAttributes redirectAttributes)
    {Object user = session.getAttribute("user");

        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/IDOVideo";
    }

    @GetMapping(value = "/wrong")
    public String wrong(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/wrong";
    }

    @GetMapping(value = "/oxQuiz")
    public String oxQuiz(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/oxQuiz";
    }

    @GetMapping(value = "/jumpQuiz")
    public String jumpQuiz(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/jumpQuiz";
    }

    @GetMapping(value = "/voiceQuiz")
    public String voiceQuiz(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/voiceQuiz";
    }

    @GetMapping(value= "/IDOQuizBD")
    public String IDOQuizBD(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "quiz/IDOQuizBD";}
}