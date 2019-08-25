package org.masis.community.messageboard.DAO;

import org.masis.community.messageboard.domain.MessageBoardDTO;

public interface MessageBoardDAO {
	
	void create(MessageBoardDTO dto);//게시물 db insert

}
