package org.masis.community.test.service;

import org.masis.community.mybatis.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	@Autowired
	private TestMapper mapper;
	
	public String getName() {
		return mapper.getName();
	}
}
