package org.masis.community.messageboard.DAO;

import java.util.List;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.masis.community.messageboard.domain.MessageboradCommentsDTO;

public interface MessageBoardDAO {
	
	List<MessageBoardDTO> listAll(); //01.게시물 전체목록 select
	
	void create(MessageBoardDTO dto);//02.게시물 db insert
	
	MessageBoardDTO read(int board_num); //03.게시물 상세읽기
	
	void delete(int board_num); //04.게시물 삭제 
	
	void update(MessageBoardDTO dto); //05.게시물 수정
	
	List<MessageboradCommentsDTO> commentsread(int board_num); //06.자유게시판 댓글 전체목록
	
	void createcomment(MessageboradCommentsDTO dto);//07.자유게시판 댓글작성
	
	void deletecomment(int comment_num); //08.댓글 삭제
	
	void updatecomment(MessageboradCommentsDTO dto);//09.댓글수정

}
