package kopo.poly.controller;

import jakarta.servlet.http.HttpSession;
import kopo.poly.dto.object.SentenceDTO;
import kopo.poly.dto.request.WordSelectionDTO;
import kopo.poly.dto.response.SentenceResponseDTO;
import kopo.poly.service.ISentenceFormationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequestMapping("/sentence")
@Controller
@RequiredArgsConstructor
public class SentenceController {

    private final ISentenceFormationService sentenceFormationService;

    @PostMapping(value = "/build")
    @ResponseBody
    public SentenceResponseDTO buildSentence(@RequestBody WordSelectionDTO request){
        SentenceResponseDTO response = new SentenceResponseDTO();

        SentenceDTO sentence = sentenceFormationService.buildSentence(request);

        response.setSentence(sentence.getSentence());
        response.setCorrect(sentence.isCorrect());

        return response;
    }

    @GetMapping(value = "/buildSentence")
    public String buildSentencePage(HttpSession session) {
        if (session.getAttribute("SS_USER_ID") == null) {
            // If not logged in, redirect to the login page
            return "redirect:/user/login";
        }

        return "quiz/buildSentence"; // JSP 파일 경로
    }
}
