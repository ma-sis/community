package org.masis.community.member.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.masis.community.member.domain.MemberDTO;
import org.masis.community.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) throws Exception{
		logger.info("test");
		
		List<MemberDTO> list = service.selectMember();
		
		model.addAttribute("list", list);
		
		return "test2";
	}
	
	@RequestMapping(value = "/login.me")
	public String moveToLogin( @RequestParam(required = false) boolean login, @RequestHeader(value = "referer", defaultValue = "redirect:/index.do") String referer) throws Exception{
		logger.info("Login Page");
		logger.info("login again?: "+login);
		logger.info("Previous Page: "+referer);
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String doLogin(Model model, @ModelAttribute MemberDTO mdto, HttpSession session) throws Exception{
		logger.info("Login Check");
		
		MemberDTO result = service.selectlogin(mdto);
		
		if(result == null) {
			logger.info("Account NOT Exist...");
			return "redirect:login.me?login=true";
		}else {
			logger.info("접속자 정보: "+result.logInfo());
			session.setAttribute("mdto", result);
			return "redirect:/index.do";
		}
		
		//profile 사진 경로
//		String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/profile/");
//		logger.info("path: "+path);
		
	}
}
