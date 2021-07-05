package kr.swcore.sdmes.goods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.swcore.sdmes.goods.dao.GoodsDAO;
import kr.swcore.sdmes.goods.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Inject
	GoodsDAO goodsDao;
	
	@Override
	public GoodsDTO goodsDetail(Integer goodsNo) {
		// TODO Auto-generated method stub
		return goodsDao.goodsDetail(goodsNo);
	}

	@Override
	public List<GoodsDTO> listGoods01() {
		// TODO Auto-generated method stub
		return goodsDao.listGoods01();
	}

	@Override
	public Integer insertGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertGoods(dto);
	}

	@Override
	public Integer updateGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.updateGoods(dto);
	}

	@Override
	public Integer deleteGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.deleteGoods(dto);
	}

	@Override
	public List<GoodsDTO> listGoods() {
		// TODO Auto-generated method stub
		return goodsDao.listGoods();
	}

}
