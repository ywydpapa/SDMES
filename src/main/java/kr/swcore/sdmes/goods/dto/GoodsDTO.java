package kr.swcore.sdmes.goods.dto;

import lombok.Data;

@Data
public class GoodsDTO {
	private Integer goodsNo;
	private String goodsTitle;
	private String goodsModel;
	private String goodsUnit;
	private Integer goodsPrice;
	private String sortNo;
	private String regDate;
	private String modDate;
	private String useYn;
	private String goodsType;
	private String comment;
	private String attrib;
	private String goodsImage;
}
