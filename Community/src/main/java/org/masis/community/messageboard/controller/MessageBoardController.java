package org.masis.community.messageboard.controller;

import java.util.List;

import org.masis.community.member.domain.MemberDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("board/messageboard/*")
public class MessageBoardController {
	
	@RequestMapping(value = "me", method = RequestMethod.GET)
	public String test(Model model) throws Exception{
		
		return "board/message_board/messageBoard";
	}
	

}
