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
    @GetMapping(value = "/wrong")
    public String wrong(){
        return "result/wrong";
    }

    /**
     * requestParam으로 number 값 받아오고
     * 받아 온 number 값으로 service 불러와서 유저가 가지고 있는 조개 개수 증가시키기
     * @return
     */
    @GetMapping(value = "/correct")
    public String correct(){
        return "result/correct";
    }
    
    
}
