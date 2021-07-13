package kr.swcore.sdmes.supp;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sdmes.supp.dto.SuppDTO;
import kr.swcore.sdmes.supp.service.SuppService;

@Controller
@RequestMapping("/supp/*")
public class SuppController {
	
	@Inject
	SuppService suppService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.setViewName("supp/listview");
		mav.addObject("list01", suppService.listSupp01(null));
		return mav;
	}
	
	
	@RequestMapping("listSupp01.do")
	public ModelAndView listsupp01(ModelAndView mav) {
		mav.setViewName("supp/list01supp");
		mav.addObject("list01", suppService.listSupp01(null));
		return mav;
	}
	

	@RequestMapping("/suppdetail/{suppNo}")
	public ModelAndView detail(@PathVariable("suppNo") Integer suppNo, ModelAndView mav) {
		mav.setViewName("supp/suppdetail");
		mav.addObject("dto", suppService.suppDetail(suppNo));
		return mav;
	}
	
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute SuppDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = suppService.insertSupp(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {
			param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute SuppDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = suppService.updateSupp(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute SuppDTO dto) {
			Map<String, Object> param = new HashMap<String, Object>();
			int codeUpdate = suppService.deleteSupp(dto);
			if (codeUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
			
	
	
	
	
}
