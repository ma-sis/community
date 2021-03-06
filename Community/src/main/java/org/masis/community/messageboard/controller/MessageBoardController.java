package org.masis.community.messageboard.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.masis.community.member.domain.MemberDTO;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.masis.community.messageboard.service.MessageBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("board/messageboard/*")
public class MessageBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageBoardController.class);
	
	@Inject
	MessageBoardService messageboardService; 
	
	@RequestMapping(value = "messageboard.me", method = RequestMethod.GET)
	public String me(Model model , HttpSession session) throws Exception{ //자유게시판으로 이동+전체게시물
		
		if(session.getAttribute("mdto")==null) { //로그인 유무확인 -> 로그인 안돼있으면 로그인창으로 이동
			return "redirect:/member/login.me";
		}
		
		model.addAttribute("messageboardList",messageboardService.listAll());
		
		return "board/message_board/messageBoard";
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(@ModelAttribute MessageBoardDTO dto,Model model,HttpSession session) throws Exception{ //게시물작성

		MemberDTO memberdto= (MemberDTO)session.getAttribute("mdto");
		messageboardService.create(dto,memberdto.getEmail(),memberdto.getName());
		return "redirect:/board/messageboard/messageboard.me";
	}	

	@RequestMapping(value = "read/*", method = RequestMethod.GET)
	public String read(String board_num,Model model,HttpServletRequest request) throws Exception{//게시물 상세보기
		model.addAttribute("messageboardone",messageboardService.read(request.getRequestURI()));
		
		return "board/message_board/messageBoardOne";
	}
	

	
	

}
