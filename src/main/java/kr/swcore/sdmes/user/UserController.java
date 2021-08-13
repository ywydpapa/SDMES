package kr.swcore.sdmes.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sdmes.user.dto.UserDTO;
import kr.swcore.sdmes.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	UserService userService;
	
	@RequestMapping("login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("userRole.do")
	public String urole() {
		return "user/uroleview";
	}

	@RequestMapping("listuser.do")
	public ModelAndView listuser(ModelAndView mav) {
		mav.addObject("list",userService.listUser());
		mav.setViewName("user/listuser");
		return mav;
	}
	
	@RequestMapping(value="/login_check.do")
	public ModelAndView loginCheck(@ModelAttribute UserDTO dto, HttpSession session) {
		boolean result = userService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) {
			UserDTO userInfo = userService.viewUser(dto);
			mav.setViewName("main");
			mav.addObject("msg", "Success");
			session.setAttribute("userId", userInfo.getUserId());
			session.setAttribute("userNo", userInfo.getUserNo());
			session.setAttribute("userName", userInfo.getUserName());
			session.setAttribute("userRole", userInfo.getUserRole());
			session.setAttribute("compNo", userInfo.getCompNo());
			session.setAttribute("userKey", userInfo.getUserKey());
		}else{
			mav.addObject("msg", "Fail");
			mav.setViewName("user/login");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}

	@RequestMapping("chgpasswd.do")
	public String chgpasswd() {
		return "user/passwdChg";
	}
	
	@RequestMapping("updPasswd.do")
	public ResponseEntity<?> userpasswdUpdate(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int userUpdate =userService.updPasswd(dto);
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}

	@RequestMapping("detail/{userId}")
	public ModelAndView detail(@PathVariable("userId") String userId,UserDTO dto,ModelAndView mav) {
		mav.addObject("list",userService.viewUser(dto));
		mav.setViewName("user/detailuser");
		return mav;
	}

	@RequestMapping("listrole.do")
	public ModelAndView listrole(ModelAndView mav) {
		mav.addObject("list",userService.listUser());
		mav.setViewName("user/listrole");
		return mav;
	}
	
	@RequestMapping("detailRole/{userId}")
	public ModelAndView detailRole(@PathVariable("userId") String userId,UserDTO dto, ModelAndView mav) {
		mav.addObject("list",userService.viewUser(dto));
		mav.setViewName("user/detailRole");
		return mav;
	}
	
	@RequestMapping("updRole.do")
	public ResponseEntity<?> userRoleUpdate(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int userUpdate =userService.updRole(dto);
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}
	
	@RequestMapping("detailnew.do")
	public ModelAndView detailnew(ModelAndView mav) {
		mav.setViewName("user/detailuser");
		return mav;
	}

}
