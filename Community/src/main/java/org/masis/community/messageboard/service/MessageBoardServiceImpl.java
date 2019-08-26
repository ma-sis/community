package org.masis.community.messageboard.service;

import java.util.List;

import javax.inject.Inject;

import org.masis.community.messageboard.DAO.MessageBoardDAO;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.springframework.stereotype.Service;

@Service
public class MessageBoardServiceImpl implements MessageBoardService {
	
	@Inject
	MessageBoardDAO dao;
	
	@Override
	public List<MessageBoardDTO> listAll() { //01.게시물전체목록
	
		return dao.listAll();
	}
	
	@Override
	public void create(MessageBoardDTO dto) {//02.게시물작성
		dao.create(dto);
		
	}

}
