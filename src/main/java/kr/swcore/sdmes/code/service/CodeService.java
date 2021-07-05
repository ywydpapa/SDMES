package kr.swcore.sdmes.code.service;

import java.util.List;

import kr.swcore.sdmes.code.dto.CodeDTO;

public interface CodeService {

	CodeDTO codeDetail(Integer codeNo);
	List<CodeDTO> listCode01();
	List<CodeDTO> listCode02(Integer motherCode);
	List<CodeDTO> listCode03(Integer motherCode);
	Integer insertCode(CodeDTO dto);
	Integer updateCode(CodeDTO dto);
	Integer deleteCode(CodeDTO dto);
}
