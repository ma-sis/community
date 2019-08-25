package org.masis.community.messageboard.controller;


import javax.inject.Inject;

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
	public String test(Model model) throws Exception{
		
		return "board/message_board/messageBoard";
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(@ModelAttribute MessageBoardDTO dto,Model model) throws Exception{ //게시물작성
	
		
		messageboardService.create(dto);
		return "redirect:/board/messageboard/me";
	}	
	

}
