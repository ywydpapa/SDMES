package kr.swcore.sdmes.user.dto;
import lombok.Data;

@Data
public class UserDTO {
	private Integer userNo;
	private Integer compNo;
	private String userId;
	private String userName;
	private String userPasswd;
	private String userOtp;
	private String userRole;
	private String userKey;
	private String org_id;
	private String regDatetime;
	private String modDatetime;
	private String attrib;
	private String Npasswd;
	private String Ppasswd;
	
}
