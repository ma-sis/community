package org.masis.community.member.service;

import java.util.List;

import javax.inject.Inject;

import org.masis.community.member.DAO.MemberDAO;
import org.masis.community.member.controller.MemberController;
import org.masis.community.member.domain.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		return dao.selectMember();
	}
	
	@Override
	public MemberDTO selectlogin(MemberDTO mdto) throws Exception {
		return dao.selectlogin(mdto);
	}
	
	@Override
	public int countEmail(String email) throws Exception {
		return dao.countEmail(email);
	}
	
	@Override
	public String countName(String name) throws Exception {
		return dao.countName(name);
	}
	
	@Override
	public int insertMember(MemberDTO mdto) throws Exception {
		return dao.insertMember(mdto);
	}
}
