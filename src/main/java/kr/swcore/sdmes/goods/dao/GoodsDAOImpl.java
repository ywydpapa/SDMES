package kr.swcore.sdmes.goods.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sdmes.goods.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Inject
	SqlSession sqlSession; 
	
	@Override
	public GoodsDTO goodsDetail(Integer goodsNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goods.detailgoods", goodsNo);
	}

	@Override
	public List<GoodsDTO> listGoods01() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listgoods01");
	}

	@Override
	public Integer insertGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertgoods", dto);
	}

	@Override
	public Integer updateGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("goods.updategoods", dto);
	}

	@Override
	public Integer deleteGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("goods.deletegoods", dto);
	}

	@Override
	public List<GoodsDTO> listGoods() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listgoods");
	}

}
