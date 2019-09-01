package org.masis.community.member.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.masis.community.member.domain.MemberDTO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "org.masis.community.mybatis.MemberMapper.";
	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		return sqlSession.selectList(Namespace+"selectMember");
	}
	
	@Override
	public MemberDTO selectlogin(MemberDTO mdto) throws Exception {
		return sqlSession.selectOne(Namespace+"selectlogin", mdto);
	}
	
	@Override
	public int countEmail(String email) throws Exception {
		return sqlSession.selectOne(Namespace+"countEmail",email);
	}
	
	@Override
	public String countName(String name) throws Exception {
		return sqlSession.selectOne(Namespace+"countName",name);
	}
}
