package kopo.poly.controller;

import kopo.poly.service.IQuizService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping("/result")
@Controller
@RequiredArgsConstructor
public class ResultController {
    private final IQuizService quizService;

    /**
     * requestParam으로 number 값 받아오고
     * 받아 온 number 값으로 service 불러와서 유저가 가지고 있는 조개 개수 증가시키기
     * @return
     */
    @GetMapping(value = "/correct25")
    public String correct25(){
        return "result/IDOCorrect25";
    }

    @GetMapping(value = "/correct50")
    public String correct50(){ return "result/IDOCorrect50";}

    @GetMapping(value = "/correct75")
    public String correct75(){
        return "result/IDOCorrect75";
    }

    @GetMapping(value = "/correct100")
    public String correct100(){
        return "result/IDOCorrect100";
    }

    @GetMapping(value = "/wrong")
    public String wrong(){
        return "result/IDOWrong";
    }

    @GetMapping(value = "/wrong25")
    public String wrong25(){
        return "result/IDOWrong25";
    }


    @GetMapping(value = "/wrong50")
    public String wrong50(){
        return "result/IDOWrong50";
    }


    @GetMapping(value = "/wrong75")
    public String wrong75(){
        return "result/IDOWrong75";
    }



}
