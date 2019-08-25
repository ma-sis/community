package org.masis.community.messageboard.service;

import javax.inject.Inject;

import org.masis.community.messageboard.DAO.MessageBoardDAO;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.springframework.stereotype.Service;

@Service
public class MessageBoardServiceImpl implements MessageBoardService {
	
	@Inject
	MessageBoardDAO dao;
	
	@Override
	public void create(MessageBoardDTO dto) {//게시물작성
		dao.create(dto);
		
	}

}
