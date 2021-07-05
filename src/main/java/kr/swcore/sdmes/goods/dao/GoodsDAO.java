package kr.swcore.sdmes.goods.dao;

import java.util.List;

import kr.swcore.sdmes.goods.dto.GoodsDTO;

public interface GoodsDAO {

	GoodsDTO goodsDetail(Integer goodsNo);
	List<GoodsDTO> listGoods01();
	List<GoodsDTO> listGoods();
	Integer insertGoods(GoodsDTO dto);
	Integer updateGoods(GoodsDTO dto);
	Integer deleteGoods(GoodsDTO dto);
}
