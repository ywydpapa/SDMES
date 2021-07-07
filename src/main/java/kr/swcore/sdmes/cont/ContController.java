package kr.swcore.sdmes.cont;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

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

@Controller
@RequestMapping("/cont/*")
public class ContController {
	
	@Inject
	ContService contService;
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.setViewName("cont/listview");
		mav.addObject("list01", contService.listCont());
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

	@RequestMapping("listporder.do")
	public ModelAndView listporder(ModelAndView mav) {
		mav.setViewName("porder/listcont");
		mav.addObject("list01", contService.listPorder());
		return mav;
	}
	
	
	@RequestMapping("writecont.do")
	public ModelAndView wcont(ModelAndView mav) {
		mav.setViewName("cont/detailcont");
		mav.addObject("goods", goodsService.listGoods());
		mav.addObject("cust",codeService.listCode02(43));
		mav.addObject("nation",codeService.listCode02(46));
		mav.addObject("fileList",null);
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
	public ModelAndView gddetail(@PathVariable("contNo") Integer contNo, ModelAndView mav) {
		mav.setViewName("cont/detailcont");
		mav.addObject("dto",contService.contDetail(contNo));
		mav.addObject("goods", goodsService.listGoods());
		mav.addObject("addgoods",contService.listaddGoods(contNo));
		mav.addObject("cust",codeService.listCode02(43));
		mav.addObject("nation",codeService.listCode02(46));
		mav.addObject("fileList",null);
		return mav;
	}
	
	@RequestMapping("/porderdetail/{contNo}")
	public ModelAndView podgddetail(@PathVariable("contNo") Integer contNo, ModelAndView mav) {
		mav.setViewName("porder/detailporder");
		mav.addObject("list1",contService.listaddGoods(contNo));
		return mav;
	}

	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = contService.insertCont(dto);
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
