package kopo.poly.persistence.mapper;

import kopo.poly.dto.object.QuizDTO;
import kopo.poly.dto.quiz.GradingDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface IQuizMapper {
    @Select("SELECT LEVEL, QUIZ_NUMBER FROM QUIZ ORDER BY LEVEL, QUIZ_NUMBER ASC")
    List<QuizDTO> getQuizList() throws Exception;

    QuizDTO getQuiz(@Param("level") Long level, @Param("number")Long number) throws Exception;

    void updateQuizGrading(GradingDTO pDTO) throws Exception;
}
