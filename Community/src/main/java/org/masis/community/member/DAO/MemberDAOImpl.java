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
	
	private static final String Namespace = "org.masis.community.mybatis.MemberMapper";
	
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		return sqlSession.selectList(Namespace+".selectMember");
	}

}
