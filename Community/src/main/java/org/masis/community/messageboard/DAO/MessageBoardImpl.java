package org.masis.community.messageboard.DAO;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.masis.community.messageboard.domain.MessageboradCommentsDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageBoardImpl implements MessageBoardDAO {
	
	 SqlSession sqlsession;
	 
	 private static final Logger logger = LoggerFactory.getLogger(MessageBoardImpl.class); 
	
	 private static final String Namespace = "org.masis.community.mybatis.messageboardmapper.";
	
	
	@Autowired
	public MessageBoardImpl(SqlSession sqlsession) {
		this.sqlsession= sqlsession;
	}
	
	//01.게시물 전체목록 select
	@Override
	public List<MessageBoardDTO> listAll() {
		
	List<MessageBoardDTO> list=sqlsession.selectList(Namespace+"listall");
		return list;
	}
	
	//02.게시물 insert
	@Override
	public void create(MessageBoardDTO dto) {
		
		sqlsession.insert(Namespace+"create",dto);
	
	}
	
	//03.게시물 상세읽기
	@Override
	public MessageBoardDTO read(int board_num) {
		MessageBoardDTO dto = new MessageBoardDTO();
		dto=sqlsession.selectOne(Namespace+"read",board_num);
		return dto;
	}
	
	//04.게시물 삭제
	@Override
	public void delete(int board_num) { 
		
		sqlsession.delete(Namespace+"delete",board_num);

		
	}
	
	//05.게시물 수정
	@Override
	public void update(MessageBoardDTO dto) {
		
		sqlsession.update(Namespace+"update",dto);
	}
	
	//06.자유게시판 댓글 전체목록
	@Override
	public List<MessageboradCommentsDTO> commentsread(int board_num) {
		return sqlsession.selectList(Namespace+"commentsread",board_num);
	}
	
	//07.자유게시판 댓글작성
	@Override
	public void createcomment(MessageboradCommentsDTO dto) {
		 sqlsession.insert(Namespace+"createcomment",dto);
		
	}
	
	//08.댓글 삭제
	@Override
	public void deletecomment(int comment_num) {
		sqlsession.delete(Namespace+"deletecomment",comment_num);
		
	}
	
	//09.댓글수정
	@Override
	public void updatecomment(MessageboradCommentsDTO dto) {
		
		sqlsession.update(Namespace+"updatecomment",dto);
		
	}
	
}
