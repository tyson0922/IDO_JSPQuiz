package kopo.poly.controller;

import kopo.poly.dto.object.QuizDTO;
import kopo.poly.dto.request.AnswerDTO;
import kopo.poly.dto.response.CorrectDTO;
import kopo.poly.service.IQuizService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RequestMapping("/face")
@Controller
@RequiredArgsConstructor
public class FaceController {
    private final IQuizService quizService;

    @GetMapping(value = "/exam")
    public String face(@RequestParam("level") Long level, @RequestParam("number") Long number, ModelMap model){

        QuizDTO pDTO = new QuizDTO();
        pDTO.setLevel(level);
        pDTO.setQuizNumber(number);

        QuizDTO rDTO = Optional.ofNullable(quizService.getQuiz(level, number)).orElseGet(QuizDTO::new);
        model.addAttribute("quiz", rDTO);

        // Add the quiz list to the model for JSTL rendering
        List<QuizDTO> quizList = quizService.getQuizList(); // Assuming getQuizList() returns the list of quizzes
        model.addAttribute("quizList", quizList);

        return "face/exam";
    }

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

    @GetMapping(value = "/correct")
    public String correct(){
        return "result/correct";
    }

    @GetMapping(value = "/wrong")
    public String wrong(){
        return "result/wrong";
    }
}
