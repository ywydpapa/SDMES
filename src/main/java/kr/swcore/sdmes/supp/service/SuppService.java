package kr.swcore.sdmes.supp.service;

import java.util.List;

import kr.swcore.sdmes.supp.dto.SuppDTO;

public interface SuppService {

	SuppDTO suppDetail(Integer goodsNo);
	List<SuppDTO> listSupp01();
	Integer insertSupp(SuppDTO dto);
	Integer updateSupp(SuppDTO dto);
	Integer deleteSupp(SuppDTO dto);
}
