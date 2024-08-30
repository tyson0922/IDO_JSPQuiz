package kopo.poly.controller;

import jakarta.servlet.http.HttpSession;
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
    public String correct25(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/IDOCorrect25";
    }

    @GetMapping(value = "/correct50")
    public String correct50(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/IDOCorrect50";}

    @GetMapping(value = "/correct75")
    public String correct75(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/IDOCorrect75";
    }

    @GetMapping(value = "/correct100")
    public String correct100(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/IDOCorrect100";
    }

    @GetMapping(value = "/wrong")
    public String wrong(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/IDOWrong";
    }

    @GetMapping(value = "/wrong25")
    public String wrong25(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }

        return "result/IDOWrong25";
    }


    @GetMapping(value = "/wrong50")
    public String wrong50(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/IDOWrong50";
    }


    @GetMapping(value = "/wrong75")
    public String wrong75(HttpSession session){
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }
        return "result/IDOWrong75";
    }



}
