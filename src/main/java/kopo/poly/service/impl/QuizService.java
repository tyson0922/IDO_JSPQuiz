package kopo.poly.service.impl;

import kopo.poly.dto.object.QuizDTO;
import kopo.poly.dto.quiz.GradingDTO;
import kopo.poly.dto.request.AnswerDTO;
import kopo.poly.persistence.mapper.IQuizMapper;
import kopo.poly.service.IQuizService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
@RequiredArgsConstructor
public class QuizService implements IQuizService {
    private final IQuizMapper quizMapper;
    @Override
    public List<QuizDTO> getQuizList() {
        List<QuizDTO> result = new ArrayList<>();
        try{
            result = quizMapper.getQuizList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            return result;
        }
    }

    @Override
    public QuizDTO getQuiz(Long level, Long number) {
        QuizDTO result = new QuizDTO();
        try{
            result = quizMapper.getQuiz(level, number);
        } catch (Exception e) {
            e.printStackTrace();
            result.setQuizNumber(404L);
            result.setContent("데이터베이스에러 발생했습니다.");
        } finally {
            return result;
        }
    }

    @Override
    public QuizDTO getQuiz(AnswerDTO request) {
        QuizDTO result = new QuizDTO();
        try{
            Long level = request.getLevel();
            Long number = request.getNumber();

            result = quizMapper.getQuiz(level, number);
        } catch (Exception e) {
            e.printStackTrace();
            result.setQuizNumber(404L);
            result.setContent("데이터베이스에러 발생했습니다.");
        } finally {
            return result;
        }
    }

    public int updateQuizGrading(GradingDTO pDTO){
        int res=0;
        try {
            quizMapper.updateQuizGrading(pDTO);
            res = 1;
        }catch (Exception e){
            e.printStackTrace();
            res=0;
        }
        return res;
    }
}
