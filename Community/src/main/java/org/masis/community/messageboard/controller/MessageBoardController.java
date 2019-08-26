package org.masis.community.messageboard.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.masis.community.messageboard.service.MessageBoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("board/messageboard/*")
public class MessageBoardController {
	
	@Inject
	MessageBoardService messageboardService; 
	
	@RequestMapping(value = "me", method = RequestMethod.GET)
	public String me(Model model) throws Exception{ //자유게시판으로 이동+전체게시물
		model.addAttribute("messageboardList",messageboardService.listAll());
		return "board/message_board/messageBoard";
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(@ModelAttribute MessageBoardDTO dto,Model model) throws Exception{ //게시물작성
	
		messageboardService.create(dto);
		return "redirect:/board/messageboard/me";
	}	

	@RequestMapping(value = "read/*", method = RequestMethod.GET)
	public String read(String board_num,Model model,HttpServletRequest request) throws Exception{//게시물 상세보기
//		messageboardService.read(request.getRequestURI()); //요청주소 
		model.addAttribute("messageboardone",messageboardService.read(request.getRequestURI()));
		
		return "board/message_board/messageBoardOne";
	}
	

	
	

}
