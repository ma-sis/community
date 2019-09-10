package org.masis.community.messageboard.service;

import java.util.List;

import javax.sound.midi.MidiDevice.Info;

import org.masis.community.member.controller.MemberController;
import org.masis.community.messageboard.DAO.MessageBoardDAO;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.masis.community.messageboard.domain.MessageboradCommentsDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MessageBoardServiceImpl implements MessageBoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	MessageBoardDAO dao;
	
	@Autowired
	public MessageBoardServiceImpl(MessageBoardDAO dao) {
		this.dao=dao;
	}
	
	
	//01.게시물전체목록
	@Override
	public List<MessageBoardDTO> listAll() {
	
		return dao.listAll();
	}
	
	//02.게시물작성
	@Override
	public void create(MessageBoardDTO dto ,String board_useremail,String board_username) {
		
		
		dto.setBoard_useremail(board_useremail);
		dto.setBoard_username(board_username);
		dao.create(dto);
		
	}
	
	//03.게시물 상세읽기
	@Override
	public MessageBoardDTO read(String path) {
		
		path=path.split("/")[5]; //요청주소에서 게시판번호만 가져오기
		
		return dao.read(Integer.parseInt(path));
	}
	
	//04.게시물 삭제
	@Override
	public void delete(String path) { 
		path=path.split("/")[5]; //요청주소에서 게시판번호만 가져오기
		dao.delete(Integer.parseInt(path));
		
	}
	
	//05.게시물 수정
	@Override
	public void update(MessageBoardDTO dto) {
		
		dao.update(dto);
		
	}
	
	//06.자유게시판 댓글 전체목록
	@Override
	public List<MessageboradCommentsDTO> commentsread(String path) {

		path=path.split("/")[5]; //요청주소에서 게시판번호만 가져오기
		
		return dao.commentsread(Integer.parseInt(path));
	}
	
	//07.자유게시판 댓글작성
	@Override
	public void createcomment(MessageboradCommentsDTO dto) {
		
		dao.createcomment(dto); 
	}
	
	//08.댓글 삭제
	@Override
	public void deletecomment(String path) {
		
		path=path.split("/")[5]; //요청주소에서 게시판번호만 가져오기
		dao.deletecomment(Integer.parseInt(path));
		
	}
	
	//09.댓글수정
	@Override
	public void updatecomment(MessageboradCommentsDTO dto) {
		
		dao.updatecomment(dto);
		
	}
	

}
