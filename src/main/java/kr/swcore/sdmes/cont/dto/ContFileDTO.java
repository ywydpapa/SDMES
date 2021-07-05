package kr.swcore.sdmes.cont.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ContFileDTO {
    private String fileId;
    private Integer compNo;
    private String fileName;
    private String fileDesc;
    private byte[] fileContent;
    private String fileType;
    private Integer contNo;
    private Integer insertUserNo;
    private Integer modifyUserNo;
    private Timestamp regDatetime;
    private Timestamp modDatetime;
    private String attrib;
}
