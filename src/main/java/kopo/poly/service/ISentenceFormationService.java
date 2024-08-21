package kopo.poly.service;

import kopo.poly.dto.object.SentenceDTO;
import kopo.poly.dto.request.WordSelectionDTO;

public interface ISentenceFormationService {
    SentenceDTO buildSentence(WordSelectionDTO request);
}
