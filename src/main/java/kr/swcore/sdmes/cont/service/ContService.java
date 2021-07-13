package kr.swcore.sdmes.cont.service;

import java.util.List;

import kr.swcore.sdmes.cont.dto.ContDTO;

import javax.servlet.http.HttpSession;

public interface ContService {

	ContDTO contDetail(Integer contNo);
	List<ContDTO> listCont();
	List<ContDTO> listReq();
	List<ContDTO> listPorder();
	Integer insertCont(HttpSession session, ContDTO dto);
	Integer insertReq(HttpSession session, ContDTO dto);
	Integer updateCont(ContDTO dto);
	Integer reqOk(ContDTO dto);
	Integer reqRj(ContDTO dto);
	Integer deleteCont(ContDTO dto);
	Integer insertaddGoods(ContDTO dto);
	List<ContDTO> listaddGoods(Integer contNo);
	Integer deleteaddgoods(ContDTO dto);
	Integer updateaddgoods(ContDTO dto);
	Integer setPorder(ContDTO dto);
}
