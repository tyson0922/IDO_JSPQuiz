package kopo.poly.controller;

import kopo.poly.dto.object.QuizDTO;
import kopo.poly.service.IQuizService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {
    private final IQuizService mainService;
    @GetMapping(value = "main")
    public String main(ModelMap model){
        List<QuizDTO> result = mainService.getQuizList();
        model.addAttribute("quizList", result);
        return "main";
    }

    @GetMapping("/user/index")
    public String mainPage() throws Exception {
        log.info(this.getClass().getName() + ".main 페이지 보여주는 함수 실행");
        return "/user/index";
    }

    @GetMapping("/redirect")
    public String redirectPage(ModelMap modelMap) throws Exception {
        modelMap.addAttribute("msg", "Hi");
        modelMap.addAttribute("url", "/index");
        return "/redirect:/index";
    }

}
