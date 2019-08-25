package org.masis.community.member.service;

import java.util.List;

import javax.inject.Inject;

import org.masis.community.member.DAO.MemberDAO;
import org.masis.community.member.domain.MemberDTO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;
	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		return dao.selectMember();
	}

}
