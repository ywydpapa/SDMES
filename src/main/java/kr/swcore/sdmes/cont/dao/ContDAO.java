package kr.swcore.sdmes.cont.dao;

import java.util.List;

import kr.swcore.sdmes.cont.dto.ContDTO;

public interface ContDAO {

	ContDTO contDetail(Integer contNo);
	List<ContDTO> listCont();
	List<ContDTO> listReq();
	List<ContDTO> listPorder();
	Integer insertCont(ContDTO dto);
	Integer insertReq(ContDTO dto);
	Integer updateCont(ContDTO dto);
	Integer updateReq(ContDTO dto);
	Integer reqOk(ContDTO dto);
	Integer reqRj(ContDTO dto);
	Integer deleteCont(ContDTO dto);
	Integer insertaddGoods(ContDTO dto);
	List<ContDTO> listaddGoods(Integer contNo);
	Integer deleteaddgoods(ContDTO dto);
	Integer updateaddgoods(ContDTO dto);
	Integer setPorder(ContDTO dto);
}
