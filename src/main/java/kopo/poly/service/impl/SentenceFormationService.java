package kopo.poly.service.impl;

import kopo.poly.dto.object.SentenceDTO;
import kopo.poly.dto.request.WordSelectionDTO;
import kopo.poly.service.ISentenceFormationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SentenceFormationService implements ISentenceFormationService {
    @Override
    public SentenceDTO buildSentence(WordSelectionDTO request) {
        SentenceDTO sentenceDTO = new SentenceDTO();

        // 문장 생성 로직을 여기에 작성합니다.
        // 예를 들어:
        String sentence = request.getSecondWord() + " " +
                request.getThirdWord() + " " +
                request.getFirstWord();

        sentenceDTO.setSentence(sentence);
        sentenceDTO.setCorrect(true); // 실제로는 정답 검증 로직이 필요합니다.

        return sentenceDTO;
    }
}
