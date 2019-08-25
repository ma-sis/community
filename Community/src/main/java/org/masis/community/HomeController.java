package org.masis.community;

import java.util.Locale;

import org.masis.community.test.service.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		return "index";
	}
	
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String mem(Model model) {
		
		String name="";
		name = testService.getName();

	        model.addAttribute("name", name);
	        System.out.println(name);
		return "test";
	}

	
	
}
