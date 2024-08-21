package kopo.poly.dto.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SentenceResponseDTO {
    private String sentence;
    private boolean correct;
}
