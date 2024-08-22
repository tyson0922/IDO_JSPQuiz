package kopo.poly.controller;

import kopo.poly.dto.object.QuizDTO;
import kopo.poly.dto.request.AnswerDTO;
import kopo.poly.dto.response.CorrectDTO;
import kopo.poly.service.IQuizService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
    public String IDOLessonSelection1() {
        log.info("{}.quiz/IDOLessonSelection1", this.getClass().getName());

        return "quiz/IDOLessonSelection1";
    }

    @GetMapping(value = "/IDOLessonSelection2")
    public String IDOLessonSelection2() {
        log.info("{}.quiz/IDOLessonSelection1", this.getClass().getName());

        return "quiz/IDOLessonSelection2";
    }

    @GetMapping(value = "/IDOLessonSelection3")
    public String IDOLessonSelection3() {
        log.info("{}.quiz/IDOLessonSelection3", this.getClass().getName());

        return "quiz/IDOLessonSelection3";
    }


    @GetMapping(value = "/IDOVideo")
    public String IDOVideo(){
        return "quiz/IDOVideo";
    }

    @GetMapping(value = "/wrong")
    public String wrong(){
        return "result/wrong";
    }

    @GetMapping(value = "/oxQuiz")
    public String oxQuiz(){
        return "quiz/oxQuiz";
    }

    @GetMapping(value = "/jumpQuiz")
    public String jumpQuiz(){
        return "quiz/jumpQuiz";
    }

    @GetMapping(value = "/voiceQuiz")
    public String voiceQuiz(){
        return "quiz/voiceQuiz";
    }

    @GetMapping(value= "/IDOQuizBD")
    public String IDOQuizBD(){return "quiz/IDOQuizBD";}
}