package kr.swcore.sdmes.cont;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.swcore.sdmes.cont.dto.ContFileDTO;
import kr.swcore.sdmes.cont.service.ContFileService;
import kr.swcore.sdmes.util.SessionInfoGet;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sdmes.code.service.CodeService;
import kr.swcore.sdmes.cont.dto.ContDTO;
import kr.swcore.sdmes.cont.service.ContService;
import kr.swcore.sdmes.goods.service.GoodsService;
import kr.swcore.sdmes.user.service.UserService;

@Controller
@RequestMapping("/cont/*")
public class ContController {
	
	@Inject
	ContService contService;

	@Inject
	ContFileService contFileService;
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	UserService userService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.setViewName("cont/listview");
		mav.addObject("list01", contService.listCont());
		return mav;
	}
	
	@RequestMapping("reqlistview.do")
	public ModelAndView reqlistview(ModelAndView mav) {
		mav.setViewName("cont/reqlistview");
		mav.addObject("list01", contService.listReq());
		return mav;
	}

	@RequestMapping("porderlistview.do")
	public ModelAndView porderlistview(ModelAndView mav) {
		mav.setViewName("porder/listview");
		mav.addObject("list01", contService.listPorder());
		return mav;
	}
	
	@RequestMapping("listcont.do")
	public ModelAndView listcont(ModelAndView mav) {
		mav.setViewName("cont/listcont");
		mav.addObject("list01", contService.listCont());
		return mav;
	}
	
	@RequestMapping("listreq.do")
	public ModelAndView listreq(ModelAndView mav) {
		mav.setViewName("cont/listreq");
		mav.addObject("list01", contService.listReq());
		return mav;
	}


	@RequestMapping("listporder.do")
	public ModelAndView listporder(ModelAndView mav) {
		mav.setViewName("porder/listcont");
		mav.addObject("list01", contService.listPorder());
		return mav;
	}
	
	
	@RequestMapping("writecont.do")
	public ModelAndView wcont(HttpSession session, ModelAndView mav) {
		Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
		Integer userNo = (Integer) session.getAttribute("userNo");
		mav.setViewName("cont/detailcont");
		mav.addObject("goods", goodsService.listGoods());
		mav.addObject("cust",codeService.listCode02(43));
		mav.addObject("nation",codeService.listCode02(46));
		mav.addObject("pic", userService.listUser());
		mav.addObject("fileList",null);
		mav.addObject("tempFileld", compNo+"-"+userNo+"-"+System.currentTimeMillis());
		return mav;
	}
	
	@RequestMapping("writereq.do")
	public ModelAndView wreq(HttpSession session, ModelAndView mav) {
		Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
		Integer userNo = (Integer) session.getAttribute("userNo");
		mav.setViewName("cont/detailreq");
		mav.addObject("goods", goodsService.listGoods());
		mav.addObject("cust",codeService.listCode02(43));
		mav.addObject("nation",codeService.listCode02(46));
		mav.addObject("pic", userService.listUser());
		mav.addObject("fileList",null);
		mav.addObject("tempFileld", compNo+"-"+userNo+"-"+System.currentTimeMillis());
		return mav;
	}

	
	@RequestMapping("writeporder.do")
	public ModelAndView wporder(ModelAndView mav) {
		mav.setViewName("cont/detailporder");
		mav.addObject("goods", goodsService.listGoods());
		mav.addObject("cust",codeService.listCode02(43));
		return mav;
	}

	
	@RequestMapping("/detail/{contNo}")
	public ModelAndView gddetail(HttpSession session, @PathVariable("contNo") Integer contNo, ModelAndView mav) {
		mav.setViewName("cont/detailcont");
		mav.addObject("dto",contService.contDetail(contNo));
		mav.addObject("goods", goodsService.listGoods());
		mav.addObject("addgoods",contService.listaddGoods(contNo));
		mav.addObject("cust",codeService.listCode02(43));
		mav.addObject("nation",codeService.listCode02(46));
		mav.addObject("pic", userService.listUser());

		Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
		ContFileDTO contDTO = new ContFileDTO();
		contDTO.setContNo(contNo);
		contDTO.setCompNo(compNo);
		mav.addObject("fileList",contFileService.listFile(session, contDTO));
		return mav;
	}
	
	@RequestMapping("/reqdetail/{contNo}")
	public ModelAndView reqdetail(HttpSession session, @PathVariable("contNo") Integer contNo, ModelAndView mav) {
		mav.setViewName("cont/detailreq");
		mav.addObject("dto",contService.contDetail(contNo));
		mav.addObject("goods", goodsService.listGoods());
		mav.addObject("addgoods",contService.listaddGoods(contNo));
		mav.addObject("cust",codeService.listCode02(43));
		mav.addObject("nation",codeService.listCode02(46));
		mav.addObject("pic", userService.listUser());

		Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
		ContFileDTO contDTO = new ContFileDTO();
		contDTO.setContNo(contNo);
		contDTO.setCompNo(compNo);
		mav.addObject("fileList",contFileService.listFile(session, contDTO));
		return mav;
	}

	
	@RequestMapping("/porderdetail/{contNo}")
	public ModelAndView podgddetail(@PathVariable("contNo") Integer contNo, ModelAndView mav) {
		mav.setViewName("porder/detailporder");
		mav.addObject("list1",contService.listaddGoods(contNo));
		return mav;
	}

	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.insertCont(session, dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertreq.do")
	public ResponseEntity<?> insertreq(HttpSession session, @ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.insertReq(session, dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = contService.updateCont(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute ContDTO dto) {
			Map<String, Object> param = new HashMap<String, Object>();
			int codeUpdate = contService.deleteCont(dto);
			if (codeUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}

	@RequestMapping("addgoods.do")
	public ResponseEntity<?> insertaddgoods(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.insertaddGoods(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("deladdgoods.do")
	public ResponseEntity<?> deladdgoods(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.deleteaddgoods(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateaddgoods.do")
	public ResponseEntity<?> updaddgoods(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.updateaddgoods(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("reqOk.do")
	public ResponseEntity<?> reqok(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.reqOk(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("reqRj.do")
	public ResponseEntity<?> reqrj(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.reqRj(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("setPorder.do")
	public ResponseEntity<?> setPorder(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.setPorder(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
}
