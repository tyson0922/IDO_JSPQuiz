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

//    @GetMapping("face/correct")
//    public String poseCorrect(){
//        return  "pose-correct";
//    }
//
//    @GetMapping("face/wrong")
//    public String poseWrong(){
//        return "pose-wrong";
//    }

    @GetMapping("/pose/correct")
    public String poseCorrect(@RequestParam("poseResult") String poseResult, @RequestParam("quizResult") String quizResult, ModelMap model) {
        model.addAttribute("poseResult", poseResult);
        model.addAttribute("quizResult", quizResult);
        return "pose/correct";
    }

    @GetMapping("/pose/wrong")
    public String poseWrong(@RequestParam("poseResult") String poseResult, @RequestParam("quizResult") String quizResult, ModelMap model) {
        model.addAttribute("poseResult", poseResult);
        model.addAttribute("quizResult", quizResult);
        return "pose-wrong";
    }

    @GetMapping("/pose-estimation")
    public String poseEstimation(@RequestParam("level") Long level, @RequestParam("number") Long number, ModelMap model) {
        QuizDTO pDTO = new QuizDTO();
        pDTO.setLevel(level);
        pDTO.setQuizNumber(number);

        QuizDTO rDTO = Optional.ofNullable(quizService.getQuiz(level, number)).orElseGet(QuizDTO::new);
        model.addAttribute("quiz", rDTO);
        return "pose-estimation";
    }

    @PostMapping("pose-grading")
    @ResponseBody
    public String poseGrading(@RequestBody GradingDTO request) {
        String grading = request.getGrading();
        quizService.updateQuizGrading(request);
        return "Grading received : " + grading;
    }
}

