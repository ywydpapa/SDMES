package kr.swcore.sdmes.code.dto;

import lombok.Data;

@Data
public class CodeDTO {
	private Integer codeNo;
	private Integer compNo;
	private String mesCode;
	private String codeDesc;
	private String codeValue;
	private Integer sortNo;
	private String regDate;
	private String modDate;
	private Integer codeLevel;
	private String useYn;
	private String attrib;
	private Integer motherCode;
}
