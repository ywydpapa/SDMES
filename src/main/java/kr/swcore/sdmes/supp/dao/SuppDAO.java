package kr.swcore.sdmes.supp.dao;

import java.util.List;

import kr.swcore.sdmes.supp.dto.SuppDTO;

public interface SuppDAO {

	SuppDTO suppDetail(Integer suppNo);
	List<SuppDTO> listSupp01();
	Integer insertSupp(SuppDTO dto);
	Integer updateSupp(SuppDTO dto);
	Integer deleteSupp(SuppDTO dto);
}
