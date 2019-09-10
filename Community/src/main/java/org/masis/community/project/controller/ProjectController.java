package org.masis.community.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/project/*")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	//프로젝트로이동 임시임!
	@RequestMapping(value = "project.me") 
	public String me(Model model) throws Exception{
		
		return "project/projectView";
	}
	
	
}
