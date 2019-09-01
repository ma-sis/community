package org.masis.community.messageboard.service;

import java.util.List;

import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.masis.community.messageboard.domain.MessageboradCommentsDTO;

public interface MessageBoardService {
	
	List<MessageBoardDTO> listAll();//01.게시문 전체목록
	
	void create(MessageBoardDTO dto,String board_useremail ,String board_username); //02.게시물 작성
	
	MessageBoardDTO read(String path); //03.게시물 상세읽기
	
	void delete(String path); //04.게시물 삭제 
	
	void update(MessageBoardDTO dto);//05.게시물 수정
	
	List<MessageboradCommentsDTO> commentsread(String path);//06.자유게시판 댓글 전체목록

}
