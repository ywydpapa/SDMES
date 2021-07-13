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

	// extends DTO
	private String inStoreQty;
	private String outStoreQty;
	private String diffStoreQty;

	// Store DTO temp -> After : extends
	private Integer storeioNo;
	private String inoutTyp;
	private String storeUnit;
	private String storeQty;
	private String locateCode;
	private String codeDesc;
	private String storeAmount;
}
