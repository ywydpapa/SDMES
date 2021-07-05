package kr.swcore.sdmes.cont.service;

import java.util.List;

import kr.swcore.sdmes.cont.dto.ContDTO;

public interface ContService {

	ContDTO contDetail(Integer contNo);
	List<ContDTO> listCont();
	List<ContDTO> listPorder();
	Integer insertCont(ContDTO dto);
	Integer updateCont(ContDTO dto);
	Integer deleteCont(ContDTO dto);
	Integer insertaddGoods(ContDTO dto);
	List<ContDTO> listaddGoods(Integer contNo);
	Integer deleteaddgoods(ContDTO dto);
	Integer updateaddgoods(ContDTO dto);
	Integer setPorder(ContDTO dto);
}
