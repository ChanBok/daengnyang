package repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.AuthinfoDTO;

public class LoginRepository {
	
	String namespace = "mappers.loginMapper";
	String statement;
	
	@Autowired
	SqlSession sqlSession;
	public AuthinfoDTO login(String userId) {
		statement = namespace + ".login";
		return sqlSession.selectOne(statement, userId);
	}
}
