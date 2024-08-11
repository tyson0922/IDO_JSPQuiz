package kopo.poly.service;

import kopo.poly.dto.object.QuizDTO;
import kopo.poly.dto.quiz.GradingDTO;
import kopo.poly.dto.request.AnswerDTO;

import java.util.List;

public interface IQuizService {
    List<QuizDTO> getQuizList();

    /**실질적인 비즈니스 로직은 같지만 컨트롤러에서 받는 매개변수의 타입이 달라 코드의 간결함을 위해 함수 오버로딩 하였음.**/
    QuizDTO getQuiz(Long level, Long number);
    QuizDTO getQuiz(AnswerDTO request);
    int updateQuizGrading(GradingDTO pDTO);
}
