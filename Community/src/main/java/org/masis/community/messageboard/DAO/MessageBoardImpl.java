package org.masis.community.messageboard.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.springframework.stereotype.Repository;

@Repository
public class MessageBoardImpl implements MessageBoardDAO {
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public void create(MessageBoardDTO dto) { //게시물 insert
		
		sqlsession.insert("org.masis.community.mybatis.messageboardmapper.create",dto);
		
	}

}
