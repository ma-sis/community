package org.masis.community.messageboard.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.springframework.stereotype.Repository;

@Repository
public class MessageBoardImpl implements MessageBoardDAO {
	
	 private static final String Namespace = "org.masis.community.mybatis.messageboardmapper.";
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<MessageBoardDTO> listAll() { //01.게시물 전체목록 select
		
	List<MessageBoardDTO> list=sqlsession.selectList(Namespace+"listall");
		return list;
	}
	
	@Override
	public void create(MessageBoardDTO dto) { //02.게시물 insert
		
		sqlsession.insert(Namespace+"create",dto);
		
	}
	
	@Override
	public MessageBoardDTO read(int board_num) { //03.게시물 상세읽기
		
		return sqlsession.selectOne(Namespace+"read",board_num);
	}

}
