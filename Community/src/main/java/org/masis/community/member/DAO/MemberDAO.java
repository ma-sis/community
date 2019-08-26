package org.masis.community.member.DAO;

import java.util.List;

import org.masis.community.member.domain.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> selectMember() throws Exception;
	public MemberDTO selectlogin(MemberDTO mdto) throws Exception;
}
