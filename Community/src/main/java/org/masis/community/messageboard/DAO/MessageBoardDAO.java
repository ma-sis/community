package org.masis.community.messageboard.DAO;

import java.util.List;

import org.masis.community.messageboard.domain.MessageBoardDTO;

public interface MessageBoardDAO {
	
	List<MessageBoardDTO> listAll(); //01.게시물 전체목록 select
	
	void create(MessageBoardDTO dto);//02.게시물 db insert
	
	MessageBoardDTO read(int board_num); //03.게시물 상세읽기

}
