package org.masis.community.messageboard.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.masis.community.member.domain.MemberDTO;
import org.masis.community.messageboard.domain.MessageBoardDTO;
import org.masis.community.messageboard.domain.MessageboradCommentsDTO;
import org.masis.community.messageboard.service.MessageBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("board/messageboard/*")
public class MessageBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageBoardController.class);
	MessageBoardService messageboardService; 
	
	@Autowired 
	public MessageBoardController(MessageBoardService messageboardService) {
		this.messageboardService=messageboardService;
	}
	
	
	//자유게시판으로 이동+전체게시물
	@RequestMapping(value = "messageboard.me") 
	public String me(Model model , HttpSession session,String info) throws Exception{
		
		if(session.getAttribute("mdto")==null) { //로그인 유무확인 -> 로그인 안돼있으면 로그인창으로 이동
			return "redirect:/member/login.me";
		}
		
		model.addAttribute("messageboardList",messageboardService.listAll());
		
		return "board/message_board/messageBoard";
	}
	
	
	//게시물작성
	@RequestMapping(value = "create")
	public String create(@ModelAttribute MessageBoardDTO dto,Model model,HttpSession session) throws Exception{

		MemberDTO memberdto= (MemberDTO)session.getAttribute("mdto");
		messageboardService.create(dto,memberdto.getEmail(),memberdto.getName());
		return "redirect:/board/messageboard/messageboard.me";
	}	

	
	//게시물 상세보기 + 댓글전체읽기
	@RequestMapping(value = "read/*")
	public String read(String board_num,Model model,HttpServletRequest request) throws Exception{
		model.addAttribute("messageboardone",messageboardService.read(request.getRequestURI())); //글상세 read 
		return "board/message_board/messageBoardOne";
	}
	
	
	//게시물 수정
	@RequestMapping(value = "update")
	public String update(@ModelAttribute MessageBoardDTO dto,Model model,RedirectAttributes rttr) throws Exception{
		
		messageboardService.update(dto);
		rttr.addFlashAttribute("msg","<i class=\"material-icons\">done</i>수정완료.");
		return "redirect:/board/messageboard/read/"+dto.getBoard_num();
	}
	
	//게시물 삭제
	@RequestMapping(value = "delete/*")
	public String delete(String board_num,Model model,HttpServletRequest request ,RedirectAttributes rttr) throws Exception{
		messageboardService.delete(request.getRequestURI());
		rttr.addFlashAttribute("msg","<i class=\"material-icons\">done</i>삭제완료.");
		return "redirect:/board/messageboard/messageboard.me";
	}
	
	
	@RequestMapping(value = "readcomments/*")
	@ResponseBody
	public List<MessageboradCommentsDTO> readcomment(Model model,HttpServletRequest request ,RedirectAttributes rttr) throws Exception{
		 
		List list= new ArrayList();
		list=messageboardService.commentsread(request.getRequestURI());
		logger.info(list.size()+"*******************************사이즈");
		return  list ;//댓글Read
	}
	
	//댓글작성
	@RequestMapping(value = "createcomment")
	@ResponseBody
	public void createcomment(@ModelAttribute MessageboradCommentsDTO dto) throws Exception{
	
	}
	

}
