package org.masis.community.member.controller;

import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.masis.community.member.domain.EmailDTO;
import org.masis.community.member.domain.MemberDTO;
import org.masis.community.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/member")
public class MemberController {//회원 관련 처리 컨트롤러
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService service;
	
	@Inject
	public MemberController(MemberService service) {
		this.service = service;
	}
	
	//mysql, mybatis 연결테스트
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) throws Exception{
		logger.info("test");
		
		List<MemberDTO> list = service.selectMember();
		
		model.addAttribute("list", list);
		
		return "test2";
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value = "/login.me")
	public String moveToLogin( @RequestParam(required = false) boolean login, @RequestParam(required = false) String ref) throws Exception{
	//로그인 실패로 로그인 페이지로 재이동 되는 경우는 login 변수가 true
	//ref는 로그인 페이지에 재 접속시 그 전 페이지 주소를 저장하고 있음
		logger.info("Login Page");
		logger.info("login again?: "+login);
		logger.info("Previous Page: "+ref);
		return "member/login";
	}
	
	//로그인 시도 시 메일 비밀번호를 DB와 비교
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String doLogin(@RequestParam String ref ,@ModelAttribute MemberDTO mdto, HttpSession session) throws Exception{
		//ref는 로그인 페이지에 접속하기 전 페이지를 저장하고 로그인 완료되면 그 페이지로 보내줌
		logger.info("Login Check");
		
		MemberDTO result = service.selectlogin(mdto);
		
		//메일과 비밀번호가 맞지 않을 때
		if(result == null) {
			logger.info("Account NOT Exist...");
			return "redirect:login.me?login=true&ref="+ref;
			
		//로그인 완료.. 세션영역에 memberDTO객체를 mdto로 저장하고 이전 페이지로 보내줌
		}else {
			logger.info("접속자 정보: "+result.logInfo());
			session.setAttribute("mdto", result);
			return "redirect:"+ref;
		}
		
		//profile 사진 경로
//		String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/profile/");
//		logger.info("path: "+path);
		
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String doLogout(HttpSession session) {
		logger.info("LOG OUT");
		logger.info("BYE");
		session.invalidate();
		return "redirect:/index.do";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "/signUp.me")
	public String moveToCreateAccount(HttpSession session) {
		logger.info("Move to create account");
		
		//로그인 상태로 주소치고 들어올 수 있을거 같아서 세션 영역 비워즘
		session.invalidate();
		return "member/create_account";
	}
	
	//회원가입 시 이메일 중복인지 확인 후 중복 아니면 메일 보내고 인증번호 세션에
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String sighUpEmailCheck(@RequestParam String email, EmailDTO edto, HttpSession session) throws Exception{
		logger.info("E-mail 중복 체크");
		int cnt = service.countEmail(email);
		if(cnt==0) {
			//인증번호 생성
			String authNum = randomNum();
			
			//메일 내용 정하기
			edto.setTo(email);
			edto.setFrom("Gether Project <getgetinzng@gmail.com>");
			edto.setSubject("이메일 인증 번호");
			edto.setContents("안녕하세요! 회원 가입 해주셔서 감사합니다.<br> 인증 번호는 <b>"+authNum+"</b>입니다.");
			
			sendEmail(edto);
			logger.info("인증번호: "+authNum);
			session.setAttribute("authNum", authNum);
			return "0";
		}else return "1";
	}
	
	//이메일 인증번호 확인
	@RequestMapping(value = "/emailAuthCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuthCheck(@RequestParam String emailAuth, HttpSession session) throws Exception{
		String authNum = (String) session.getAttribute("authNum");
		
		logger.info("이메일 인증번호 확인");
		logger.info("클라이언트가 입력한 값: "+emailAuth);
		logger.info("인증 번호: "+authNum);
		
		if(emailAuth.equals(authNum)) {
			session.removeAttribute("authNum");
			return "0";
		}
		else return "1";
	}
	
	//이메일 인증 랜덤 숫자
	private String randomNum() {
		String authNum = "";
		for (int i = 0; i < 6; i++) authNum += (int) (Math.random() * 10);
		return authNum;
	}
	
	//메일 보내기
	private JavaMailSenderImpl mailSender;
	@Inject
	public void setmailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}
	
	private void sendEmail(final EmailDTO edto) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(edto.getFrom());
				helper.setTo(edto.getTo());
				helper.setSubject(edto.getSubject());
				helper.setText(edto.getContents(), true);
			}
		};
		mailSender.send(preparator);
	}
	
	//이름 중복 체크
	@RequestMapping(value = "/nameCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String sighUpNameCheck(@RequestParam String name) throws Exception{
		logger.info("Name 중복체크");
		return service.countName(name);
	}
	
	//회원정보 DB에 insert
	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String createAccount(@ModelAttribute MemberDTO mdto, HttpSession session, HttpServletResponse response) throws Exception{
		logger.info("계정 생성");
		logger.info("계정 정보: "+mdto.memberInfo());
		
		int result = service.insertMember(mdto);
		if(result !=0) {
			return "redirect:/member/login.me";
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입에 실패했습니다. 회원가입을 다시 시도해 주세요.');</script>");
			out.flush();
			return "redirect:/member/signUp.me";
		}
	}
}
