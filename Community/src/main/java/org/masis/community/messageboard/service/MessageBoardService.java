package org.masis.community.messageboard.service;

import org.masis.community.messageboard.domain.MessageBoardDTO;

public interface MessageBoardService {
	
	void create(MessageBoardDTO dto); //게시물 작성

}
