package org.masis.community.messageboard.service;

import java.util.List;

import org.masis.community.messageboard.domain.MessageBoardDTO;

public interface MessageBoardService {
	
	List<MessageBoardDTO> listAll();//01.게시문 전체목록
	
	void create(MessageBoardDTO dto); //02.게시물 작성
	
	MessageBoardDTO read(String path); //03.게시물 상세읽기

}
