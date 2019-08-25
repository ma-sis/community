package org.masis.community.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.masis.community.member.domain.MemberDTO;
import org.masis.community.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
