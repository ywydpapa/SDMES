package kr.swcore.sdmes.goods.service;

import java.util.List;

import kr.swcore.sdmes.goods.dto.GoodsDTO;

public interface GoodsService {

	GoodsDTO goodsDetail(Integer goodsNo);
	List<GoodsDTO> listGoods01();
	List<GoodsDTO> listGoods();
	Integer insertGoods(GoodsDTO dto);
	Integer updateGoods(GoodsDTO dto);
	Integer deleteGoods(GoodsDTO dto);
}
