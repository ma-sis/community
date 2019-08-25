package org.masis.community.member.service;

import java.util.List;

import org.masis.community.member.domain.MemberDTO;

public interface MemberService {
	public List<MemberDTO> selectMember() throws Exception;
}
