package kr.swcore.sdmes.supp.dto;

import lombok.Data;

@Data
public class SuppDTO {
	private Integer suppNo;
	private String suppTitle;
	private String suppModel;
	private String suppUnit;
	private Integer suppPrice;
	private String sortNo;
	private String regDate;
	private String modDate;
	private String useYn;
	private String suppType;
	private String comment;
	private String attrib;
	private String suppImage;
}
