package kopo.poly.persistence.mapper;

import kopo.poly.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface INoticeMapper {

	//게시판 리스트
	//List NoticeDTO가 result,
	// getNoticeList()함수 ()괄호 안에 입력값을 찾음
	List<NoticeDTO> getNoticeList() throws Exception;
	
	//게시판 글 등록
	//void: 결과값이 없고, insertNoticeInfo()함수를 실행할때,
	// NoticeDTO의 타입이 pDTO라는 변수를 입력함
	void insertNoticeInfo(NoticeDTO pDTO) throws Exception;
	
	//게시판 상세보기
	NoticeDTO getNoticeInfo(NoticeDTO pDTO) throws Exception;

	//게시판 조회수 업데이트
	void updateNoticeReadCnt(NoticeDTO pDTO) throws Exception;
	
	//게시판 글 수정
	void updateNoticeInfo(NoticeDTO pDTO) throws Exception;
	
	//게시판 글 삭제
	void deleteNoticeInfo(NoticeDTO pDTO) throws Exception;
	
}
