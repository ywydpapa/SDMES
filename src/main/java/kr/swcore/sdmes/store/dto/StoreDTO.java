package kr.swcore.sdmes.store.dto;

import lombok.Data;

@Data
public class StoreDTO {

	private Integer storeioNo;
	private String inoutTyp;
	private String goodsNo;
	private String suppNo;
	private String storeUnit;
	private String storeQty;
	private String locateCode;
	private String regDate;
	private String modDate;
	private String attrib;
	private String goodsTitle;
	private String goodsUnit;
	private String goodsType;
	private String suppTitle;
	private String suppUnit;
	private String suppType;
	private String goodsModel;
	private String suppModel;
	private String comment;
	private String codeDesc;
	private String storeAmount;
	
	// extends DTO
	private String inStoreQty;
	private String outStoreQty;
	private String diffStoreQty;
}
