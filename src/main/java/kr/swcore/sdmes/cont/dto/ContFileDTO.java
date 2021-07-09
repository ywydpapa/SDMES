package kr.swcore.sdmes.cont.dto;

import lombok.Data;

@Data
public class ContFileDTO {
    private String fileId;
    private Integer compNo;
    private String fileName;
    private String fileDesc;
    private byte[] fileContent;
    private Long fileSize;
    private String fileType;
    private Integer contNo;
    private Integer insertUserNo;
    private Integer modifyUserNo;
    private String regDatetime;
    private String modDatetime;
    private String attrib;
}
