package org.masis.community.messageboard.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.masis.community.member.controller.MemberController;
import org.masis.community.messageboard.DAO.MessageBoardDAO;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
public class MessageBoardServiceImpl implements MessageBoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MessageBoardDAO dao;
	
	@Override
	public List<MessageBoardDTO> listAll() { //01.게시물전체목록
	
		return dao.listAll();
	}
	
	@Override
	public void create(MessageBoardDTO dto ,String board_useremail,String board_username) {//02.게시물작성
		
		//줄바꿈 문자처리
		String content=dto.getBoard_content();
		dto.setBoard_content(content.replace("\n","<br>"));
		dto.setBoard_useremail(board_useremail);
		dto.setBoard_username(board_username);
		dao.create(dto);
		
	}
	
	@Override
	public MessageBoardDTO read(String path) { //03.게시물 상세읽기
		
		path=path.split("/")[5]; //요청주소에서 게시판번호만 가져오기
		
		return dao.read(Integer.parseInt(path));
	}

}
