package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.MemberDTO;
import command.MemberCommandDTO;

public class MemberRepository {
	
	String namespace = "mappers.memberMapper";
	String statement;
	
	@Autowired
	SqlSession sqlSession;
	public void memJoin(MemberDTO memberDTO) {
		statement = namespace + ".Join";
		sqlSession.insert(statement, memberDTO);
	}
	
	public List<MemberCommandDTO> memList() {
		statement = namespace + ".List";
		return sqlSession.selectList(statement);
	}
	
	public MemberDTO memberInformation(String userId) {
		statement = namespace + ".memberInformation";
		return sqlSession.selectOne(statement , userId);
	}
}
