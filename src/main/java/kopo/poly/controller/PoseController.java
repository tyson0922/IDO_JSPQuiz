package kopo.poly.controller;

import kopo.poly.dto.object.QuizDTO;
import kopo.poly.dto.quiz.GradingDTO;
import kopo.poly.service.IQuizService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class PoseController {
    private final IQuizService quizService;

    @GetMapping("pose/correct")
    public String poseCorrect(){
        return  "result/correct";
    }

    @GetMapping("pose/wrong")
    public String poseWrong(){
        return "result/wrong";
    }

//    @GetMapping("/pose/correct")
//    public String poseCorrect(@RequestParam("poseResult") String poseResult, @RequestParam("quizResult") String quizResult, ModelMap model) {
//        model.addAttribute("poseResult", poseResult);
//        model.addAttribute("quizResult", quizResult);
//        return "pose/correct";
//    }
//
//    @GetMapping("/pose/wrong")
//    public String poseWrong(@RequestParam("poseResult") String poseResult, @RequestParam("quizResult") String quizResult, ModelMap model) {
//        model.addAttribute("poseResult", poseResult);
//        model.addAttribute("quizResult", quizResult);
//        return "pose-wrong";
//    }

    @GetMapping("/pose-estimation")
    public String poseEstimation(@RequestParam(value = "level", defaultValue = "3") Long level, @RequestParam(value = "number", defaultValue = "1") Long number, ModelMap model) {
        QuizDTO pDTO = new QuizDTO();
        pDTO.setLevel(level);
        pDTO.setQuizNumber(number);

        QuizDTO rDTO = Optional.ofNullable(quizService.getQuiz(level, number)).orElseGet(QuizDTO::new);
        model.addAttribute("quiz", rDTO);
        return "quiz/pose-estimation";
    }

    @PostMapping("pose-grading")
    @ResponseBody
    public String poseGrading(@RequestBody GradingDTO request) {
        String grading = request.getGrading();
        quizService.updateQuizGrading(request);
        return "Grading received : " + grading;
    }
}

